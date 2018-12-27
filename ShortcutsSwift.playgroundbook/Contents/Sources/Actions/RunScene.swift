import Foundation

/// This methods creates an Action that runs a HomeKit scene
///
/// - Parameters:
///   - home: The name of your home (The default name is "My Home")
///   - name: The name of the scene you want to run
public func runScene(for home: String, with name: String) -> ActionContainer {
    return Action(identifier: "is.workflow.actions.runscene", parameters: ["WFHomeName": home, "WFHomeSceneName": name])
}
