

DROP DATABASE IF EXISTS has_many_blogs;
DROP USER IF EXISTS has_many_user;
CREATE USER has_many_user WITH ENCRYPTED PASSWORD 'letmein';
CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

\c has_many_blogs;

CREATE TABLE users (
 id serial PRIMARY KEY,
 username varchar(90) NOT NULL,
 first_name varchar(90),
 last_name varchar(90),
 created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
 updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

CREATE TABLE posts (
 id serial PRIMARY KEY,
 title varchar(180),
 url varchar(510),
 content text,
 created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
 updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
 users_id serial REFERENCES users (id)
);

CREATE TABLE comments (
 id serial PRIMARY KEY,
 body varchar(510),
 created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
 updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
 users_id serial REFERENCES users (id),
 comment_id serial REFERENCES posts (id)
);

\i scripts/blog_data.sql;