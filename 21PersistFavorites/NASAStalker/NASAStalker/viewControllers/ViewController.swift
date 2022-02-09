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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NASAimgTableView.dataSource = self
        NASAimgTableView.delegate = self
        let nib = UINib(nibName: NASAimgTableViewCell.identifier, bundle: nil)
        NASAimgTableView.register(nib, forCellReuseIdentifier: NASAimgTableViewCell.identifier)
        MainViewModel.shared.retreiveFeedData { data in
            self.listData = data
            DispatchQueue.main.async {
                self.NASAimgTableView.reloadData()
            }
        }
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { print(listData.count); return listData.count }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 110 }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listData[indexPath.row] = MainViewModel.shared.toggleIsFavorite(model: listData[indexPath.row])
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
}
