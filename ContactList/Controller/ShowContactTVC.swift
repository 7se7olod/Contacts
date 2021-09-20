
import UIKit

class ShowContactTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

  @IBAction func editButton(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let newContactTVC = storyboard.instantiateViewController(identifier: "NewContactTVC") as? NewContactTVC else { return }
    present(newContactTVC, animated: true)
  }
  override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        return cell
    }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
}
