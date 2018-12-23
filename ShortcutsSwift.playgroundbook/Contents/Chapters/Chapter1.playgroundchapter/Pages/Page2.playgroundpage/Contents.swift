let shortcutName = "Clap Along"
let shortcutData = try exportShortcut(
    comment("This Shortcut was generated in Swift.") +
    ask(question: "WHAT 👏 DO 👏 YOU 👏 WANT 👏 TO 👏 SAY") +
    changeCase(to: .uppercase) +
    replaceText("[\\s]", replaceWith: " 👏 ", regularExpression: true) +
    chooseFromMenu(items: [
        ("Share", share()),
        ("Copy to Clipboard", copyToClipboard()),
    ])
)
//#-hidden-code
import PlaygroundSupport
if let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy {
    remoteView.send(.dictionary([
        "name": .string(shortcutName),
        "data": .data(shortcutData),
    ]))
}
//#-end-hidden-code
