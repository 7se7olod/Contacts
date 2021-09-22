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

  private func formatPhoneNumber(mask: String, number: String) -> String {
    let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    //let mask = "+X (XXX) XXX-XXXX"
    var result = ""
    var index = cleanPhoneNumber.startIndex
    for ch in mask where index < cleanPhoneNumber.endIndex {
      if ch == "X" {
        result.append(cleanPhoneNumber[index])
        index = cleanPhoneNumber.index(after: index)
      } else {
        result.append(ch)
      }
    }
    return result
  }

  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if textField == phoneNumberNewTF {
    guard let text = textField.text else { return false }
    let newString = (text as NSString).replacingCharacters(in: range, with: string)
      textField.text = formatPhoneNumber(mask: "+X (XXX) XXX-XXXX", number: newString)
    } else {
      return true
    }
    return false
  }

  // MARK: - Проверка email
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    if textField == emailNewTF {
      if emailNewTF.text?.isValidEmail == false {
        let alertController = UIAlertController(title: "Некорректный email", message: nil, preferredStyle: .alert)
        let okey = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alertController.addAction(okey)
        present(alertController, animated: true, completion: nil)
      }
    }
    return true
  }

  // MARK: - Вызов dataPicker вместо вызова клавиатуры
  func textFieldDidBeginEditing(_ textField: UITextField) {
    if textField == dateOfBirthNewTF {
      datePicker.preferredDatePickerStyle = .wheels
      datePicker.datePickerMode = .date
      datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
      textField.inputView = datePicker
    }
  }
  @objc func handleDatePicker(sender: UIDatePicker) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    dateOfBirthNewTF.text = dateFormatter.string(from: sender.date)
  }
}
