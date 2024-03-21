BEGIN;


CREATE TABLE IF NOT EXISTS public."user"
(
    id integer NOT NULL,
    display_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(50) NOT NULL,
    about_me character varying(140),
    location character varying(50),
    date_created date,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.post
(
    id integer NOT NULL,
    created_by_user_id integer NOT NULL,
    parent_question_id integer,
    post_type_id integer NOT NULL,
    accepted_answer_id integer,
    post_title character varying NOT NULL,
    post_body character varying,
    date_created date,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.tag
(
    id integer NOT NULL,
    tag_name character varying NOT NULL,
    tag_description character varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.question_tag
(
    question_id integer NOT NULL,
    tag_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.comment
(
    id integer NOT NULL,
    created_by_user_id integer NOT NULL,
    post_id integer NOT NULL,
    comment_text text NOT NULL,
    date_created date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.post_type
(
    id integer NOT NULL,
    type text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.vote
(
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    vote_type_id integer NOT NULL,
    date_created date,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.vote_type
(
    id integer NOT NULL,
    vote_type text,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.post
    ADD CONSTRAINT "user" FOREIGN KEY (created_by_user_id)
    REFERENCES public."user" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.post
    ADD CONSTRAINT parent_question_id FOREIGN KEY (parent_question_id)
    REFERENCES public.post (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.post
    ADD CONSTRAINT post_type_id FOREIGN KEY (post_type_id)
    REFERENCES public.post_type (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.post
    ADD CONSTRAINT accepte_answer FOREIGN KEY (accepted_answer_id)
    REFERENCES public.post (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.question_tag
    ADD CONSTRAINT question FOREIGN KEY (question_id)
    REFERENCES public.post (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.question_tag
    ADD CONSTRAINT tag FOREIGN KEY (tag_id)
    REFERENCES public.tag (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.comment
    ADD CONSTRAINT created_by_user_id FOREIGN KEY (created_by_user_id)
    REFERENCES public."user" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.comment
    ADD CONSTRAINT post_id FOREIGN KEY (post_id)
    REFERENCES public.post (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.vote
    ADD CONSTRAINT post_id FOREIGN KEY (post_id)
    REFERENCES public.post (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.vote
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
    REFERENCES public."user" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.vote
    ADD CONSTRAINT vote_type_id FOREIGN KEY (vote_type_id)
    REFERENCES public.vote_type (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;