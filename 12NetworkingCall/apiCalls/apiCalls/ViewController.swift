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
    }
    
    /// Display the first drink's name
    @IBAction func drinksPressed(_ sender: UIButton) {
        firstLabel.text = "Testing Drinks button"
    }
    
    /// Show the name of the first episode
    @IBAction func tvShowsPressed(_ sender: UIButton) {
        firstLabel.text = "Testing TVShows button"
        decoding()

    }
    /// Show the artistName from the first result of the response
    @IBAction func musicPressed(_ sender: UIButton) {
        firstLabel.text = "Testing music button"
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
    
    weak var luke: ViewController?
    
    func testing() {
        let ituneOne = iTune(feed: SomeObject(title: "", results: [SomeOtherObject(artistName: "asdf")]))
        
        ituneOne.feed.results.first?.artistName
    }
    
    func decoding() {
        let data = Data()
        do {
            let decodedShowsArray = try JSONDecoder().decode([Show].self, from: data)
        } catch {
            print(error)
        }
    }
    
}

struct Show: Decodable {
    let id: Int?
    let name: String?
}

struct iTune: Encodable & Decodable {
    let feed: SomeObject
}

struct SomeObject: Codable {
    let title: String?
    let results: [SomeOtherObject]
}

struct SomeOtherObject: Codable {
    let artistName: String?
}
