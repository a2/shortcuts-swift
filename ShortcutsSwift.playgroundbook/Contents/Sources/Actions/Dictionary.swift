import Foundation

enum ItemType: Int {
    case string = 0
    case dictionary = 1
    case array = 2
    case number = 3
    case boolean = 4
}

public enum DictionaryValue {
    case string(String)
    case number(Number)
    case boolean(Bool)
    case dictionary([String: DictionaryValue])
    case array([DictionaryValue])

    var propertyList: PropertyList {
        switch self {
        case .string(let string):
            return [
                "WFItemType": ItemType.string.rawValue,
                "WFValue": [
                    "Value": ["string": string, "attachmentsByRange": [:]],
                    "WFSerializationType": "WFTextTokenString"
                ]
            ]
        case .number(let number):
            return [
                "WFItemType": ItemType.number.rawValue,
                "WFValue": [
                    "Value": ["string": "\(number)", "attachmentsByRange": [:]],
                    "WFSerializationType": "WFTextTokenString"
                ]
            ]
        case .boolean(let bool):
            return [
                "WFItemType": ItemType.boolean.rawValue,
                "WFValue": [
                    "Value": bool,
                    "WFSerializationType": "WFNumberSubstitutableState"
                ]
            ]
        case .array(let values):
            return [
                "WFItemType": ItemType.array.rawValue,
                "WFValue": [
                    "Value": values.map { $0.propertyList },
                    "WFSerializationType": "WFArrayParameterState"
                ]
            ]
        case .dictionary(let values):
            return [
                "WFItemType": ItemType.dictionary.rawValue,
                "WFValue": [
                    "Value": serialize(values),
                    "WFSerializationType": "WFDictionaryFieldValue",
                ]
            ]
        }
    }
}

extension DictionaryValue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: DictionaryValue...) {
        self = .array(elements)
    }
}

extension DictionaryValue: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = .boolean(value)
    }
}

extension DictionaryValue: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, DictionaryValue)...) {
        self = .dictionary(Dictionary(uniqueKeysWithValues: elements))
    }
}

extension DictionaryValue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .number(value)
    }
}

extension DictionaryValue: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .number(value)
    }
}

extension DictionaryValue: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}

func serialize(_ dictionary: [String: DictionaryValue]) -> PropertyList {
    var valueItems = [PropertyList]()
    valueItems.reserveCapacity(dictionary.count)

    for (key, value) in dictionary {
        var propertyList = value.propertyList
        propertyList["WFKey"] = [
            "Value": ["string": key, "attachmentsByRange": [:]],
            "WFSerializationType": "WFTextTokenString",
        ]
        valueItems.append(propertyList)
    }

    return [
        "Value": ["WFDictionaryFieldValueItems": valueItems],
        "WFSerializationType": "WFDictionaryFieldValue"
    ]
}

public func dictionary(_ value: [String: DictionaryValue]) -> ActionWithOutput {
    return Action(identifier: "is.workflow.actions.dictionary", parameters: ["WFItems": serialize(value)])
}
