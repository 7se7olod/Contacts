import Foundation

extension String {
  func isEmail() -> Bool {
    let emailRegex = "[A-Z0-9a-z._@+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}]"
    return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
  }
  func isOnlyText() -> Bool {
    let nameSurnameText = "[Aa-Zz@Аа-Яя]"
    return NSPredicate(format: "SELF MATCHES", nameSurnameText).evaluate(with: self)
  }
}
