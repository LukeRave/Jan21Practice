//
//  ViewController.swift
//  TableWithImageCell
//
//  Created by Luat on 1/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    let musicStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
    @IBOutlet weak var tableView: UITableView!
    
    var feed: FeedResponse? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var songs: [AlbumModel] {
        get {
            feed?.feed?.results ?? []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFeed()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SongCell", bundle: nil), forCellReuseIdentifier: "SongCell")
    }
    
    func getFeed() {
        if let url = URL(string: musicStr) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    // handle error
                    return
                }
                
                guard let urlResponse = response as? HTTPURLResponse, urlResponse.statusCode == 200 else {
                    // status code error
                    return
                }
                do {
                    let feedResponse = try JSONDecoder().decode(FeedResponse.self, from: data)
                    self.feed = feedResponse
                } catch {
                    // Decoding error
                    print(error)
                }
            }
            task.resume()
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell") as? SongCell else {
            return UITableViewCell()
        }
        
        let model = songs[indexPath.row]
        cell.topLabel.text = model.name
        cell.bottomLabel.text = model.artistName
        
        if let imageStr = model.imageUrl, let url = URL(string: imageStr) {
            URLSession.shared.dataTask(with: url) { d, r, e in
                guard let data = d else {
                    return
                }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.songImageView?.image = image
                }
            }.resume()
        }
        
        return cell
    }
}
