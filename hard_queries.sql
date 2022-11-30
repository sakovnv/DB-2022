USE reviews_service_db;

SELECT Review.header, Category.title
FROM Category
JOIN Review ON Review.Category_id = Category.id;

SELECT Users.nickname, Role.title
FROM Users
JOIN Role ON Users.role_id = Role.id;

SELECT Role.title, COUNT(Role.id)
FROM Users
JOIN Role ON Users.role_id = Role.id
GROUP BY Role.title;

SELECT Users.nickname, Review.header
FROM Users
JOIN ReviewAndUser ON Users.id = ReviewAndUser.User_id
JOIN Review ON Review.id = ReviewAndUser.Review_id;

SELECT Users.nickname, Review.header, Comment.text
FROM Comment
JOIN Users ON Users.id = Comment.User_id
JOIN Review ON Review.id = Comment.Review_id;

SELECT Users.nickname, Logs.type, Logs.representation, Logs.datetime
FROM Users
JOIN Logs ON Users.id = Logs.User_id;

SELECT Users.nickname, Review.header
FROM Users
JOIN Archive ON Archive.User_id = Users.id
JOIN ReviewAndArchive ON ReviewAndArchive.Archive_id = Archive.id
JOIN Review ON ReviewAndArchive.Review_id = Review.id;

SELECT Archive.id, Users.nickname
FROM Archive
LEFT JOIN Users ON Archive.User_id = Users.id;

SELECT Archive.id, Users.nickname
FROM Archive
RIGHT JOIN Users ON Archive.User_id = Users.id;

SELECT Users.nickname, COUNT(Review.id) as ReviewsCount
FROM Users
LEFT JOIN Archive ON Archive.User_id = Users.id
LEFT JOIN ReviewAndArchive ON ReviewAndArchive.Archive_id = Archive.id
LEFT JOIN Review ON ReviewAndArchive.Review_id = Review.id
GROUP BY Users.nickname
HAVING ReviewsCount >= 1;

SELECT AVG(Rating.grade), Review.header
FROM Rating
RIGHT JOIN Review ON Review.id = Rating.review_id
GROUP BY Review.header;

SELECT AVG(Rating.grade), Review.header
FROM Rating
LEFT JOIN Review ON Review.id = Rating.review_id
GROUP BY Review.header;



