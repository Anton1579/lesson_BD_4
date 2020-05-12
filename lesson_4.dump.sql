
-- 1.Повторить все действия по доработке БД vk.

USE vk;

SHOW TABLES;

-- users
SELECT * FROM users LIMIT 10;
UPDATE users SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at ;
SELECT * FROM user_statuses;
SELECT FLOOR(1 + RAND() * 3);
UPDATE users SET status_id = FLOOR(1 + RAND() * 3 ); 

-- profiles 
SELECT * FROM profiles LIMIT 15;
SELECT COUNT(*) FROM media;
-- photo_id random 
UPDATE profiles SET photo_id = FLOOR(1 + RAND() * 100 )
-- add gendres table
CREATE TEMPORARY TABLE genders(name CHAR(1));
INSERT INTO genders VALUES ('m'), ('w');
SELECT * FROM genders ;
SELECT name FROM genders ORDER BY RAND() LIMIT 1;
UPDATE profiles SET gender = (SELECT name FROM genders ORDER BY RAND() LIMIT 1);

SELECT * FROM messages LIMIT 15;
UPDATE messages SET from_user_id = FLOOR(1 + RAND() * 100 ),
                    to_user_id = FLOOR(1 + RAND() * 100 );

SELECT * FROM media LIMIT 15;
UPDATE media SET user_id = FLOOR(1 + RAND() * 100);

CREATE TEMPORARY TABLE extensions (name VARCHAR(10));
INSERT INTO extensions VALUES ('jpeg'), ('avi'), ('mp4'), ('png');

SELECT  * FROM extensions

UPDATE media SET filename = CONCAT('https://dropbox/vk/',
  filename,
  '.',
  (SELECT name FROM extensions ORDER BY RAND() LIMIT 1)
);

UPDATE media SET size = FLOOR(100000 + RAND() * 100000000) WHERE size < 1000;

UPDATE media SET metadata = CONCAT ('{"owner":"',
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id), 
  '"}')

DESC media;

ALTER TABLE media MODIFY COLUMN matadate JSON;

SELECT * FROM media_types;
DELETE FROM media_types;
 
INSERT INTO media_types (name) VALUES ('photo'), ('video'), ('audio');
TRUNCATE media_types;

UPDATE media SET media_type_id = FLOOR(1 + RAND() * 3); 
SELECT * FROM media LIMIT 15;

SELECT * FROM friendship LIMIT 15;

UPDATE friendship SET
  user_id = FLOOR(1 + RAND() * 100),
  friend_id = FLOOR(1 + RAND() * 100);
 
DESC friendship;

SELECT * FROM friendship_statuses;

TRUNCATE friendship_statuses;

INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected');
 
UPDATE friendship SET status_id = FLOOR(1 + RAND() * 3);
SELECT * FROM friendship LIMIT 15;

SELECT * FROM communities;
DELETE FROM communities WHERE id > 25;

SELECT * FROM communities_users;
SELECT *FROM communities_users WHERE community_id > 25;
UPDATE communities_users SET community_id = FLOOR(1 + RAND() * 25);

SELECT * FROM profiles LIMIT 15;




-- 3.(по желанию) Предложить свою реализацию лайков и постов.

-- 1. Можно создать временную таблицу и соеденить со всеми сообщениями с медиа, фото и видео.
CREATE TEMPORARY TABLE interests(name CHAR(1));
INSERT INTO interests VALUES ('like'), ('dislike');
-- 2 можем создать таблицу с постами, 
CREATE TEMPORARY TABLE fast (name VARCHAR(10));
INSERT INTO fast VALUES ('photo'), ('mp3'), ('mp4'), ('jpeg');
-- 3

UPDATE







