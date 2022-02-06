//
//  ViewController.swift
//  NASAUserDefaults
//
//  Created by Isaac Farr on 2/5/22.
//

import UIKit
import CoreData

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
    
    let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=jrfuu3p2faKl4kUyUfbnscx3MD9fQX2y23EFi3TF"
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var favoriteId: Int?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fetchData()
        loadFavorites()
    }
    
    func addFavorite(favorite: Favorite){
        
        if !favoritesArray.contains(where: {$0.id == favorite.id}){
        favoritesArray.append(favorite)
        } else {
            favoritesArray = favoritesArray.filter { $0.id != favorite.id }
        }
        
//        For clearing Favorite Entity in Core Data
//        for fav in favoritesArray {
//            context.delete(fav)
//        }
        saveFavorites()
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
        
        let task = URLSession.shared.dataTask(with: safeUrl) { data, response, error in
            guard let data = data else { return }
            let decoded = self.decodeData(data: data, type: PhotosModel.self)
            // shows how many more API requests can be made on demo key
            if let httpResponse = response as? HTTPURLResponse {
                if let remaining = httpResponse.allHeaderFields["X-RateLimit-Limit"] as? String {
                    print("\(remaining) API calls remaining")
                }
            }

            guard let decodedPhotos = decoded?.photos else { return }
            self.photoArray = decodedPhotos
        }
            task.resume()
        
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
        
        guard let safeView = cell.imageView else { return cell }
        
        if favoritesArray.contains(where: {$0.id == entryId}) {
            safeView.isHidden = !safeView.isHidden
        } else {
            safeView.isHidden = true
        }
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let entry = photoArray?[indexPath.row]
        
        imageUrl = entry?.imgSrc
        favoriteId = entry?.id
        performSegue(withIdentifier: "DetailView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailView" {
            let vc: DetailVC = segue.destination as! DetailVC
            vc.delegate = self
            vc.spaceImage = imageUrl
            vc.newFavoriteId = favoriteId;
        }
    }
    
    func saveFavorites(){
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
        tableView.reloadData()
        print("This is the favorites array: \(favoritesArray) ---------")
    }
    
    func loadFavorites(with request: NSFetchRequest<Favorite> = Favorite.fetchRequest()) {
        
        request.predicate = nil
        do {
            favoritesArray = try context.fetch(request)
        } catch {
            print("Error fetching data: \(error)")
        }
        tableView.reloadData()
    }
}

protocol FavoriteUpdateDelegate {
    func addFavorite(favorite: Favorite)
}
