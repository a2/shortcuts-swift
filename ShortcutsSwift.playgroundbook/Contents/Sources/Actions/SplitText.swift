import Foundation

public enum TextSeparator {
    case everyLine
    case everyCharacter
    case spaces
    case custom(separator: String)
    case askWhenRun
    
    var parametersValue: PropertyList {
        let textSeparatorValue: Any?
        let additionalParameter: (String, Any)?
        switch self {
        case .everyCharacter:
            textSeparatorValue = "Every Caracter"
            additionalParameter = nil
        case .spaces:
            textSeparatorValue = "Spaces"
            additionalParameter = nil
        case .everyLine:
            textSeparatorValue = nil
            additionalParameter = nil
        case .custom(separator: let separator):
            textSeparatorValue = "Custom"
            additionalParameter = ("WFTextCustomSeparator", separator)
        case .askWhenRun:
            return [
                "Value": ["Type": "Ask"] as PropertyList,
                "WFSerializationType": "WFTextTokenAttachment",
                ] as PropertyList
        }
        var result: PropertyList = [:]
        if let textSeparatorValue = textSeparatorValue {
            result["WFTextSeparator"] = textSeparatorValue
        }
        if let additionalParameter = additionalParameter {
            result[additionalParameter.0] = additionalParameter.1
        }
        
        return result
    }
}

public func splitText(_ separator: TextSeparator) -> ActionWithOutput {
    return Action(identifier: "is.workflow.actions.text.split", parameters: separator.parametersValue)
}
