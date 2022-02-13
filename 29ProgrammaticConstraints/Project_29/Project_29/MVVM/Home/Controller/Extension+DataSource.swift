//
//  Extension+DataSource.swift
//  Project_29
//
//  Created by Rave Bizz on 2/13/22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MusicCell.identifier) as? MusicCell {
            let model = viewModel.list?[indexPath.row]
            
            cell.albumName.text = model?.name
            cell.artistName.text = model?.artistName
            return cell
        }else{
            return UITableViewCell()
        }
    }
}
