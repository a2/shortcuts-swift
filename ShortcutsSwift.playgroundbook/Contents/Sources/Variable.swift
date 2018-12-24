import Foundation

public struct Variable: CustomStringConvertible {
    var value: Attachment
    // var serializationType: SerializationType

    public static func actionOutput(name: String? = nil) -> Variable {
        return Variable(value: Attachment(type: "ActionOutput", outputName: name, outputUUID: UUID()))
    }

    public static var askWhenRun: Variable {
        return Variable(value: Attachment(type: "Ask"))
    }

    public static var clipboard: Variable {
        return Variable(value: Attachment(type: "Clipboard"))
    }

    public static var currentDate: Variable {
        return Variable(value: Attachment(type: "CurrentDate"))
    }

    public static var shortcutInput: Variable {
        return Variable(value: Attachment(type: "ExtensionInput"))
    }

    var propertyList: PropertyList {
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
