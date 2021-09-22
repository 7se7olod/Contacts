import UIKit

class NewContactTVC: UITableViewController {

  var contactNew = Contact(name: "", surname: "", dateOfBirth: "", company: "", email: "", phoneNumber: "")

  @IBOutlet var nameNewTF: UITextField!
  @IBOutlet var surnameNewTF: UITextField!
  @IBOutlet var dateOfBirthNewTF: UITextField!
  @IBOutlet var companyNewTF: UITextField!
  // MARK: сделать валидацию на email
  @IBOutlet var emailNewTF: UITextField!
  // MARK: сделать валидацию по номеру тлф
  @IBOutlet var phoneNumberNewTF: UITextField!
  @IBOutlet var saveButtonOutlet: UIBarButtonItem!

  override func viewDidLoad() {
    super.viewDidLoad()
    textFieldsDelegates()
    activeSaveButton()
    updateContact()
  }

  // MARK: - Ввод букв
  @IBAction func nameSurnameActiveSaveButton(_ sender: UITextField) {
    activeSaveButton()
    let ruCharacters = "йцукенгшщзхъфывапролджэёячсмитьбю"
    let engCharacters = "qwertyuiopasdfghjklzxcvbnm"
    guard let lastChar = sender.text?.last?.description.lowercased() else { return }
    guard ruCharacters.contains(lastChar) || engCharacters.contains(lastChar) else {
      sender.text?.removeLast()
      return
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    if segue.identifier == "SaveContactSegue" {
      self.updateNewContact()
    } else if segue.identifier == "UpdateContactSegue" {
      self.updateNewContact()
    }
  }

  private func updateContact() {
    nameNewTF.text = contactNew.name
    surnameNewTF.text = contactNew.surname
    dateOfBirthNewTF.text = contactNew.dateOfBirth
    companyNewTF.text = contactNew.company
    emailNewTF.text = contactNew.email
    phoneNumberNewTF.text = contactNew.phoneNumber
  }

  private func updateNewContact() {
    let name = nameNewTF.text ?? ""
    let surname = surnameNewTF.text ?? ""
    let dateOfBirth = dateOfBirthNewTF.text ?? ""
    let company = companyNewTF.text ?? ""
    let email = emailNewTF.text ?? ""
    let phoneNumber = phoneNumberNewTF.text ?? ""
    contactNew = Contact(name: name, surname: surname, dateOfBirth: dateOfBirth, company: company, email: email, phoneNumber: phoneNumber)
  }

  // MARK: - Активация кнопки "Сохранить"
  private func activeSaveButton() {
    let nameText = nameNewTF.text ?? ""
    let surnameText = surnameNewTF.text ?? ""
    saveButtonOutlet.isEnabled = !nameText.isEmpty && !surnameText.isEmpty
  }
}


