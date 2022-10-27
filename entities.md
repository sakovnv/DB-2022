# Описание сущностей

## Пользователь

| Имя поля | Тип | Ограничения | Описание |
|----------|-----|-------------|----------|
 |id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
 |nickname|VARCHAR(32)|NOT NULL|Никнейм|
 |email|VARCHAR(32)|NOT NULL|Электронная почта|
 |password|VARCHAR(32)| NOT NULL, SHA-256|Пароль|
 |role_id|int|FK, NOT NULL|Вшнешний ключ на роль|


## Рецензия

| Имя поля | Тип | Ограничения | Описание |
|----------|-----|-------------|----------|
|id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
|header|VARCHAR(128)|NOT NULL|Заголовок рецензии|
|creation_time|DATETIME|NOT NULL|Время создания|
|category_id|id|FK, NOT NULL|Внешний ключ на категорию-+|
|text|TEXT|NOT NULL|Текст|


## Роль
| Имя поля | Тип | Ограничения | Описание |
|----------|-----|-------------|----------|
|id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
|title|VARCHAR(32)|NOT NULL|Название роли|


## Рейтинг
| Имя поля | Тип | Ограничения | Описание |
|----------|-----|-------------|----------|
|id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
|grade|tinyint|UNSIGNED, NOT NULL|Оценка|
|user_id|int|FK, NOT NULL|Внешний ключ на пользователя|
|review_id|int|FK, NOT NULL|Внешний ключ на рецензию|


## Категория
| Имя поля | Тип | Ограничения | Описание |
|----------|-----|-------------|----------|
|id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
|title|VARCHAR(64)|NOT NULL|Название категории|

## Комментарий
| Имя поля | Тип | Ограничения | Описание |
|----------|-----|-------------|----------|
|id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
|text|TEXT|NOT NULL|Текст комментария|
|user_id|int|FK, NOT NULL|Внешний ключ на пользователя оставившего комментарий|
|review_id|int|FK, NOT NULL|Внешний ключ на рецензию|

## Логи
| Имя поля | Тип | Ограничения | Описание |
|----------|-----|-------------|----------|
|id|int|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
|user_id|int|FK, NOT NULL|Внешний ключ на пользователя|
|datetime|DATETIME|NOT NULL|Время логирования|
|type|VARCHAR(16)|NOT NULL|Тип лога|
|representation|VARCHAR(256)|NOT NULL|Текстовое представление лога|