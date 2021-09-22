import UIKit

var filteredContacts = [Contact]() // Список отфильтрованных контактов
let searchController = UISearchController(searchResultsController: nil)
var searchBarIsEmpty: Bool {
  guard let text = searchController.searchBar.text else { return false }
  return text.isEmpty
}
var isFiltering: Bool {
  return searchController.isActive && !searchBarIsEmpty
}

extension ContactsTVC: UISearchResultsUpdating {
  // настройка searchController
  func setSearchController(navigationItem: UINavigationItem) {
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Поиск контакта"
    navigationItem.searchController = searchController
    definesPresentationContext = true
  }
  func updateSearchResults(for searchController: UISearchController) {
    filterContentForSearchText(searchController.searchBar.text!)
  }
  // фильтр по имени, фамилии, номеру тлф, емэйлу
  private func filterContentForSearchText(_ searchText: String) {
    filteredContacts = contacts.filter({ (contact: Contact) -> Bool in
      let email = contact.email?.lowercased().contains(searchText.lowercased()) ?? false
      let surname = contact.surname?.lowercased().contains(searchText.lowercased()) ?? false
      let name = contact.name?.lowercased().contains(searchText.lowercased()) ?? false
      let phoneNumber = contact.phoneNumber?.lowercased().contains(searchText.lowercased()) ?? false
      return name || surname || phoneNumber || email
    })
    tableView.reloadData()
  }
}
