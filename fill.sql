USE reviews_service_db;

INSERT Role(title) VALUES ("Посетитель");
INSERT Role(title) VALUES ("Пользователь");
INSERT Role(title) VALUES ("Модератор");
INSERT Role(title) VALUES ("Администратор");

INSERT Users(Role_id, nickname, email, password, register_datetime, last_login_datetime) VALUES (4, "sakovnv", "sakovnv@gmail.com", "123321123", NOW(), NOW());
INSERT Users(Role_id, nickname, email, password, register_datetime, last_login_datetime) VALUES (3, "moder", "modera@gmail.com", "password", NOW(), NOW());
INSERT Users(Role_id, nickname, email, password, register_datetime, last_login_datetime) VALUES (2, "someuser", "gisomeuser@gmail.com", "123pass321", NOW(), NOW());
INSERT Users(Role_id, nickname, email, password, register_datetime, last_login_datetime) VALUES (2, "user2", "user2@gmail.com", "123pass321", NOW(), NOW());

INSERT Logs(User_id, datetime, type, representation) VALUES (1, NOW(), "AUTH", "registered");
INSERT Logs(User_id, datetime, type, representation) VALUES (2, NOW(), "AUTH", "registered");
INSERT Logs(User_id, datetime, type, representation) VALUES (3, NOW(), "AUTH", "registered");
INSERT Logs(User_id, datetime, type, representation) VALUES (4, NOW(), "AUTH", "registered");

INSERT Category(title) VALUES ("Книги");
INSERT Category(title) VALUES ("Фильмы");
INSERT Category(title) VALUES ("Сериалы");
INSERT Category(title) VALUES ("Музыка");

INSERT Archive(User_id) VALUES (3);
INSERT Archive(User_id) VALUES (4);

INSERT Review(Category_id, header, creation_time, text) VALUES (2, "Волк с Уолл-стрит", NOW(), "some long text");
INSERT ReviewAndUser(User_id, Review_id) VALUES (3, 1);
INSERT ReviewAndArchive(Review_id, Archive_id) VALUES (1, 1);

INSERT Review(Category_id, header, creation_time, text) VALUES (1, "Портрет Дориана Грея", NOW(), "очень крутая книга реально");
INSERT ReviewAndUser(User_id, Review_id) VALUES (3, 2);
INSERT ReviewAndUser(User_id, Review_id) VALUES (4, 2);
INSERT ReviewAndArchive(Review_id, Archive_id) VALUES (2, 2);
INSERT ReviewAndArchive(Review_id, Archive_id) VALUES (2, 1);

INSERT Review(Category_id, header, creation_time, text) VALUES (3, "Чернобыль от HBO", NOW(), "очень очень крутой сериал реально");
INSERT ReviewAndUser(User_id, Review_id) VALUES (3, 3);
INSERT ReviewAndArchive(Review_id, Archive_id) VALUES (3, 1);

INSERT Review(Category_id, header, creation_time, text) VALUES (4, "Eminem - Rap God", NOW(), "очень крутая музыка и текста глубокие реально");
INSERT ReviewAndUser(User_id, Review_id) VALUES (4, 4);
INSERT ReviewAndArchive(Review_id, Archive_id) VALUES (4, 2);

INSERT Review(Category_id, header, creation_time, text) VALUES (4, "Linkin Park - Numb", NOW(), "опять же очень круто и текст глубокий ну реально");
INSERT ReviewAndUser(User_id, Review_id) VALUES (4, 5);
INSERT ReviewAndArchive(Review_id, Archive_id) VALUES (5, 2);

INSERT Logs(User_id, datetime, type, representation) VALUES (3, NOW(), "CREATE", "create review");
INSERT Logs(User_id, datetime, type, representation) VALUES (3, NOW(), "CREATE", "create review");
INSERT Logs(User_id, datetime, type, representation) VALUES (3, NOW(), "CREATE", "create review");
INSERT Logs(User_id, datetime, type, representation) VALUES (4, NOW(), "CREATE", "create review");
INSERT Logs(User_id, datetime, type, representation) VALUES (4, NOW(), "CREATE", "create review");

INSERT Comment(text, User_id, Review_id) VALUES ("класс мне нравится", 4, 1);
INSERT Comment(text, User_id, Review_id) VALUES ("класс мне тоже нравится", 3, 1);
INSERT Comment(text, User_id, Review_id) VALUES ("ого как круто", 4, 2);
INSERT Comment(text, User_id, Review_id) VALUES ("а мне не нравится", 2, 1);
INSERT Comment(text, User_id, Review_id) VALUES ("ну можно было и лучше", 3, 2);

INSERT Rating(grade, User_id, Review_id) VALUES (4, 4, 1);
INSERT Rating(grade, User_id, Review_id) VALUES (5, 3, 1);