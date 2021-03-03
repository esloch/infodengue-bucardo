--
-- PostgreSQL database cluster bucardo
--

CREATE ROLE bucardo LOGIN SUPERUSER PASSWORD 'bucardoadmin';
CREATE DATABASE bucardo OWNER bucardo;

CREATE EXTENSION plperl;
CREATE LANGUAGE plperlu;
