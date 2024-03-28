CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

COPY users (id,name) FROM '/var/lib/db_data/users.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE courses (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    stages_count INTEGER NOT NULL
);

COPY courses (id,name,stages_count) FROM '/var/lib/db_data/courses.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE course_completing (
    id INTEGER PRIMARY KEY,
    uid INTEGER REFERENCES users(id),
    cid INTEGER REFERENCES courses(id),
    status INTEGER DEFAULT 0 /* 0 - Progress, 1 - Completed, 2 - Failed */    
);

COPY course_completing (id,uid,cid,status) FROM '/var/lib/db_data/course_completing.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE stages (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL, /* 0 - Webinar, 1 - Test, 2 - Document */
    duration INTERVAL DEFAULT '0 second'
);

COPY stages (id,name,type,duration) FROM '/var/lib/db_data/stages.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE stage_course_completing (
    sid INTEGER REFERENCES stages(id),
    cid INTEGER REFERENCES course_completing(id),
    PRIMARY KEY (sid, cid),
    progress INTEGER DEFAULT 0
);

COPY stage_course_completing (sid,cid,progress) FROM '/var/lib/db_data/stage_course_completing.csv' DELIMITER ',' CSV HEADER;