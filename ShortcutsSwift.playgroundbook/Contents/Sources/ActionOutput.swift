import Foundation

/**
 * An action that supports output. See `ActionOutputProviding` for instructions
 * about saving to a variable.
 */

public typealias ActionWithOutput = ActionContainer & ActionOutputProviding

/**
 * A protocol for actions that support saving their output to a variable, and
 * returning the updated action.
 */

public protocol ActionOutputProviding {

    /**
     * Saves the output of the action to a variable.
     * - parameter variable: The pointer to the variable to use to save the output.
     * - returns: The action to use in the builder.
     *
     * Example usage:
     * ~~~swift
     * var batteryLevel = Variable.actionOutput()
     * let shortcut = buildShortcut(
     *     getBatteryLevel().savingOutput(to: &batteryLevel)
     * )
     * ~~~
     */

    func savingOutput(to variable: UnsafePointer<Variable>) -> ActionContainer
}

extension Action: ActionOutputProviding {

    public func savingOutput(to variable: UnsafePointer<Variable>) -> ActionContainer {
        var parameters = self.parameters

        let variable = variable.pointee
        parameters["UUID"] = variable.value.uuid.uuidString

        if let outputName = variable.value.outputName {
            parameters["CustomOutputName"] = outputName
        }

        return Action(identifier: self.identifier, parameters: parameters)
    }

}
