import UIKit
import Foundation

var greeting = "Hello, playground"

// MARK: - Singleton
final class NetworkManager {
    /// Protect from creating more than 1 instance
    private init() {}
    
    /// Type- level access to a shared instance
    static let shared = NetworkManager()
}

struct Constants {
    struct UserDefaultKey {
        static let userName = "UserName"
        static let simpleStruct = "SimpleStruct"
    }
}

// MARK: - UserDefaults
var name = "something name"
UserDefaults.standard.set(name, forKey: Constants.UserDefaultKey.userName)
let loadedName = UserDefaults.standard.string(forKey: Constants.UserDefaultKey.userName)
print(loadedName)

struct Simple: Codable {
    var name = "name"
}
let mySimple = Simple()
let data = try! JSONEncoder().encode(mySimple)
UserDefaults.standard.set(data, forKey: Constants.UserDefaultKey.simpleStruct)
let loadedStructDataObj = UserDefaults.standard.object(forKey: Constants.UserDefaultKey.simpleStruct)
let loadedStructData = UserDefaults.standard.data(forKey: Constants.UserDefaultKey.simpleStruct)

print(loadedStructDataObj)

guard let loadedStructData = loadedStructData else { fatalError() }

let decoded = try? JSONDecoder().decode(Simple.self, from: loadedStructData)
type(of: decoded)
print("decoded name:", decoded?.name)


// MARK: - Cache
class ViewController {
}

class Singleton {
    
    var cache: NSCache<NSString, UIImage> = NSCache()
    
    func saveImageToCache() {
        cache.setObject(<#T##obj: UIImage##UIImage#>, forKey: <#T##NSString#>) //setter
        cache.object(forKey: <#T##NSString#>) // getter
    }
    /// 1. check cache for image
    /// 2. If no image -> then make network call
    /// 3. save image to cache once network is finish
}
