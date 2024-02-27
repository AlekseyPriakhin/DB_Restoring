CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

COPY users (id,name) FROM '/var/lib/db_data/users.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE publications (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    uid INTEGER REFERENCES users(id)
);

COPY publications (id,name,uid) FROM '/var/lib/db_data/publications.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE user_publication (
    user_id INTEGER REFERENCES users(id),
    publication_id INTEGER REFERENCES publications(id),
    PRIMARY KEY (user_id, publication_id)
);

INSERT INTO user_publication (user_id,publication_id) VALUES(1,1);
