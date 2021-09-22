import UIKit

class Cell: UITableViewCell {

  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var surnameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  func set(contact: Contact) {
    nameLabel.text = contact.name
    surnameLabel.text = contact.surname
  }
}
