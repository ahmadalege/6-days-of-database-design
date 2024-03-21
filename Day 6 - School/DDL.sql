BEGIN;


CREATE TABLE IF NOT EXISTS public.student
(
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50),
    last_name character varying(50) NOT NULL,
    gender character varying(10),
    "D.O.B" date NOT NULL,
    enrolment_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.guardian
(
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    email character varying NOT NULL,
    phone_number character varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.student_guardian
(
    student_id integer NOT NULL,
    guardian_id integer NOT NULL,
    guardian_type_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.gurdian_type
(
    id integer NOT NULL,
    relationship character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.school_year
(
    id integer NOT NULL,
    start_date date,
    end_date date,
    name character varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.term
(
    id integer NOT NULL,
    year_id integer NOT NULL,
    term_number integer,
    start_date date,
    end_date date,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.level
(
    id integer NOT NULL,
    level_name integer NOT NULL,
    level_order integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.student_level
(
    level_id integer NOT NULL,
    student_id integer NOT NULL,
    year_id integer NOT NULL,
    score integer
);

CREATE TABLE IF NOT EXISTS public.class
(
    id integer NOT NULL,
    subject_id integer NOT NULL,
    teacher_id integer NOT NULL,
    term_id integer NOT NULL,
    class_name character varying,
    classroom_id integer,
    start_period_id integer,
    end_period_id integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.student_class
(
    student_id integer NOT NULL,
    class_id integer NOT NULL,
    score integer
);

CREATE TABLE IF NOT EXISTS public.subject
(
    id integer NOT NULL,
    subject_name character varying NOT NULL,
    department_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.department
(
    id integer NOT NULL,
    department_name character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.teacher
(
    id integer NOT NULL,
    class_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    gender character varying NOT NULL,
    email character varying,
    phone_number character varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.classroom
(
    id integer NOT NULL,
    classroom_type integer NOT NULL,
    classroom_name character varying,
    capacity integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.classroom_type
(
    id integer NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.period
(
    id integer NOT NULL,
    start_time time without time zone,
    end_time time without time zone,
    year_id integer NOT NULL,
    name character varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.score_range
(
    id integer NOT NULL,
    grade "char",
    min_score integer,
    max_score integer,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.student_guardian
    ADD CONSTRAINT student_id FOREIGN KEY (student_id)
    REFERENCES public.student (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.student_guardian
    ADD CONSTRAINT guardian_id FOREIGN KEY (guardian_id)
    REFERENCES public.guardian (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.student_guardian
    ADD CONSTRAINT guardian_type_id FOREIGN KEY (guardian_type_id)
    REFERENCES public.gurdian_type (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.term
    ADD CONSTRAINT year_id FOREIGN KEY (year_id)
    REFERENCES public.school_year (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.student_level
    ADD CONSTRAINT student_id FOREIGN KEY (student_id)
    REFERENCES public.student (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.student_level
    ADD CONSTRAINT level_id FOREIGN KEY (level_id)
    REFERENCES public.level (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.student_level
    ADD CONSTRAINT year_id FOREIGN KEY (year_id)
    REFERENCES public.school_year (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.class
    ADD CONSTRAINT subject_id FOREIGN KEY (subject_id)
    REFERENCES public.subject (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.class
    ADD CONSTRAINT teacher_id FOREIGN KEY (teacher_id)
    REFERENCES public.teacher (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.class
    ADD CONSTRAINT term_id FOREIGN KEY (term_id)
    REFERENCES public.term (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.class
    ADD CONSTRAINT classroom_id FOREIGN KEY (classroom_id)
    REFERENCES public.classroom (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.class
    ADD CONSTRAINT start_period_id FOREIGN KEY (start_period_id)
    REFERENCES public.period (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.class
    ADD CONSTRAINT end_period_id FOREIGN KEY (end_period_id)
    REFERENCES public.period (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.student_class
    ADD CONSTRAINT class_id FOREIGN KEY (class_id)
    REFERENCES public.class (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.student_class
    ADD CONSTRAINT student_id FOREIGN KEY (student_id)
    REFERENCES public.student (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.subject
    ADD CONSTRAINT department_id FOREIGN KEY (department_id)
    REFERENCES public.department (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.classroom
    ADD CONSTRAINT room_type FOREIGN KEY (classroom_type)
    REFERENCES public.classroom_type (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.period
    ADD CONSTRAINT year_id FOREIGN KEY (year_id)
    REFERENCES public.school_year (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;