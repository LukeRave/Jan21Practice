//
//  ViewController.swift
//  MusicFeedTable
//
//  Created by ravebizz on 1/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    let musicStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFeed()
        tableView.dataSource = self
        tableView.register(UINib(nibName: MusicViewCell.identifier , bundle: nil), forCellReuseIdentifier: MusicViewCell.identifier)
    }
    
    var feed: FeedResponse? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var albums: [AlbumModel] {
        get {
            feed?.feed?.results ?? []
        }
    }
    
    func getFeed() {
        if let url = URL(string: musicStr) {
            let task = URLSession.shared.dataTask(with: url) { d, r, e in
                guard let data = d else {
                    return
                }
                do {
                    self.feed = try JSONDecoder().decode(FeedResponse.self, from: data)
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicViewCell.identifier) as? MusicViewCell else {
            return UITableViewCell()
        }
        
        let album = albums[indexPath.row]
        
        cell.topLabel.text = album.name
        cell.bottomLabel.text = album.artistName
        
        if let imageStr = album.imageUrl, let imageUrl = URL(string: imageStr) {
            let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                guard let data = data else {
                    print("No data in response")
                    return
                }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.albumImageView?.image = image
                }
            }
            task.resume()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
}

