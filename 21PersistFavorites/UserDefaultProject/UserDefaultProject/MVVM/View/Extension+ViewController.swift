//
//  Extension+ViewController.swift
//  UserDefaultProject
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate, Favor {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataViewCell.identifier) as? DataViewCell else {
            return UITableViewCell()
        }
        let model = photos[indexPath.row]
        cell.idNumber.text = "\(model.id ?? 0)"
        cell.date.text = String(describing: model.date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Image", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: ImageViewController.identifier) as? ImageViewController
        let model = photos[indexPath.row]
        vc?.id = model.id ?? 0
        vc?.delegate = self
        if let imgUrl = model.imgUrl, let url = URL(string: imgUrl){
            URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                guard let data = data else{
                    return
                }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    vc?.img.image = image
                }
            }).resume()
        }
        print("cell pressed")
        //TODO: set property for row in vc
        vc?.cellId = model.id
        navigationController?.pushViewController(vc ?? ImageViewController(), animated: true)
    }
    func updateFavorite(row: Int) {
        let table = self.tableView
        let cell = table?.cellForRow(at: <#T##IndexPath#>)
        
    }
}
