import UIKit

extension NewContactTVC: UITextFieldDelegate {
  // MARK: - Делегаты
  func textFieldsDelegates() {
    nameNewTF.delegate = self
    surnameNewTF.delegate = self
    dateOfBirthNewTF.delegate = self
    companyNewTF.delegate = self
    emailNewTF.delegate = self
    phoneNumberNewTF.delegate = self
  }

  // MARK: - Переход в следующий textField

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    phoneNumberNewTF.resignFirstResponder()
    if textField == nameNewTF {
      textField.resignFirstResponder()
      surnameNewTF.becomeFirstResponder()
    } else if textField == surnameNewTF {
      textField.resignFirstResponder()
    } else if textField == dateOfBirthNewTF {
      textField.resignFirstResponder()
      companyNewTF.becomeFirstResponder()
    } else if textField == companyNewTF {
      textField.resignFirstResponder()
      emailNewTF.becomeFirstResponder()
    } else if textField == emailNewTF {
      textField.resignFirstResponder()
      phoneNumberNewTF.becomeFirstResponder()
    }
    return true
  }
}
