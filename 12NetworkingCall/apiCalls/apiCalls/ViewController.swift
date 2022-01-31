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
        firstLabel.text = "Testing Joke button"
        guard let url = URL(string: jokesStr) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode(JokeModel.self, from: data)
                DispatchQueue.main.async {
                    self.firstLabel.text = parsed.value
                }
            }  catch {
                print(error)
            }
        })
        task.resume()
    }
    
    /// Display the first drink's name
    @IBAction func drinksPressed(_ sender: UIButton) {
        firstLabel.text = "Testing Drinks button"
        guard let url = URL(string: drinksStr) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode(DrinkParent.self, from: data)
                DispatchQueue.main.async {
                    self.firstLabel.text = parsed.drinks[0].strDrink
                }
            }  catch {
                print(error)
            }
        })
        task.resume()
    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        firstLabel.text = "Testing TVShows button"
<<<<<<< HEAD
=======
        guard let url = URL(string: tvShowsStr) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error) in
            guard let data = data else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode([TVModel].self, from: data)
                DispatchQueue.main.async {
                    self.firstLabel.text = parsed[0].name
                }
            } catch {
                print(error)
            }
        })
        task.resume()

>>>>>>> f6a7e57 (Completed API Calls)
    }
    /// Show the artistName from the first result of the response
    @IBAction func musicPressed(_ sender: UIButton) {
        firstLabel.text = "Testing music button"
        guard let url = URL(string: musicStr) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error) in
            guard let data = data else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode(MusicParent.self, from: data)
                DispatchQueue.main.async {
                    self.firstLabel.text = parsed.feed.results[0].artistName
                }
            } catch {
                print(error)
            }
        })
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

struct JokeModel: Decodable {
    let value: String?
}

struct Drink: Decodable {
    let strDrink: String?
}

struct DrinkParent: Decodable {
    let drinks: Array<Drink>
}

struct TVModel: Decodable {
    let name: String?
}

struct MusicResponse: Decodable {
    let results: Array<Results>
}

struct Results: Decodable {
    let artistName: String?
}

struct MusicParent: Decodable {
    let feed: MusicResponse
}



