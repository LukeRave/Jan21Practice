//
//  CartVC+delegate.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/3/22.
//

import Foundation
import UIKit
extension CartViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Contstants.cellSize
    }
}
