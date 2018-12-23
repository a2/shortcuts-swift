import Foundation

public func buildShortcut(_ actionContainer: ActionContainer) -> PropertyList {
    let actions = actionContainer.actions.map { $0.propertyList }
    return [
        "WFWorkflowClientVersion": "754",
        "WFWorkflowClientRelease": "2.1.2",
        "WFWorkflowMinimumClientVersion": 411,
        "WFWorkflowTypes": ["WatchKit", "NCWidget"] as [String],
        "WFWorkflowIcon": [
            "WFWorkflowIconStartColor": 4282601983,
            "WFWorkflowIconImageData": Data(),
            "WFWorkflowIconGlyphNumber": 59511,
        ] as PropertyList,
        "WFWorkflowInputContentItemClasses": [
            "WFAppStoreAppContentItem",
            "WFArticleContentItem",
            "WFContactContentItem",
            "WFDateContentItem",
            "WFEmailAddressContentItem",
            "WFGenericFileContentItem",
            "WFImageContentItem",
            "WFiTunesProductContentItem",
            "WFLocationContentItem",
            "WFDCMapsLinkContentItem",
            "WFAVAssetContentItem",
            "WFPDFContentItem",
            "WFPhoneNumberContentItem",
            "WFRichTextContentItem",
            "WFSafariWebPageContentItem",
            "WFStringContentItem",
            "WFURLContentItem",
        ] as [String],
        "WFWorkflowActions": actions
    ] as PropertyList
}

public func exportShortcut(_ actionContainer: ActionContainer) -> Data {
    return try! PropertyListSerialization.data(fromPropertyList: buildShortcut(actionContainer), format: .binary, options: 0)
}

#if canImport(PlaygroundSupport)

import PlaygroundSupport

public func shareShortcut(_ shortcut: PropertyList, named name: String) {
    let data = try! PropertyListSerialization.data(fromPropertyList: shortcut, format: .binary, options: 0)
    if let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy {
        remoteView.send(.dictionary(["name": .string(name), "data": .data(data)]))
    }
}

#endif
