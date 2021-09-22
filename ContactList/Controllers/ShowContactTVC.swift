
import UIKit

class ShowContactTVC: UITableViewController {

  var showContact = Contact(name: "", surname: "", dateOfBirth: "", company: "", email: "", phoneNumber: "")

  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var surnameLabel: UILabel!
  @IBOutlet var dateOfBirthlabel: UILabel!
  @IBOutlet var companyLabel: UILabel!
  @IBOutlet var emailLabel: UILabel!
  @IBOutlet var phoneNumberLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    updateContact()
  }
  @IBAction func editContact(_ sender: UIBarButtonItem) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let editTableVC = storyboard.instantiateViewController(identifier: "NewContactTVC") as? NewContactTVC else { return }
    editTableVC.saveButtonOutlet.title = ""
    editTableVC.navigationItem.title = "Изменить контакт"
    show(editTableVC, sender: nil)
    editTableVC.contactNew = showContact
  }

  private func updateContact() {
    nameLabel.text = showContact.name
    surnameLabel.text = showContact.surname
    dateOfBirthlabel.text = showContact.dateOfBirth
    companyLabel.text = showContact.company
    emailLabel.text = showContact.email
    phoneNumberLabel.text = showContact.phoneNumber
  }

}
