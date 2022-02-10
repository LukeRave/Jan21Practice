//
//  ViewController.swift
//  NASAStalker
//
//  Created by Rave Training on 2/4/22.
//

import UIKit

class ViewController: UIViewController {
    var listData: [RoverImageModel] = []
    @IBOutlet weak var NASAimgTableView: UITableView!
    private func refreshTableView() { DispatchQueue.main.async { self.NASAimgTableView.reloadData() } }
    override func viewDidLoad() {
        super.viewDidLoad()
        NASAimgTableView.dataSource = self
        NASAimgTableView.delegate = self
        let nib = UINib(nibName: NASAimgTableViewCell.identifier, bundle: nil)
        NASAimgTableView.register(nib, forCellReuseIdentifier: NASAimgTableViewCell.identifier)
        MainViewModel.shared.retreiveFeedData { data in
            self.listData = data
            self.refreshTableView()
        }
    }
}
extension ViewController: ChangedFavorite {
    func changedIsFavorite(modelIndex: Int) {
        self.dismiss(animated: true, completion: {
            self.listData[modelIndex] = MainViewModel.shared.toggleIsFavorite(model: self.listData[modelIndex])
            self.refreshTableView()
        })
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { print(listData.count); return listData.count }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 110 }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentSingleImage(model: listData[indexPath.row], modelIndex: indexPath.row)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NASAimgTableViewCell.identifier) as? NASAimgTableViewCell else {
            return UITableViewCell()
        }
        let model = listData[indexPath.row]
        guard let imgDate = model.earth_date else { return UITableViewCell() }
        guard let imgID = model.id else { return UITableViewCell() }
        guard let roverName = model.rover?.name else { return UITableViewCell() }
        if let isFavorite = model.isFavorite {
            if isFavorite {
                cell.imageIsFavorite.image = UIImage(systemName: "suit.heart.fill")
            } else {
                cell.imageIsFavorite.image = UIImage(systemName: "suit.heart")
            }
        }
        cell.imageRoverName.text = roverName
        cell.imageIDLabel.text = "\(imgDate) -- \(imgID)"
        return cell
    }
    func presentSingleImage(model: RoverImageModel, modelIndex: Int) {
        if let destination = self.storyboard?.instantiateViewController(withIdentifier: "SingleImageVC") as? SingleImageViewController {
            destination.model = model
            destination.delegate = self
            destination.modelIndex = modelIndex
            guard let strURL = model.img_src else { return }
            imageCache.shared.getImagefromCache(strURL: strURL, completion: { image in
                destination.NASAImage = image
                DispatchQueue.main.async {
                    self.navigationController?.present(destination, animated: true, completion: nil)
                }
            })
        }
    }
}

class imageCache {
    static var shared = imageCache()
    private var cache: NSCache<NSString, UIImage> = NSCache()
    private func setImageToCache(NASAImage: UIImage, strURL: String) {
        cache.setObject(NASAImage, forKey: NSString(string: strURL))
    }
    func getImagefromCache(strURL: String, completion: @escaping(UIImage) -> Void) {
        guard let cacheImage = cache.object(forKey: NSString(string: strURL)) else {
            NetworkManager.shared.makeIMGRequest(strURL: strURL, completion: { data in
                guard let imgData = UIImage(data: data) else { return }
                self.setImageToCache(NASAImage: imgData, strURL: strURL)
                print("image downloaded and saved to cache")
                completion(imgData)
            })
            return
        }
        print("image retrieved from cache")
        completion(cacheImage)
    }
}
