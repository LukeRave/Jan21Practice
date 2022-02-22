//
//  ProductListViewController.swift
//  EComApp
//
//  Created by Luat on 1/26/22.
//

import UIKit

class ProductListViewController: UIViewController {

    var inventory = Inventory.createInventory()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        inventory.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = inventory.products[indexPath.row]?.name
        cell.contentConfiguration = content
        return cell
    }
    
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /// Note: Method 1
        /// Create controller instances based on availability
//        if #available(iOS 15, *) {
//            /// Apple BottomSheet
//            let vc = AppleSheetViewController()
//            if let sheet = vc.sheetPresentationController {
//                sheet.detents = [.medium(), .large()]
//            }
//            present(vc, animated: true, completion: nil)
//        } else {
//            /// Custom BottomSheet
//            let customBottomSheet = ProductDetailViewController()
//            customBottomSheet.modalPresentationStyle = .overCurrentContext
//            present(customBottomSheet, animated: false, completion: nil)
//        }
        
        
        /// Note: Method 2 -  Comment out Method 1
        /// Abstract Factory to create controller based on availability
        let vc = BottomSheetFactory.createBottomSheetController()
        present(vc, animated: vc.shouldAnimate)
    }
}
