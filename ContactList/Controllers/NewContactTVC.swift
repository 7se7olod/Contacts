import UIKit

class NewContactTVC: UITableViewController {

  var contactNew = Contact(name: "", surname: "", dateOfBirth: "", company: "", email: "", phoneNumber: "")

  @IBOutlet var nameNewTF: UITextField!
  @IBOutlet var surnameNewTF: UITextField!
  @IBOutlet var dateOfBirthNewTF: UITextField!
  @IBOutlet var companyNewTF: UITextField!
  @IBOutlet var emailNewTF: UITextField!
  @IBOutlet var phoneNumberNewTF: UITextField!
  @IBOutlet var saveButtonOutlet: UIBarButtonItem!
  @IBOutlet var updateButtonOutlet: UIBarButtonItem!
  let datePicker = UIDatePicker()

  override func viewDidLoad() {
    super.viewDidLoad()
    textFieldsDelegates()
    activeSaveButton()
    updateContact()
  }

  // MARK: - Ввод только Рус и Англ букв в поля имя и фамилия
  @IBAction func nameSurnameActiveSaveButton(_ sender: UITextField) {
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
    guard segue.identifier == "SaveContactSegue" || segue.identifier == "UpdateContactSegue" else { return }
      self.updateNewContact()
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
  @IBAction func activSaveButton(_ sender: UITextField) {
    activeSaveButton()
  }

  private func activeSaveButton() {
    let name = nameNewTF.text ?? ""
    let surname = surnameNewTF.text ?? ""
    let dateOfBirth = dateOfBirthNewTF.text ?? ""
    let company = companyNewTF.text ?? ""
    let email = emailNewTF.text ?? ""
    let phoneNumber = phoneNumberNewTF.text ?? ""
    saveButtonOutlet.isEnabled = !name.isEmpty && !surname.isEmpty && !dateOfBirth.isEmpty && !company.isEmpty && !email.isEmpty && !phoneNumber.isEmpty
  }
}
