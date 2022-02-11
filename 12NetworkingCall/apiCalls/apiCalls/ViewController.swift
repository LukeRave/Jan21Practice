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
    var drinkList: [Drink] = []
    var showFeed: Feed?
    var showList: [Shows] = []
    
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
            print("no data from network call")
            return
        }
        let joke = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("no data from network call")
                return
            }
            self.decodeJoke(data: data)
        }
        joke.resume()
        print("end of handle Tap action")
    }
    
    /// Display the first drink's name
    @IBAction func drinksPressed(_ sender: UIButton) {
        guard let url = URL(string: drinksStr) else {
            print("no data from network call")
            return
        }
        let drink = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("no data from network call")
                return
            }
            self.decodeDrink(data: data)
        }
        drink.resume()
        print("end of handle Tap action")
    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        guard let url = URL(string: tvShowsStr) else {
            print("no data from network call")
            return
        }
        let show = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("no data from network call")
                return
            }
            self.decodeShow(data: data)
            print(data)
        }
        show.resume()
        print("end of handle Tap action")
    }
    
    /// Show the artistName from the first result of the response
    @IBAction func musicPressed(_ sender: UIButton) {
        guard let url = URL(string: musicStr) else {
            print("no data from network call")
            return
        }
        let song = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("no data from network call")
                return
            }
            self.decodeMusic(data: data)
        }
        song.resume()
        print("end of handle Tap action")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }
    
    func decodeJoke(data: Data) {
        do {
            let model = try JSONDecoder().decode(JokeCall.self, from: data)
            print(model)
            DispatchQueue.main.async {
                self.firstLabel.text = model.value
            }
        } catch {
            // decoding error
            print(error)
        }
        
    }
    func decodeDrink(data: Data) {
        do {
            let model = try JSONDecoder().decode(Drinks.self, from: data)
            print(model)
            DispatchQueue.main.async {
                self.drinkList = model.drinks
                let drink: Drink = self.drinkList.first!
                self.firstLabel.text = drink.strDrink
            }
        } catch {
            // decoding error
            print(error)
        }
        
    }
    func decodeShow(data: Data) {
        do {
            let model = try JSONDecoder().decode([Shows].self, from: data)
            print(model)
            DispatchQueue.main.async {
                let show: Shows = model.first!
                self.firstLabel.text = show.name
            }
        } catch {
            // decoding error
            print(error)
        }
        
    }
    func decodeMusic(data: Data) {
        do {
            let model = try JSONDecoder().decode(Response.self, from: data)
            print(model)
            DispatchQueue.main.async {
                self.showFeed = model.feed
                let showList = self.showFeed!.results
                let show: Result = showList.first!
                self.firstLabel.text = show.artistName
            }
        } catch {
            // decoding error
            print(error)
        }
        
    }
    
    
    func configureLabels() {
        firstLabel.isAccessibilityElement = true
        firstLabel.accessibilityIdentifier = "FirstLabel"
        secondLabel.text = ""
    }
    
}


