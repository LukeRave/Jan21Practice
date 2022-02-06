//
//  ViewController.swift
//  NASAUserDefaults
//
//  Created by Isaac Farr on 2/5/22.
//

import UIKit

class QueryListVC: UITableViewController, FavoriteUpdateDelegate {
    
    var imageUrl: String?
    
    var photoArray: [Photo]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var favoritesArray = [Favorite]()
    
    let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=DEMO_KEY&sol=2000&page=1"

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fetchData()
    }
    
    func addFavorite(favorite: Favorite){
        favoritesArray.append(favorite)
    }

    func decodeData<T: Decodable>(data: Data, type: T.Type) -> T? {
        do {
            return try JSONDecoder().decode(type.self, from: data)
        } catch {
            print("An error occured while decoding \(error)")
            return nil
        }
    }
    
    func fetchData(){
        guard let safeUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: safeUrl) { data, response, error in
            guard let data = data else { return }
            let decoded = self.decodeData(data: data, type: PhotosModel.self)
            guard let decodedPhotos = decoded?.photos else { return }
            self.photoArray = decodedPhotos
        }.resume()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoArray?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QueryEntryCell", for: indexPath)
        cell.imageView?.image = UIImage(systemName: "heart.fill")
        
        let entry = photoArray?[indexPath.row]
        guard let entryId = entry?.id else { return cell }
        cell.textLabel?.text = String(entry?.id ?? 0)
        
        if favoritesArray.contains(where: {$0.id == entryId}) {
            cell.imageView?.isHidden = false
        } else {
            cell.imageView?.isHidden = true
        }
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let entry = photoArray?[indexPath.row]
        
        imageUrl = entry?.imgSrc
        performSegue(withIdentifier: "DetailView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailView" {
            let vc: DetailVC = segue.destination as! DetailVC
            vc.delegate = self
            vc.spaceImage = imageUrl
        }
    }
}

protocol FavoriteUpdateDelegate {
    func addFavorite(favorite: Favorite)
}
