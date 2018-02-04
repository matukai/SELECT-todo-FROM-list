


DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id  SERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NULL,
  completed BOOLEAN NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks
DROP COLUMN completed;

ALTER TABLE tasks
ADD completed_at timestamp NULL DEFAULT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description) VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at is NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks 
WHERE completed_at is null;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description) VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description) VALUES ('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title ~ 'mistake';

DELETE
FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks
WHERE title ~ 'mistake';

DELETE 
FROM tasks
WHERE title ~ 'mistake';

SELECT *
FROM tasks Order By title ASC;