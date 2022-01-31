//
//  ViewController.swift
//  apiCalls
//
//  Created by Luat on 8/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    let jokesStr = "https://api.chucknorris.io/jokes/random"
    let drinksStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"
    let musicStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
    
    func decodeData<T: Decodable>(data: Data, type: T.Type) -> T? {
        do {
            return try JSONDecoder().decode(type.self, from: data)
        } catch {
            print("JSON decode error:", error)
            return nil
        }
    }

    /// Display the joke in firstLabel.text
    /// 1. Make API call to jokes url with URLSession
    /// 2. Parse the JSON data using Codable protocol
    /// 3. Update firstLabel in the main thread with text from response
    @IBAction func jokesPressed(_ sender: UIButton) {
        guard let url = URL(string: jokesStr) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let decoded = self.decodeData(data: data, type: JokeModel.self);
            DispatchQueue.main.async{
            self.firstLabel.text = decoded?.value
            }
        }
        
        task.resume()
    }
    
    /// Display the first drink's name
    @IBAction func drinksPressed(_ sender: UIButton) {
        guard let url = URL(string: drinksStr) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let decoded = self.decodeData(data: data, type: DrinksModel.self);
            DispatchQueue.main.async {
                self.firstLabel.text = decoded?.drinks?.first?.strDrink
            }
        }
        
        task.resume()
    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        guard let url = URL(string: tvShowsStr) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let decoded = self.decodeData(data: data, type: [EpisodesModel].self)
            DispatchQueue.main.async {
                if let episodes = decoded {
                    self.firstLabel.text = episodes.first?.name;
                }
            }
        }
        task.resume()
    }
    /// Show the artistName from the first result of the response
    @IBAction func musicPressed(_ sender: UIButton) {
        guard let url = URL(string: musicStr) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let decoded = self.decodeData(data: data, type: AlbumsModel.self)
            DispatchQueue.main.async {
                if let albums = decoded {
                    if let results = albums.feed?.results {
                    self.firstLabel.text = results[1]?.artistName ?? ""
                    }
                }
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }

    func configureLabels() {
        firstLabel.isAccessibilityElement = true
        firstLabel.accessibilityIdentifier = "FirstLabel"
        secondLabel.text = ""
    }
    
}
