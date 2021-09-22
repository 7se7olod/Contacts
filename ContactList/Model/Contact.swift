import Foundation

struct Contact {
  var name: String?
  var surname: String?
  var dateOfBirth: String?
  var company: String?
  var email: String?
  var phoneNumber: String?

  init(name: String?, surname: String?, dateOfBirth: String?, company: String?, email: String?, phoneNumber: String?) {
    self.name = name
    self.surname = surname
    self.dateOfBirth = dateOfBirth
    self.company = company
    self.email = email
    self.phoneNumber = phoneNumber
  }
}
