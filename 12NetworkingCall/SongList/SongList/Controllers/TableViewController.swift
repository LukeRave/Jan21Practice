//
//  TableViewController.swift
//  SongList
//
//  Created by ravebizz on 1/27/22.
//

import UIKit

class TableViewController: UITableViewController {

    var list: [MusicItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        print(list)
        let nib = UINib(nibName: MusicCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MusicCell.identifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicCell.identifier, for: indexPath) as? MusicCell else {
            return UITableViewCell()
        }
        
        let musicItem = list[indexPath.row]
        
        cell.artistNameLabel.text = musicItem.artistName
        cell.albumNameLabel.text = musicItem.albumName
        cell.albumImageView.image = musicItem.albumImage
        
        return cell
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//    }

}
