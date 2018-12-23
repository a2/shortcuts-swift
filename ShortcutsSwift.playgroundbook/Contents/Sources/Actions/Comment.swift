import Foundation

public func comment(_ text: String) -> ActionContainer {
    return Action(identifier: "is.workflow.actions.comment", parameters: ["WFCommentActionText": text])
}
