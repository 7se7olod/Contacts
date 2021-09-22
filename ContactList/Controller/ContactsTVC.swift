import UIKit

class ContactsTVC: UITableViewController {

  var contacts: [Contact] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    setSearchController(navigationItem: navigationItem)
  }

  @IBAction func addNewContact(_ sender: UIBarButtonItem) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let newContactTVC = storyboard.instantiateViewController(identifier: "NewContactTVC") as? NewContactTVC else { return }
    show(newContactTVC, sender: nil)
  }

  @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    guard segue.identifier == "SaveContactSegue" else { return }
    guard let newContactTVC = segue.source as? NewContactTVC else { return }
    let contactNew = newContactTVC.contactNew
    let newIndexPath = IndexPath(row: contacts.count, section: 0)
    contacts.append(contactNew)
    tableView.insertRows(at: [newIndexPath], with: .fade)
  }


  @IBAction func updateUnwindSegue(unwindSegue: UIStoryboardSegue) {
    guard unwindSegue.identifier == "UpdateContactSegue" else { return }
    guard let updateContact = unwindSegue.source as? NewContactTVC else { return }
    let contactNew = updateContact.contactNew
    guard let selectedRow = tableView.indexPathForSelectedRow else { return }

    // MARK: обновлять данные контакта из поиска

    if isFiltering {
      filteredContacts[selectedRow.row] = contactNew
    } else {
      contacts[selectedRow.row] = contactNew
    }
    tableView.reloadRows(at: [selectedRow], with: .fade)
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if isFiltering {
      return filteredContacts.count
    }
    return contacts.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell

    var contact: Contact

    if isFiltering {
      contact = filteredContacts[indexPath.row]
    } else {
      contact = contacts[indexPath.row]
    }

    cell.set(contact: contact)
    return cell
  }

  // MARK: - Удаление контакта с возможностью отмены

  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let alertController = UIAlertController(title: "Удалить контакт?", message: nil, preferredStyle: .actionSheet)
      let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
      let delete = UIAlertAction(title: "Удалить", style: .destructive) { (_) in
        self.contacts.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
      }
      alertController.addAction(delete)
      alertController.addAction(cancel)
      present(alertController, animated: true, completion: nil)
    }
  }

  // MARK: - Переход в ShowContactTVC по ячейке

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let showTableVC = storyboard.instantiateViewController(identifier: "ShowContact") as? ShowContactTVC else { return }
    show(showTableVC, sender: nil)
    guard let indexPath = tableView.indexPathForSelectedRow else { return }
    let contact: Contact
    if isFiltering {
      contact = filteredContacts[indexPath.row]
    } else {
      contact = contacts[indexPath.row]
    }
    showTableVC.showContact = contact
  }
}


