//
//  SongsViewController.swift
//  tableViewCell
//
//  Created by Luat on 8/20/21.
//

import UIKit

class SongsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let jokesStr = "https://api.chucknorris.io/jokes/random"
    let drinksStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"
    let musicStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
    
    var itunesData: iTune? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var musicData: [MusicItem] {
        return itunesData?.feed.results ?? []
    }
    
    var network = NetworkingManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Top Albums"
        tableView.dataSource = self
        let nib = UINib(nibName: "MyCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MyCell")
        tableView.register(UINib(nibName: "LablsOnlyCell", bundle: nil), forCellReuseIdentifier: "LablsOnlyCell")
        network.fetchData(str: musicStr) { model in
            self.itunesData = model
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let hasImage = returnABool(false)
        if hasImage {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? MyCell else {
                fatalError()
                
            }
            let model = musicData[indexPath.row]
            cell.nameLabel.text = model.artistName
            cell.albumNameLabel.text = model.name
            if let imageURL = URL(string: model.artworkUrl100 ?? "") {
                URLSession.shared.dataTask(with: imageURL) { d, r, e in
                    guard let data = d else { return }
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async {
                        cell.myImageView.image = image
                    }
                }.resume()
                
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LablsOnlyCell") as? LablsOnlyCell else { fatalError()
            }
            let model = musicData[indexPath.row]
            cell.nameLabel.text = model.artistName
            cell.albumNameLabel.text = model.name
            return cell
        }

    }
    
    func returnABool(_ bool: Bool) -> Bool {
        return bool
    }
}


