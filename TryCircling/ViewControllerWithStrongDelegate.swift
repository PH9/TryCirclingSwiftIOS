import UIKit

protocol StrongDelegate {
    func doStrong()
    func doStrongWith(value: String, completeHandler: () -> Void)
}

class ViewControllerWithStrongDelegate: UIViewController {
    var delegate: StrongDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.delegate?.doStrong()
        self.delegate?.doStrongWith(value: "strongValue", completeHandler: {
            print("doStrongWith")
        })
    }
}
