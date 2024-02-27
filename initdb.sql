CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    publications_count INTEGER NOT NULL
);

COPY users (id,name,publications_count) FROM '/var/lib/db_data/users.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE publications (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL,
    likes_count INTEGER DEFAULT 0,
    uid INTEGER REFERENCES users(id)
);

COPY publications (id,name,type,created_at,likes_count,uid) FROM '/var/lib/db_data/publications.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE likes (
    uid INTEGER REFERENCES users(id),
    pid INTEGER REFERENCES publications(id),
    PRIMARY KEY (pid, uid),
    liked_at TIMESTAMP NOT NULL
);