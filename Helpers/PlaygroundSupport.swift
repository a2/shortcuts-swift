import UIKit

public indirect enum PlaygroundValue {
    case boolean(Bool)
    case data(Data)
    case date(Date)
    case floatingPoint(Double)
    case integer(Int)
    case string(String)
    case array([PlaygroundValue])
    case dictionary([String : PlaygroundValue])
}

public protocol PlaygroundLiveViewMessageHandler {
    func receive(_ message: PlaygroundValue)
}

public protocol PlaygroundLiveViewSafeAreaContainer {
    var liveViewSafeAreaGuide: UILayoutGuide { get }
}

extension UIViewController {
    public var liveViewSafeAreaGuide: UILayoutGuide {
        return view.safeAreaLayoutGuide
    }
}
