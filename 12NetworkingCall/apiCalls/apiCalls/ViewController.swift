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
                print("no data from network call")
                return
            }
            //            print(data)
            decodeMyData(data: data)
        }
        
        task.resume()
        print("end of handle Tap action")
        
        func decodeMyData(data: Data) {
            do {
                let model = try JSONDecoder().decode(JokeModel.self, from: data)
                print(model)
                DispatchQueue.main.async {
                    self.firstLabel.text = model.value
                }
            } catch {
                print(error)
            }
        }
    }
    
    /// Display the first drink's name
    @IBAction func drinksPressed(_ sender: UIButton) {
        guard let url = URL(string: drinksStr) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("no data from network call")
                return
            }
            //            print(data)
            decodeMyData(data: data)
        }
        
        task.resume()
        print("end of handle Tap action")
        
        func decodeMyData(data: Data) {
            do {
                let model = try JSONDecoder().decode(DrinkModel.self, from: data)
                print(model)
                DispatchQueue.main.async {
                    self.firstLabel.text = model.drinks[0].strDrink
                }
            } catch {
                print(error)
            }
        }
    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        guard let url = URL(string: tvShowsStr) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("no data from network call")
                return
            }
            //            print(data)
            decodeMyData(data: data)
        }
        
        task.resume()
        print("end of handle Tap action")
        
        func decodeMyData(data: Data) {
            do {
                let model = try JSONDecoder().decode([TVShowModel].self, from: data)
                print(model)
                if model[0].number == 1 {
                    DispatchQueue.main.async {
                        self.firstLabel.text = model[0].name!
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    /// Show the artistName from the first result of the response
    @IBAction func musicPressed(_ sender: UIButton) {
        guard let url = URL(string: musicStr) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("no data from network call")
                return
            }
            //            print(data)
            decodeMyData(data: data)
        }
        
        task.resume()
        print("end of handle Tap action")
        
        func decodeMyData(data: Data) {
            do {
                let model = try JSONDecoder().decode(Response.self, from: data)
                print(model)
                DispatchQueue.main.async {
                    self.firstLabel.text = model.feed.results[0].artistName
                }
            } catch {
                print(error)
            }
        }
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


