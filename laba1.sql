CREATE TABLE gromov_courses(c_no text PRIMARY KEY, title text, hours integer);

INSERT INTO gromov_courses(c_no, title, hours)
VALUES ('CS301', 'Базы данных', 30),
('CS305', 'Сети ЭВМ', 60);

CREATE TABLE gromov_students(s_id integer PRIMARY KEY, name text, start_year integer);

INSERT INTO gromov_students(s_id, name, start_year)
VALUES (1451, 'Анна', 2014),
(1432, 'Виктор', 2014),
(1556, 'Нина', 2015);

CREATE TABLE exams(s_id integer REFERENCES gromov_students(s_id), c_no text REFERENCES gromov_courses(c_no),score integer,
CONSTRAINT pk PRIMARY KEY(s_id, c_no));

INSERT INTO exams(s_id, c_no, score)
VALUES (1451, 'CS301', 5),
(1556, 'CS301', 5),
(1451, 'CS305', 5),
(1432, 'CS305', 4);

SELECT clock_timestamp(), title AS course_title, hours FROM gromov_courses;

UPDATE gromov_courses SET hours = hours * 2 WHERE c_no = 'CS301';

DELETE FROM exams WHERE score < 5;

CREATE TABLE groups(g_no text PRIMARY KEY, monitor integer NOT NULL REFERENCES gromov_students(s_id));

ALTER TABLE gromov_students ADD g_no text REFERENCES groups(g_no);

BEGIN;
INSERT INTO groups(g_no, monitor) SELECT 'A-101', s_id FROM gromov_students WHERE name = 'Анна';
UPDATE gromov_students SET g_no = 'A-101';
COMMIT;

SELECT clock_timestamp(), * FROM groups;
SELECT clock_timestamp(), * FROM gromov_students

CREATE TABLE course_chapters(c_no text REFERENCES gromov_courses(c_no),
ch_no text, ch_title text, txt text, CONSTRAINT pkt_ch PRIMARY KEY(ch_no, c_no));

INSERT INTO course_chapters(c_no, ch_no,ch_title, txt) VALUES
('CS301', 'I', 'Базы данных',
'С этой главы начинается наше знакомство ' ||
'с миром баз данных'),
('CS301', 'II', 'Первые шаги',
'Продолжаем знакомство с миром баз данных. ' ||
'Создадим нашу первую текстовую базу данных'),
('CS305', 'I', 'Локальные сети',
'Здесь начинается наше ' ||
'путешествие в мир сетей');

SELECT clock_timestamp(), ch_no AS no, ch_title, txt FROM course_chapters;
SELECT txt FROM course_chapters WHERE txt LIKE '%базы данных%';

ALTER TABLE course_chapters ADD txtvector tsvector;
UPDATE course_chapters SET txtvector = to_tsvector('russian',txt);
SELECT txtvector FROM course_chapters;

UPDATE course_chapters SET txtvector =
setweight(to_tsvector('russian',ch_title),'B') || ' ' ||
setweight(to_tsvector('russian',txt),'D');
SELECT clock_timestamp(), txtvector FROM course_chapters;

CREATE TABLE student_details(de_id int, s_id int REFERENCES gromov_students(s_id),
details json, CONSTRAINT pk_d PRIMARY KEY(s_id, de_id));

INSERT INTO student_details
(de_id, s_id, details)
VALUES
(1, 1451,
'{ "достоинства": "отсутствуют",
"недостатки":
"неумеренное употребление "
}'),
(2, 1432,
'{ "хобби":
{ "гитарист":
{ "группа": "Постгрессоры",
"гитары":["страт","телек"]
}
}
}'),
(3, 1556,
'{ "хобби": "косплей",
"достоинства":
{ "мать-героиня":
{ "Вася": "м",
"Семен": "м",
"Люся": "ж",
"Макар": "м",
"Саша":"сведения отсутствуют "
}
}
}'),
(4, 1451,
'{ "статус": "отчислена"
}');

SELECT s.name, sd.details FROM student_details sd, gromov_students s WHERE s.s_id = sd.s_id;

SELECT s.name, sd.details FROM student_details sd, gromov_students s
WHERE s.s_id = sd.s_id AND sd.details ->> 'достоинства' IS NOT NULL;

SELECT clock_timestamp(), sd.de_id, s.name,
sd.details #> '{хобби,гитарист,гитары}'
FROM student_details sd, gromov_students s
WHERE s.s_id = sd.s_id
AND sd.details #> '{хобби,гитарист,гитары}'
IS NOT NULL;

ALTER TABLE student_details ADD details_b jsonb;
UPDATE student_details SET details_b = to_jsonb(details);

SELECT s.name, jsonb_pretty(sd.details_b) json
FROM student_details sd, gromov_students s WHERE s.s_id = sd.s_id
AND sd.details_b @> '{"достоинства":{"мать-героиня":{}}}';

SELECT s.name, jsonb_each(sd.details_b)
FROM student_details sd, gromov_students s WHERE s.s_id = sd.s_id
AND sd.details_b @>
'{"достоинства":{"мать-героиня":{}}}';

SELECT clock_timestamp(), s_id, jsonb_path_query(details::jsonb,
'$.хобби ? (@ == "косплей")') FROM student_details;

SELECT clock_timestamp(), s_id, jsonb_path_query(details::jsonb,
'$.хобби.гитарист.группа?(@=="Постгрессоры")') FROM student_details;

SELECT clock_timestamp(), s_id, jsonb_path_query(details::jsonb,
'$.хобби.гитарист?(@.группа=="Постгрессоры").группа')
FROM student_details;

SELECT clock_timestamp(), s_id, jsonb_path_exists(details::jsonb,
'$.** ? (@ == "страт")') FROM student_details;
