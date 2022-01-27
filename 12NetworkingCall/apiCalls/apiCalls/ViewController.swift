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
    
    @IBAction func jokesPressed(_ sender: UIButton) {
        guard let url = URL(string: jokesStr) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {print(error ?? "No Data");return}
            do {
                let model = try JSONDecoder().decode(jokeModel.self, from: data)
                DispatchQueue.main.async {
                    self.firstLabel.text = model.value!
                }
            } catch { print(error) }
        }
        task.resume()
    }
    /// Display the first drink's name
    @IBAction func drinksPressed(_ sender: UIButton) {
        guard let url = URL(string: drinksStr) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {print(error ?? "No Data");return}
            do {
                let model = try JSONDecoder().decode(drinkModel.self, from: data)
                DispatchQueue.main.async {
                    self.firstLabel.text = model.drinks[0]?.strDrink
                }
            } catch { print(error) }
        }
        task.resume()
    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        guard let url = URL(string: tvShowsStr) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {print(error ?? "No Data");return}
            do {
                let model = try JSONDecoder().decode([Show].self, from: data)
                DispatchQueue.main.async {
                    self.firstLabel.text = model.first!.name
                }
            } catch { print(error) }
        }
        task.resume()
    }
    
    /// Show the artistName from the first result of the response
    @IBAction func musicPressed(_ sender: UIButton) {
        guard let url = URL(string: musicStr) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {print(error ?? "No Data");return}
            do {
                let model = try JSONDecoder().decode(musicFeed.self, from: data)
                DispatchQueue.main.async {
                    self.firstLabel.text = model.feed.results[0].artistName
                }
            } catch { print(error) }
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

struct jokeModel: Decodable {
    let value: String?
}
struct Drink: Decodable {
    let strDrink: String?
}
struct drinkModel: Decodable {
    let drinks: [Drink?]
}
struct Show: Decodable {
    let name: String?
}
struct musicData: Decodable {
    let artistName: String?
}
struct musicFeedData: Decodable {
    let results: [musicData]
}
struct musicFeed: Decodable {
    let feed: musicFeedData
}
