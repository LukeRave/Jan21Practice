//
//  ViewController.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/4/22.
//

import UIKit

class NasaTableViewController: UIViewController, UpdateFavoritesProtocol {
    func UpdateFavorites(row: Int) {
        print("hello world")
        favorites[row] = !favorites[row]
        UserDefaults.standard.set(favorites, forKey: Constants.UserDefaultKey.favorites)
//        tableView.reloadRows(at: [IndexPath(row: row, section: 1)], with: .fade)
        
        print(favorites)
        tableView.reloadData()
    }
    
    var nasaPhotosModel: NasaFeed?
    var photos: [Photo]? {
        get {
            nasaPhotosModel?.photos ?? []
        }
    }
    var favorites: [Bool] = []
    @IBOutlet weak var tableView: UITableView!
    var nasaFeedViewModel = NasaFeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: NasaTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: NasaTableViewCell.identifier)
        nasaFeedViewModel.updateUI = {
            self.nasaPhotosModel = self.nasaFeedViewModel.nasaPhotosModel
            self.setFavorites()
            self.tableView.reloadData()}
        nasaFeedViewModel.getData()
    }
    
    func setFavorites() {
        if let favs = UserDefaults.standard.array(forKey: Constants.UserDefaultKey.favorites) as? [Bool] {
            favorites = favs
        } else {
            var boolArray: [Bool] = []
            if let cnt = photos?.count, cnt != 0 {
                for _ in 0..<cnt {
                    boolArray.append(false)
                }
                print(boolArray.count)

                UserDefaults.standard.set(boolArray, forKey: Constants.UserDefaultKey.favorites)
                favorites = boolArray
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier)
        let vc: PhotoViewController = segue.destination as! PhotoViewController
        vc.delegate = self
//            vc.spaceImage = cellPhoto
//            vc.newFavoriteId = favoriteId;
//        }
    }
}
extension NasaTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NasaTableViewCell.identifier, for: indexPath) as? NasaTableViewCell else {
            return UITableViewCell()
        }
        
        let photo = photos?[indexPath.row]
        cell.mainLabel.text = String(photo?.id ?? 0)
        if favorites.count != 0 {
            cell.heartIcon.isHidden = !favorites[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedPhoto = photos?[indexPath.row] else {
            print("Failed to selectPhoto")
            return
        }
        let strybrd = UIStoryboard(name: "Main", bundle: nil)
        let photoVC = strybrd.instantiateViewController(withIdentifier: "PhotoView") as! PhotoViewController
        if let urlStr = selectedPhoto.img_src {
            photoVC.imgSrc = URL(string: urlStr)
        }
        photoVC.row = indexPath.row
        photoVC.rowCount = photos?.count
        photoVC.delegate = self
        self.present(photoVC, animated: true, completion: nil)
//            viewController.row = indexPath.row
//            guard let url = URL(string: selectedPhoto.img_src!) else {
//                print("failed to load url")
//                return
//            }
//            viewController.imgSrc = url
//            navigationController?.pushViewController(viewController, animated: true)
    }
}

protocol UpdateFavoritesProtocol {
    func UpdateFavorites(row: Int)
}


