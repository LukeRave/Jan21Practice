//
//  DataManager.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

protocol DataSetter {
    func setData(with data: [MakeupModel], for fileName: String)
}

protocol DataGetter {
    func getData(for path: String) -> [MakeupModel]?
}

protocol DataClearer {
    func clearCartAndFavorites()
}

class DataManager: DataSetter, DataGetter, DataClearer {
    
    func setData(with data: [MakeupModel], for fileName: String){
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            var usableData = data
            if var currentData = getData(for: fileName){
                if fileName == StringConstants.favoritePath.rawValue {
                    var addModel = true
                    for makeupModel in data {
                        for savedModel in currentData {
                            if makeupModel.name == savedModel.name {
                                addModel = false
                            }
                        }
                        if addModel {
                            currentData.append(contentsOf: data)
                        }
                    }
                } else {
                    currentData.append(contentsOf: data)
                }
                usableData = currentData
            }
            
            
            
            let jsonString = DataEncoder.encodeData(for: usableData)
            let pathWithFilename = documentDirectory.appendingPathComponent(fileName)
            do {
                try jsonString?.write(to: pathWithFilename,
                                     atomically: true,
                                     encoding: .utf8)
                print(try! String(contentsOf: pathWithFilename))
            } catch {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadHome"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadCart"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadProducts"), object: nil)
            }
        }
    }
    
    func getData(for path: String) -> [MakeupModel]?{
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent(path)
            do {
                let fileContents = try String(contentsOf: pathWithFilename, encoding: .utf8)
               let model = DataDecoder.decodeData(for: fileContents)
                return model
            } catch  {
                print(error.localizedDescription)
            }
        }
        return  nil
    }
    
    func clearCartAndFavorites() {
        
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let favoritePathWithFilename = documentDirectory.appendingPathComponent(StringConstants.favoritePath.rawValue)
            let cartPathWithFilename = documentDirectory.appendingPathComponent(StringConstants.cartPath.rawValue)
            do {
                try FileManager.default.removeItem(at: favoritePathWithFilename)
                try FileManager.default.removeItem(at: cartPathWithFilename)
            } catch {
                print(error)
            }
        }
    }
    
}
