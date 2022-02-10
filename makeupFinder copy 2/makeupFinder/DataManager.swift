//
//  DataManager.swift
//  makeupFinder
//
//  Created by Rave Bizz on 2/7/22.
//

import Foundation

class DataManager{
    static let shared = DataManager()
    
    
    func setData(with data: [MakeupModel], for fileName: String){
        
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            var usableData = data
            if var currentData = DataManager.shared.getData(for: fileName){
                if fileName == StringConstants.favoritePath.rawValue{
                    for element in data{
                        for model in currentData{
                            if model.name == element.name{
                                break
                            }
                        }
                        currentData.append(contentsOf: data)
                    }
                }else{
                    currentData.append(contentsOf: data)
                }
                let newData = Set(currentData)
                usableData = Array(newData)
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
        }
    }
    
    func getData(for path: String) -> [MakeupModel]?{
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent(path)
            do {
                let fileContents = try String(contentsOf: pathWithFilename, encoding: .utf8)
                let model = DataDecoder.decodeData(for: fileContents)
                if path == StringConstants.favoritePath.rawValue{
                }
                return model
            } catch  {
                print(error.localizedDescription)
            }
        }
        return  nil
    }
}
