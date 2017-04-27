--1
SELECT *
FROM users;
--2
SELECT*
FROM posts
WHERE users_id = 100;
--3
SELECT posts.*, users.first_name, users.last_name
FROM posts
INNER JOIN users ON posts.id = users.id;
--I could also use left join but I want to be more explicit.
--4
SELECT posts.*, users.username
FROM posts
INNER JOIN users ON users.first_name = 'Norene' AND users.last_name = 'Schmitt';
--5
SELECT users.username
FROM users
INNER JOIN posts
ON posts.users_id = users.id
WHERE posts.created_at > '2015-01-01 00:00:00-10';
--6
SELECT posts.title, posts.content, users.username
FROM users
INNER JOIN posts
ON posts.users_id = users.id
WHERE posts.created_at < '2015-01-01 00:00:00-10';
--7
SELECT comments.*, posts.title AS post_title
FROM comments
LEFT JOIN posts
ON posts.id = comments.comment_id;
--8
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
left JOIN posts
ON posts.id = comments.comment_id
WHERE posts.created_at < '2015-01-01 00:00:00-10';
--9
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
left JOIN posts
ON posts.id = comments.comment_id
WHERE posts.created_at > '2015-01-01 00:00:00-10';
--10
SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
left JOIN posts
ON posts.id = comments.comment_id
WHERE comments.body LIKE  '%USB%';
--11
SELECT posts.title AS post_title, users.first_name, users.last_name, comments.body AS comment_body
FROM comments
left JOIN posts
ON posts.id = comments.comment_id
left JOIN users
ON posts.users_id = users.id
WHERE comments.body LIKE  '%matrix%';
--12
SELECT users.first_name, users.last_name, comments.body AS comment_body
FROM comments
left JOIN posts
ON posts.id = comments.comment_id
LEFT JOIN users
ON comments.users_id = users.id
WHERE comments.body LIKE  '%SSL%' AND posts.content LIKE '%dolorum%';
--13
SELECT users.first_name AS post_author_first_name, users.last_name AS post_author_last_name, posts.title AS post_title, users.username AS comment_author_username, comments.body AS comment_body
FROM posts
left JOIN comments
ON posts.id = comments.comment_id
left JOIN users
ON posts.users_id = users.id
WHERE posts.content LIKE '%nemo%' AND comments.body LIKE '%SSL%'
OR posts.content LIKE '%nemo%' AND comments.body LIKE '%firewall%';
--Additional Queries
