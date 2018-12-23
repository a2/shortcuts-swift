import Foundation

func withActionOutput(parameters: PropertyList = [:], output: UnsafePointer<Variable>? = nil) -> PropertyList {
    var parameters = parameters
    if let variable = output?.pointee {
        parameters["UUID"] = variable.value.uuid.uuidString

        if let outputName = variable.value.outputName {
            parameters["CustomOutputName"] = outputName
        }
    }

    return parameters
}
