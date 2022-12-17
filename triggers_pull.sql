USE reviews_service_db;

DELIMITER //
CREATE TRIGGER validate_rating
BEFORE INSERT
ON Rating
FOR EACH ROW
IF NEW.grade > 5 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Grade can\'t be more than 5';
END IF //

DROP TRIGGER validate_rating;//

CREATE TRIGGER validate_rating_upd
BEFORE UPDATE
ON Rating
FOR EACH ROW
IF NEW.grade > 5 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Grade can\'t be more than 5';
END IF //

CREATE TRIGGER validate_email
BEFORE INSERT
ON Users
FOR EACH ROW
IF NEW.email NOT LIKE "%@%" THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Invalid email';
END IF //

CREATE TRIGGER users_log_registered
AFTER INSERT
ON Users
FOR EACH ROW
INSERT INTO Logs(User_id, datetime, type, representation) VALUES(NEW.id, NOW(), "AUTH", "registered") //

CREATE TRIGGER users_log_update
AFTER UPDATE
ON Users
FOR EACH ROW
INSERT INTO Logs(User_id, datetime, type, representation) VALUES(NEW.id, NOW(), "UPDATE", "update user info") //

CREATE TRIGGER users_log_delete
AFTER DELETE
ON Users
FOR EACH ROW
INSERT INTO Logs(User_id, datetime, type, representation) VALUES(OLD.id, NOW(), "DELETE", "deleted user") //

CREATE TRIGGER review_log_create
AFTER INSERT
ON Review
FOR EACH ROW
INSERT INTO Logs(User_id, datetime, type, representation) VALUES(NEW.id, NOW(), "CREATE", "create review") //

CREATE TRIGGER review_log_update
AFTER UPDATE
ON Review
FOR EACH ROW
INSERT INTO Logs(User_id, datetime, type, representation) VALUES(NEW.id, NOW(), "UPDATE", "update review") //

CREATE TRIGGER review_log_delete
AFTER DELETE
ON Review
FOR EACH ROW
INSERT INTO Logs(User_id, datetime, type, representation) VALUES(OLD.id, NOW(), "DELETE", "delete review") //

DELIMITER ;

DROP TRIGGER users_log_delete;
