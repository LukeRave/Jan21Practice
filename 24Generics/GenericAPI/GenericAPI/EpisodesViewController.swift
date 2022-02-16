//
//  EpisodesViewController.swift
//  GenericAPI
//
//  Created by Luat on 2/7/22.
//

import UIKit

struct Episode: Decodable {
    let name: String?
    let season: Int?
    let numer: Int?
}

class EpisodesViewController: UITableViewController {

    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"
    var episodes: [Episode]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let network = NetworkingManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Friends Episodes"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        network.fetchData(str: tvShowsStr) { model in
            self.episodes = model
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let episodeTitle = episodes?[indexPath.row].name
        cell.textLabel?.text = episodeTitle
        return cell
    }
    

    
}
