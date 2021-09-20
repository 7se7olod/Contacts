import UIKit

class ContactsTVC: UITableViewController {

  var contacts = [Info]()

  var names = ["Сева", "Антон"]
  var surnames = ["Пушин", "Исаков"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  @IBAction func newContactButton(_ sender: Any) {
    performSegue(withIdentifier: "NewContact", sender: self)
  }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

      return names.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell

      cell.nameLabel.text = names[indexPath.row]
      cell.surnameLabel.text = surnames[indexPath.row]

        return cell
    }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "ShowContact", sender: self)
  }
}
