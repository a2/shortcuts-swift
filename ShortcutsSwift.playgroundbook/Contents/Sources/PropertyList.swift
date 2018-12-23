import Foundation

public typealias PropertyList = [String: Any]

public protocol PropertyListConvertible {
    var propertyList: PropertyList { get }
}
