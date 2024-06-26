BEGIN;


CREATE TABLE IF NOT EXISTS public.user_profile
(
    id integer NOT NULL,
    username character varying NOT NULL UNIQUE,
    email_address character varying NOT NULL UNIQUE,
    password character varying NOT NULL,
    country text NOT NULL,
    date_of_birth date NOT NULL,
    "First_name" text,
    last_name text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.friendship
(
    profile_request integer,
    profile_accept integer
);

CREATE TABLE IF NOT EXISTS public.posts
(
    id integer NOT NULL,
    profile_id integer NOT NULL,
    text_post text,
    media_location text,
    date_created date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.post_like
(
    id integer NOT NULL,
    post_id integer NOT NULL,
    profile_id integer NOT NULL,
    time_liked timestamp without time zone NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.post_comment
(
    id integer NOT NULL,
    post_id integer NOT NULL,
    profile_id integer NOT NULL,
    comment_text character varying(1000),
    time_commented timestamp without time zone NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.friendship
    ADD CONSTRAINT profile_request FOREIGN KEY (profile_request, profile_accept)
    REFERENCES public.user_profile (id, id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.posts
    ADD CONSTRAINT profile_id FOREIGN KEY (profile_id)
    REFERENCES public.user_profile (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.post_like
    ADD CONSTRAINT post_id FOREIGN KEY (post_id)
    REFERENCES public.posts (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.post_like
    ADD CONSTRAINT profile_id FOREIGN KEY (profile_id)
    REFERENCES public.user_profile (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
