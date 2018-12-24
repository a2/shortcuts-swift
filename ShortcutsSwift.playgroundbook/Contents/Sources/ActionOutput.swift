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
     * var batteryLevel = actionOutput()
     * let shortcut = buildShortcut(
     *     getBatteryLevel().savingOutput(to: batteryLevel)
     * )
     * ~~~
     */

    func savingOutput(to variable: ActionOutputVariable) -> ActionContainer
}

extension Action: ActionOutputProviding {
    public func savingOutput(to variable: ActionOutputVariable) -> ActionContainer {
        var parameters = self.parameters
        parameters["CustomOutputName"] = variable.value.outputName
        parameters["UUID"] = variable.value.outputUUID?.uuidString

        return Action(identifier: self.identifier, parameters: parameters)
    }
}
