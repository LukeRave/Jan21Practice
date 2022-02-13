//
//  Extension+DataSource.swift
//  Project_29
//
//  Created by Rave Bizz on 2/13/22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate{
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Details", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: DetailsViewController.identifier) as? DetailsViewController
        let model = viewModel.list?[indexPath.row]
        
        if let imgUrl = model?.imgUrl, let url = URL(string: imgUrl){
            URLSession.shared.dataTask(with: url){ data, response, error in
                guard let data = data else{
                    return
                }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    vc?.albumView.image = image
                }
            }.resume()
        }
        navigationController?.pushViewController(vc ?? DetailsViewController(), animated: true)
    }
}
