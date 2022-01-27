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
    
    /// Display the joke in firstLabel.text
    /// 1. Make API call to jokes url with URLSession
    /// 2. Parse the JSON data using Codable protocol
    /// 3. Update firstLabel in the main thread with text from response
    @IBAction func jokesPressed(_ sender: UIButton) {
        guard let url = URL(string: jokesStr) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data from network call")
                return
            }
            self.decodeMyJokeData(data: data)
        }
        task.resume()
    }
    
    /// Display the first drink's name
    @IBAction func drinksPressed(_ sender: UIButton) {
        guard let url = URL(string: drinksStr) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data from network call")
                return
            }
            self.decodeMyDrinksData(data: data)
        }
        task.resume()
    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        guard let url = URL(string: tvShowsStr) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data from network call")
                return
            }
            self.decodeMyTVShowsData(data: data)
        }
        task.resume()
    }
    /// Show the artistName from the first result of the response
    @IBAction func musicPressed(_ sender: UIButton) {
        guard let url = URL(string: musicStr) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data from network call")
                return
            }
            self.decodeMyMusicData(data: data)
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
    
    func decodeMyJokeData(data: Data) {
        do {
            let model = try JSONDecoder().decode(Joke.self, from: data)
            print(model)
            DispatchQueue.main.async {
                self.firstLabel.text = model.value
            }
        } catch {
            print(error)
        }
        
    }
    func decodeMyDrinksData(data: Data) {
        do {
            let model = try JSONDecoder().decode(Drinks.self, from: data)
            print(model)
            DispatchQueue.main.async {
                if let strDrink = model.drinks?.first?.strDrink {
                    self.firstLabel.text = strDrink
                }
            }
        } catch {
            print(error)
        }
        
    }
    func decodeMyTVShowsData(data: Data) {
        do {
            guard let dataAsString = String(data: data, encoding: .utf8) else {
                return
            }
            print(dataAsString)
            let model = try JSONDecoder().decode([TVShow].self, from: data)
            print(model)
            DispatchQueue.main.async {
                if let tvShowName = model.first?.name {
                    self.firstLabel.text = tvShowName
                }
            }
        } catch {
            print(error)
        }
        
    }
    
    func decodeMyMusicData(data: Data) {
        do {
            let model = try JSONDecoder().decode(Music.self, from: data)
            print(model)
            DispatchQueue.main.async {
                if let artist = model.feed?.results?.first?.artistName {
                    self.firstLabel.text = artist
                }
            }
        } catch {
            print(error)
        }
        
    }
}
