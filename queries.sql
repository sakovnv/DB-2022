USE reviews_service_db;

SELECT * FROM Users WHERE Role_id = 4;
SELECT * FROM Users WHERE Role_id = 3;
SELECT * FROM Users WHERE Role_id = 2;

SELECT representation FROM Logs WHERE type = "CREATE";

UPDATE Users SET email='pasha@mail.ru' WHERE id = 3;

SELECT * FROM Users WHERE email LIKE "%gmail%";

SELECT * FROM Users WHERE role_id = 4;

SELECT * FROM Users ORDER BY register_datetime DESC;

SELECT nickname From Users order by nickname;

SELECT * FROM Review as review, Rating as rating WHERE review.id = rating.review_id AND rating.grade >= 4;

SELECT AVG(grade), Rating.review_id, IF(AVG(grade) > 4, "Отличная", "Хорошая") FROM Rating WHERE Rating.review_id = 1;

SELECT AVG(grade) FROM Rating WHERE Rating.review_id = 1;

DELETE FROM Rating WHERE id = 3;

SELECT * FROM Users, ReviewAndUser, Review WHERE Users.id = ReviewAndUser.user_id and ReviewAndUser.review_id = Review.id and ReviewAndUser.user_id = 3;

SELECT nickname FROM Archive, Users WHERE Archive.user_id = Users.id and Archive.id = 3;

SELECT * FROM Comment WHERE User_id = 4;

SELECT header FROM Review WHERE Review.category_id = 1;
SELECT header FROM Review WHERE Review.category_id = 2;
SELECT header FROM Review WHERE Review.category_id = 3;
SELECT header FROM Review WHERE Review.category_id = 4;

SELECT count(*) FROM Users
