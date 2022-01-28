//
//  ViewController.swift
//  MusicFeedAttempt2
//
//  Created by ravebizz on 1/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    let musicStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
    
    @IBOutlet weak var tableView: UITableView!
    
    var feed: Feed {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

