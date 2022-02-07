//
//  ViewController.swift
//  PersistFavorites
//
//  Created by ravebizz on 2/4/22.
//

import UIKit

class NasaTableViewController: UIViewController, UpdateFavoritesProtocol {
    func UpdateFavorites(row: Int) {
        favorites[row] = true
        UserDefaults.standard.set(favorites, forKey: Constants.UserDefaultKey.favorites)
        tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .fade)
    }
    
    var nasaPhotosModel: NasaFeed?
    var photos: [Photo]? {
        get {
            nasaPhotosModel?.photos ?? []
        }
    }
    var favorites: [Bool] = []
    @IBOutlet weak var tableView: UITableView!
    var nasaPhotosViewModel = NasaFeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: NasaTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: NasaTableViewCell.identifier)
        nasaPhotosViewModel.updateUI = {
            self.tableView.reloadData()}
        nasaPhotosViewModel.getData()
        if let favs = UserDefaults.standard.array(forKey: Constants.UserDefaultKey.favorites) as? [Bool] {
            favorites = favs
        } else {
            var boolArray: [Bool] = []
            for _ in 0..<(photos?.count ?? 0) {
                boolArray.append(false)
            }
            favorites = boolArray
            UserDefaults.standard.set(favorites, forKey: Constants.UserDefaultKey.favorites)
        }
    }

}
extension NasaTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(photos?.count ?? 0)
        return photos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NasaTableViewCell.identifier, for: indexPath) as? NasaTableViewCell else {
            return UITableViewCell()
        }
        
        let photo = photos?[indexPath.row]
        cell.mainLabel.text = String(photo?.id ?? 0)
        print(photo?.id ?? 0)
        cell.heartIcon.isHidden = favorites[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedPhoto = photos?[indexPath.row] else {
            print("Failed to selectPhoto")
            return
        }
        
        if let viewController = storyboard?.instantiateViewController(identifier: "PhotoViewController") as? PhotoViewController {
            viewController.row = indexPath.row
            guard let url = URL(string: selectedPhoto.img_src!) else {
                print("failed to load url")
                return
            }
            viewController.imgSrc = url
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

protocol UpdateFavoritesProtocol {
    func UpdateFavorites(row: Int)
}


