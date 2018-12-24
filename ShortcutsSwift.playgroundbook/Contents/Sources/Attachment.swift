import Foundation

public struct Attachment {
    public var type: String
    // public var aggrandizements: [Aggrandizement]
    public var outputName: String?
    public var outputUUID: UUID?
    public var variableName: String?

    public init(type: String, outputName: String? = nil, outputUUID: UUID? = nil, variableName: String? = nil) {
        self.type = type
        self.outputName = outputName
        self.outputUUID = outputUUID
        self.variableName = variableName
    }

    var propertyList: PropertyList {
        var dict: PropertyList = ["Type": type]
        // dict["Aggrandizements"] = aggrandizements
        dict["OutputUUID"] = outputUUID?.uuidString
        dict["OutputName"] = outputName
        dict["VariableName"] = variableName
        return dict
    }
}
