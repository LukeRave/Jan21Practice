//
//  ViewController.swift
//  SongList
//
//  Created by ravebizz on 1/27/22.
//

import UIKit

class ViewController: UIViewController {

    let musicStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var music: Music?
    
    var albums: [MusicResult] {
        get {
            music?.feed?.results ?? []
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let url = URL(string: musicStr) else {
            return
        }
        
        guard let vc = segue.destination as? TableViewController else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("no data from network call")
                return
            }
//            print(data)
            self.decodeMyData(data: data)
        }

        task.resume()
        print("end of handle Tap action")
        
        
    }
    
    func decodeMyData(data: Data) {
        do {
            let model = try JSONDecoder().decode(Music.self, from: data)
            print(model)
            self.music = model
        } catch {
            print(error)
        }
        
    }
}

