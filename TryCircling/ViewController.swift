import UIKit

class ViewController: UITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0) ? "weak" : "strong"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "titleCell")!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = ViewControllerWithWeakDelegate()
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = ViewControllerWithStrongDelegate()
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ViewController: WeakDelegate, StrongDelegate {
    func doWeak() {
        print("doWeak")
    }
    
    func doWeakWith(value: String, completeHandler: () -> Void) {
        print(value)
        completeHandler()
    }
    
    func doStrong() {
        print("doStrong")
    }

    func doStrongWith(value: String, completeHandler: () -> Void) {
        print(value)
        completeHandler()
    }
}
