# Список контактов 

https://user-images.githubusercontent.com/79934870/134480020-94e5eb23-be28-4e4c-927b-993c7bcca610.MP4


## Возможности приложения:
#### - Добавление нового контакта в список
#### - Просмотр детальной информации о контакте
#### - Редактирование контакта
#### - Удаление контакта
#### - Поиск контакта в списке по имени и фамилии

# Краткое описание файлов

#### Contact:
Содержит свойства контакта (Имя, Фамилия, итп)

#### - ContactsTVC:
Отображает список всех контактов

#### - ShowContactTVC:
Показывает детальную информацию о контакте

#### - NewContactTVC:
Необходим для добавления или изменения контакта

#### - Cell:
Отвечает за отображение содержимого ячейки класса ContactsTVC

#### Папка Extensions содержит три файла:
- файл SearchBar является расширением ContactsTVC. Добавляет searchBarController
- файл TextField является расширением NewContactTVC. Расширяет функционал textField
- файл String является расширением для String. Добавляет регулярное выражение для работы с email
