# Техническое задание
Сервис рецензий

## Сущности
- Аккаунты
- Рецензии
- Архив
- Роли
- Пользователи
- Рейтинг
- Категория
- Комментарии
- Логи
## Функциональные требования
- Авторизация
- Управление пользователями (CRUD)
- Управления книгами (CRUD)
- Система ролей
- Журналирование действий пользователя
## Роли

|   Право/Роль   |Посетитель        | Пользователь | Модератор | Администратор              
|----------------|------------------|--------------|-----------|-------------|
|Просмотр рецензии|+|+|+|+|
|Создание рецензии|-|+|+|+|
|Редактирование чужой рецензии|-|-|+|+|
|Редактирование собственной рецензии|-|+|+|+|
|Выставление рейтинга|-|+|+|+|
|Удаление рецензии|-|-|+|+|
|Удаление рейтинга|-|-|+|+|
|Удаление комментария|-|-|+|+|
|Управление модераторами|-|-|-|+|
|Управление пользователями|-|-|+|+|
|Просмотр комментариев|-|+|+|+|
|Просмотр логов|-|-|-|+|


## Аккаунт пользователя
При создании аккаунта пользователя требуется указать следующие данные:

- Имя пользователя (никнейм)
- Почта
- Пароль

