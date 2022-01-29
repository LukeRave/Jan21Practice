//
//  ViewController.swift
//  listMusic
//
//  Created by Rave Bizz on 1/29/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var feed: Response? {
        didSet {
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    var song: [Result] {
        get {
            ///feed is the variable being set to hold the "Response" model that's going to hold the data from the urlRequest
            ///The Respose Model struct has a feed property that holds the feed from the url
            ///The feed property has a property, results, that holds the array of albumdata from the result array nested in the feed object
            feed?.feed?.results ?? []
        }
    }
    
    let musicStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getFeed()
        tableView.dataSource = self
        let nib = UINib(nibName: musicCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: musicCell.identifier)
    }

    func getFeed(){
        //set url
        if let url = URL(string: musicStr){
            //grab data
            let task = URLSession.shared.dataTask(with: url){ data, response, error in
                guard let data = data else {
                    //return error
                    return
                }
                //using the data variable, set data to matching nested values
                do {
                    let feedResponse = try JSONDecoder().decode(Response.self, from: data)
                    self.feed = feedResponse
                } catch{
                    print(error)
                }
            }
            task.resume()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return song.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: musicCell.identifier) as? musicCell else {
            return UITableViewCell()
        }
        //set model for each row
        let model = song[indexPath.row]
        
        cell.artistName.text = model.artistName
        cell.songName.text = model.name
        
        if let imgStr = model.imageUrl, let url = URL(string: imgStr){
            URLSession.shared.dataTask(with: url){ data, response, error in
                guard let data = data else {
                    return
                }
                
                let image = UIImage(data: data)
                DispatchQueue.main.async{
                    cell.albumCover.image = image
                }
            }.resume()
        }
        return cell
    }
}


