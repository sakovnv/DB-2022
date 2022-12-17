USE reviews_service_db;

DELIMITER // 

CREATE procedure CreateUser(
	in nickname VARCHAR(32),
	in email VARCHAR(32), 
	in password VARCHAR(32), 
	in role_title VARCHAR(32))

BEGIN
	INSERT INTO Users(nickname, email, password, role_id, register_datetime, last_login_datetime)
    VALUES (nickname, email, password, (SELECT id FROM Role WHERE Role.title = role_title), NOW(), NOW());
    CALL AddArchive(@@identity);
END //

CREATE procedure AddArchive(
	in id INT)
BEGIN
	INSERT INTO Archive(User_id) VALUES (id);
END //

CREATE procedure RemoveUser(
	in user_nickname VARCHAR(32))

BEGIN
	DELETE FROM User WHERE user_nickname = nickname;
END //

CREATE procedure CreateReview(
	in category_title VARCHAR(64),
    in header VARCHAR(128), 
    in text VARCHAR(4096), 
    in author_nickname VARCHAR(32))
BEGIN
	INSERT INTO Review(category_id, header, text, creation_time)
    VALUES ((SELECT id FROM Category WHERE title = category_title), header, text, NOW);
END //

    
CREATE procedure RemoveReview(
    in review_id INT)
BEGIN
	DELETE FROM Review WHERE id = Review_id;
END //

CREATE procedure AddAuthorToReview(
	in author_nickname VARCHAR(32),
    in review_id INT)
BEGIN
    INSERT INTO ReviewAndUser(User_id, Review_id) VALUES ((SELECT id FROM Users WHERE nickname = author_nickname), review_id);
	INSERT INTO ReviewAndArchive(Review_id, Archive_id) VALUES (review_id, (SELECT archive_id FROM Users WHERE nickname = author_nickname));
END //

CREATE procedure RemoveAuthorFromReview(
	in author_nickname VARCHAR(32),
    in review_id INT)
BEGIN
	DELETE FROM ReviewAndUser WHERE (SELECT id FROM Users WHERE nickname = author_nickname) = User_id AND ReviewAndUser.Review_id = review_id;
	DELETE FROM ReviewAndArchive WHERE (SELECT id FROM Users WHERE nickname = author_nickname) = User_id AND ReviewAndUser.Review_id = review_id; 
END //

CREATE procedure AddCategory(
	in category_title VARCHAR(64))
BEGIN
	INSERT INTO Category(title) VALUES (category_title);
END //

CREATE procedure RemoveCategory(
	in category_title VARCHAR(64))
BEGIN
	DELETE FROM Category WHERE category_title = title;
END //

CREATE procedure AddRole(
	in role_title VARCHAR(32))
BEGIN
	INSERT INTO Role(title) VALUES (role_title);
END //

CREATE procedure RemoveRole(
	in role_title VARCHAR(32))
BEGIN
	DELETE FROM Role WHERE role_title = title;
END //

DELIMITER ;

CALL CreateUser("mark", "mark@mail.ru", "123321123", "Пользователь");

DROP procedure CreateUser;

SELECT * FROM Users;
SELECT * FROM Archive; 
SELECT * FROM Logs;