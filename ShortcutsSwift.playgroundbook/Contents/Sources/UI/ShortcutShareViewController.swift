import PlaygroundSupport
import UIKit

public class ShortcutShareViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    var button: UIButton?
    var shortcutURL: URL? {
        didSet {
            button?.isEnabled = shortcutURL != nil
        }
    }

    // MARK: - Actions

    @objc func share(_ sender: UIView) {
        guard let shortcutURL = shortcutURL else {
            return
        }

        let activityViewController = UIActivityViewController(activityItems: [shortcutURL], applicationActivities: nil)
        if let popover = activityViewController.popoverPresentationController {
            popover.sourceRect = sender.bounds
            popover.sourceView = sender
        }
        present(activityViewController, animated: true)
    }

    // MARK: - Message Handling

    public func receive(_ message: PlaygroundValue) {
        guard case .dictionary(let dictionary) = message,
            case PlaygroundValue.string(let name)? = dictionary["name"],
            case PlaygroundValue.data(let data)? = dictionary["data"]
        else {
            return
        }

        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }

        let fileURL = documentDirectory.appendingPathComponent(name).appendingPathExtension("shortcut")
        try! data.write(to: fileURL)
        self.shortcutURL = fileURL
    }

    // MARK: - View Life Cycle

    public override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .system)
        button.isEnabled = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(share), for: .touchUpInside)
        button.setTitle("Share", for: .normal)
        view.addSubview(button)
        self.button = button

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: liveViewSafeAreaGuide.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: liveViewSafeAreaGuide.bottomAnchor),
        ])
    }
}
