import Foundation

func withInterpolatedText(_ string: String) -> Any {
    var result = string
    var attachments = [String: Any]()

    let objectReplacementCharacter = "\u{fffc}"
    let replacementCharacter = "\u{fffd}"

    var rangeStart = result.startIndex
    while let orcRange = result.range(of: objectReplacementCharacter, range: rangeStart ..< result.endIndex) {
        if let rcRange = result.range(of: replacementCharacter, range: orcRange.upperBound ..< result.endIndex) {
            let data = Data(result[orcRange.upperBound ..< rcRange.lowerBound].utf8)
            let jsonObject = try! JSONSerialization.jsonObject(with: data)
            attachments[NSStringFromRange(NSRange(orcRange, in: result))] = jsonObject
            result.removeSubrange(orcRange.upperBound ..< rcRange.upperBound)
        }

        rangeStart = orcRange.upperBound
    }

    guard !attachments.isEmpty else {
        return string
    }

    return [
        "WFSerializationType": "WFTextTokenString",
        "Value": ["string": result, "attachmentsByRange": attachments],
    ] as PropertyList
}
