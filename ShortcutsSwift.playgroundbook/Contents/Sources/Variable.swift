import Foundation

public class Variable: CustomStringConvertible {
    public var value: Attachment

    public init(value: Attachment) {
        self.value = value
    }

    var propertyList: PropertyList {
        return [
            "WFSerializationType": "WFTextTokenAttachment",
            "Value": value.propertyList
        ]
    }

    public func with(dateFormat: Aggrandizement.DateFormatStyle) -> Variable {
        let result = Variable(value: value)
        result.value.aggrandizements = [.coercion(class: .date), .dateFormat(dateFormat)]
        return result
    }

    public func with(propertyName: Aggrandizement.PropertyName, userInfo: Aggrandizement.PropertyUserInfo) -> Variable {
        let result = Variable(value: value)
        result.value.aggrandizements = [.property(name: propertyName, userInfo: userInfo)]
        return result
    }

    public func with(valueForKey key: String?) -> Variable {
        let result = Variable(value: value)
        result.value.aggrandizements = [.coercion(class: .dictionary), .dictionaryValue(key: key)]
        return result
    }

    public func with(type: Aggrandizement.CoercionItemClass) -> Variable {
        let result = Variable(value: value)
        result.value.aggrandizements = [.coercion(class: type)]
        return result
    }

    public final var description: String {
        let data = try! JSONSerialization.data(withJSONObject: value.propertyList)
        return "\u{fffc}\(String(decoding: data, as: UTF8.self))\u{fffd}"
    }
}

public class ActionOutputVariable: Variable {
    public init(name: String? = nil) {
        super.init(value: Attachment(type: "ActionOutput", outputName: name, outputUUID: UUID()))
    }
}

public func actionOutput(name: String? = nil) -> ActionOutputVariable {
    return ActionOutputVariable(name: name)
}

public func askWhenRun() -> Variable {
    return Variable(value: Attachment(type: "Ask"))
}

public func clipboard() -> Variable {
    return Variable(value: Attachment(type: "Clipboard"))
}

public func currentDate() -> Variable {
    return Variable(value: Attachment(type: "CurrentDate"))
}

public func shortcutInput() -> Variable {
    return Variable(value: Attachment(type: "ExtensionInput"))
}
