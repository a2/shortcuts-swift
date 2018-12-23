import Foundation

public struct Variable: PropertyListConvertible, CustomStringConvertible {
    var value: Attachment
    // var serializationType: SerializationType

    public static func actionOutput(name: String? = nil) -> Variable {
        return Variable(value: Attachment(uuid: UUID(), outputName: name, type: "ActionOutput"))
    }

    public var propertyList: PropertyList {
        return [
            "Value": value.propertyList,
            // "WFSerializationType": type
        ]
    }

    public var description: String {
        let data = try! JSONSerialization.data(withJSONObject: value.propertyList)
        return "\u{fffc}\(String(decoding: data, as: UTF8.self))\u{fffd}"
    }
}
