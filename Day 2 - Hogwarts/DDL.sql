CREATE TABLE IF NOT EXISTS student(
 id int NOT NULL,
 house_id int NOT NULL,
 first_name text,
 last_name text,
 year_enrolled date,
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS house(
 id int NOT NULL,
 house_name text,
 founder text,
 house_colour text,
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS house_points(
 id int NOT NULL,
 house_id int NOT NULL,
 year date,
 points int,
 PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS teacher(
	id int NOT NULL,
	first_name text,
	last_name text,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS teacher_head_of_house(
	id int NOT NULL,
	teacher_id int NOT NULL,
	house_id int NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS subject(
	id int NOT NULL,
	subject_name text,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS class(
	class_id int NOT NULL,
	teacher_id int NOT NULL, 
	subject_id int NOT NULL,
	year_taught date NOT NULL,
	PRIMARY KEY(class_id)
);

CREATE TABLE IF NOT EXISTS student_class (
	student_id int NOT NULL,
	class_id int NOT NULL
);

CREATE TABLE IF NOT EXISTS student_quiditch_team(
	id int NOT NULL,
	student_id int NOT NULL,
	quiditch_team_id int NOT NULL,
	position text NOT NULL,
	is_captain boolean NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS quiditch_team(
	id int NOT NULL,
	house_id int NOT NULL,
	year date,
	PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS match(
	id int NOT NULL,
	team1 int NOT NULL,
	team2 int NOT NULL, 
	team1_score int NOT NULL,
	team2_score int NOT NULL,
	date_played date 
);


ALTER TABLE IF EXISTS student
    ADD CONSTRAINT house_id FOREIGN KEY (house_id)
    REFERENCES house (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
	
ALTER TABLE IF EXISTS house_points
    ADD CONSTRAINT house_id FOREIGN KEY (house_id)
    REFERENCES house (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS student_class
    ADD CONSTRAINT student_id FOREIGN KEY (student_id)
    REFERENCES student (id) MATCH SIMPLE
	ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS student_class
    ADD CONSTRAINT class_id FOREIGN KEY (class_id)
    REFERENCES "class" (class_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS class
    ADD CONSTRAINT subject_id FOREIGN KEY (subject_id)
    REFERENCES subject (id) MATCH SIMPLE
	ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS class
    ADD CONSTRAINT teacher_id FOREIGN KEY (teacher_id)
    REFERENCES teacher (id) MATCH SIMPLE
	ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS quiditch_team
    ADD CONSTRAINT house_id FOREIGN KEY (house_id)
    REFERENCES house (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS match
    ADD CONSTRAINT team_id FOREIGN KEY (team1)
    REFERENCES quiditch_team(id) MATCH SIMPLE
	ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS match
    ADD CONSTRAINT team_2 FOREIGN KEY (team2)
    REFERENCES quiditch_team(id) MATCH SIMPLE
	ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS teacher_head_of_house
	ADD CONSTRAINT teacher_id FOREIGN KEY (teacher_id)
	REFERENCES teacher(id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
	NOT VALID;
	

ALTER TABLE IF EXISTS teacher_head_of_house
	ADD CONSTRAINT house_id FOREIGN KEY (house_id)
	REFERENCES house(id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
	NOT VALID;
	
	
ALTER TABLE IF EXISTS student_quiditch_team
	ADD CONSTRAINT student_id FOREIGN KEY (student_id)
	REFERENCES student (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
	NOT VALID;
	
	
	
ALTER TABLE IF EXISTS student_quiditch_team
	ADD CONSTRAINT quiditch_team_id FOREIGN KEY (quiditch_team_id)
	REFERENCES quiditch_team(id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
	NOT VALID;
	
	
	
Insert into house(id, house_name, founder, house_colour) 
VALUES(1, 'Gryffindor', 'Godric Gryffindor', 'scarlet red and gold'),
	  (2, 'Slytherin', 'Salazar Slytherin', 'green and silver'),
	  (3, 'Ravenclaw', 'Rowena Ravenclaw', 'blue and bronze'),
	  (4, 'Hufflepuff', 'Helga Hufflepuff', 'canary yelow and black');
 