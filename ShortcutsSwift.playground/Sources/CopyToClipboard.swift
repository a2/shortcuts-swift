import Foundation

public func copyToClipboard(localOnly: Bool = false, expireAt expiration: String = "") -> ActionContainer {
    return Action(identifier: "is.workflow.actions.setclipboard", parameters: [
        "WFLocalOnly": localOnly,
        "WFExpirationDate": expiration,
    ])
}
