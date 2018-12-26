import Foundation

struct Item {
    let type: String
    let value: PropertyList
    var propertyList: PropertyList {
        return ["WFItemType": type,
                "WFValue" : value
                ]
    }
}

public func list(_ items: [String]) -> ActionWithOutput {
    let items = items.map { itemString -> Any in
        let interpolatedText = withInterpolatedText(itemString)
        if interpolatedText is String {
            return itemString
        }
        return Item(type: "String", value: interpolatedText as! PropertyList).propertyList
    }
    return Action(identifier: "is.workflow.actions.list", parameters: ["WFItems": items])
}
