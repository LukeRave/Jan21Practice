
import Foundation

protocol AnyResource {
    associatedtype ModelType: Decodable
    var url: URL { get }
}
