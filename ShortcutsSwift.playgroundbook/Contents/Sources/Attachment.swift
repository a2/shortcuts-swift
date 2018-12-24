import Foundation

public struct Attachment {
    public var type: String
    public var aggrandizements: [Aggrandizement]?
    public var outputName: String?
    public var outputUUID: UUID?
    public var variableName: String?

    public init(type: String, aggrandizements: [Aggrandizement]? = nil, outputName: String? = nil, outputUUID: UUID? = nil, variableName: String? = nil) {
        self.type = type
        self.aggrandizements = aggrandizements
        self.outputName = outputName
        self.outputUUID = outputUUID
        self.variableName = variableName
    }

    var propertyList: PropertyList {
        var result: PropertyList = ["Type": type]
        result["Aggrandizements"] = aggrandizements?.map { $0.propertyList }
        result["OutputUUID"] = outputUUID?.uuidString
        result["OutputName"] = outputName
        result["VariableName"] = variableName
        return result
    }
}
