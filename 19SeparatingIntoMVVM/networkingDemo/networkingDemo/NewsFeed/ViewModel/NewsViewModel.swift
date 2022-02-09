//
//  NewsViewModel.swift
//  networkingDemo
//
//  Created by Luat on 2/3/22.
//

import Foundation

/// Should not touch any UI elements
class NewsViewModel {
    private var newsModel: NewsModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI(self.newsModel)
            }
        }
        willSet {
            print("new data \(String(describing: newValue))")
        }
    }
    
    private var network = NetworkManager()
    
    var updateUI: (NewsModel?) -> Void = { _ in }
    
    func updateData() {
        network.getData { model in
            self.newsModel = model
        }
    }
    
    
    
}
