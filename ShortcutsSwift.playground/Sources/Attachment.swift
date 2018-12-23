import Foundation

struct Attachment: PropertyListConvertible {
    let uuid: UUID
    let outputName: String?
    let type: String

    var propertyList: PropertyList {
        var dict = PropertyList()
        dict["OutputUUID"] = uuid.uuidString
        dict["OutputName"] = outputName
        dict["Type"] = type
        return dict
    }
}
