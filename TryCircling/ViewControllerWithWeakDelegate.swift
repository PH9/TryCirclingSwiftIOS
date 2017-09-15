import UIKit

protocol WeakDelegate: class {
    func doWeak()
    func doWeakWith(value: String, completeHandler: () -> Void)
}

class ViewControllerWithWeakDelegate: UIViewController {
    weak var delegate: WeakDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.delegate?.doWeak()
        self.delegate?.doWeakWith(value: "weakValue", completeHandler: {
            print("doWeakWith")
        })
    }
}
