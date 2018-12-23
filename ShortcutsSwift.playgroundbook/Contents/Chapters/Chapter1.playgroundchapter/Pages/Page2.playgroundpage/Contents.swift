try buildShortcut(
    comment("This Shortcut was generated in Swift.") +
    ask(question: "WHAT 👏 DO 👏 YOU 👏 WANT 👏 TO 👏 SAY") +
    changeCase(to: .uppercase) +
    replaceText("[\\s]", replaceWith: " 👏 ", regularExpression: true) +
    chooseFromMenu(items: [
        ("Share", share()),
        ("Copy to Clipboard", copyToClipboard()),
    ])
)
