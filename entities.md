  # Описание сущностей
   ## Пользователь (User)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
   |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
   |Role_id|int|FK, NOT NULL|Внешний ключ на роль|
   |nickname|VARCHAR(32)|NOT NULL|Никнейм|
   |email|VARCHAR(32)|NOT NULL|Электронная почта|
   |password|VARCHAR(32)| NOT NULL, SHA-256|Пароль|
   |register_datetime|DATETIME|NOT NULL|Время регистрации|
   |last_login_datetime|DATETIME|NOT NULL|Последняя авторизация|
  ## Рецензия (Review)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
  |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
  |header|VARCHAR(128)|NOT NULL|Заголовок рецензии|
  |creation_time|DATETIME|NOT NULL|Время создания|
  |Category_id|int|FK, NOT NULL|Внешний ключ на категорию|
  |text|VARCHAR(4096)|NOT NULL|Текст|
  ## Рецензия и Пользователь (ReviewAndUser)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
  |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
  |User_id|int|FK, NOT NULL|Внешний ключ на пользователя|
  |Review_id|int|FK, NOT NULL|Внешний ключ на рецензию|
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
  |text|VARCHAR(2048)|NOT NULL|Текст комментария|
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
  ## Архив пользователя (Archive)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
  |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
  |User_id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Внешний ключ|
  ## Рецензия и Архив (ReviewAndArchive)
  | Имя поля | Тип | Ограничения | Описание |
  |----------|-----|-------------|----------|
  |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
  |Review_id|int|FK, NOT NULL|Внешний ключ на рецензию|
  |Archive_id|int|FK, NOT NULL|Внешний ключ на архив|