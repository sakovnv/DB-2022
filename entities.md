  # Описание сущностей
  
  ## Аккаунт (Account)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
   |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
   |email|VARCHAR(32)|NOT NULL|Электронная почта|
   |password|VARCHAR(32)| NOT NULL, SHA-256|Пароль|
   |register_datetime|DATETIME|NOT NULL|Время регистрации|
   |last_login_datetime|DATETIME|NOT NULL|Последняя авторизация|
  ## Пользователь (User)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
   |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
   |Account_id|int|FK, NOT NULL, UNIQUE|Внешний ключ на пользователя|
   |nickname|VARCHAR(32)|NOT NULL|Никнейм|
  ## Рецензия (Review)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
  |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
  |User_id|int|FK, NOT NULL|Внешний ключ на пользователя (автора рецензии)|
  |header|VARCHAR(128)|NOT NULL|Заголовок рецензии|
  |creation_time|DATETIME|NOT NULL|Время создания|
  |Category_id|id|FK, NOT NULL|Внешний ключ на категорию|
  |text|TEXT|NOT NULL|Текст|
  ## Роль (Role)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
  |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
  |title|VARCHAR(32)|NOT NULL|Название роли|
  ## Рейтинг (Rating)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
  |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
  |grade|UNSIGNED tinyint|NOT NULL|Оценка|
  |User_id|int|FK, NOT NULL|Внешний ключ на пользователя|
  |Review_id|int|FK, NOT NULL|Внешний ключ на рецензию|
  ## Категория (Category)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
  |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
  |title|VARCHAR(64)|NOT NULL|Название категории|
  ## Комментарий (Comment)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
  |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
  |text|TEXT|NOT NULL|Текст комментария|
  |User_id|int|FK, NOT NULL|Внешний ключ на пользователя оставившего комментарий|
  |Review_id|int|FK, NOT NULL|Внешний ключ на рецензию|
  ## Логи (Logs)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
  |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
  |User_id|int|FK, NOT NULL|Внешний ключ на пользователя|
  |datetime|DATETIME|NOT NULL|Время логирования|
  |type|VARCHAR(16)|NOT NULL|Тип лога|
  |representation|VARCHAR(256)|NOT NULL|Текстовое представление лога|
  ## Пользователи и Роли (UsersAndRoles)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
  |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
  |User_id|int|FK, NOT NULL|Внешний ключ на пользователя|
  |Roles_id|int|FK, NOT NULL|Внешний ключ на роль|