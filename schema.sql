ALTER TABLE jwt_tokens
        drop constraint FKhy6n4wirmw0ryw2wdmy9cx2mn;

ALTER TABLE jwt_tokens_aud
  DROP CONSTRAINT FK6jp64i8dvuahfik6kui8prbjd;

ALTER TABLE permissions_aud
  DROP CONSTRAINT FKbcjh1knyfnk51nv2cllrct4iw;

ALTER TABLE roles_aud
  DROP CONSTRAINT FKt0mnl3rej2p0h9gxnbalf2kdd;

ALTER TABLE roles_permissions
        drop constraint FKeqt383nibym26cjj8we4uar8h;

ALTER TABLE roles_permissions
        drop constraint FKqi9odri6c1o81vjox54eedwyh;

ALTER TABLE roles_permissions_aud
  DROP CONSTRAINT FKnofx22xg9kko3i1geh4jikive;

ALTER TABLE users_aud
  DROP CONSTRAINT FKc4vk4tui2la36415jpgm9leoq;

ALTER TABLE users_roles
        drop constraint FKa62j07k5mhgifpp955h37ponj;

ALTER TABLE users_roles
        drop constraint FK2o0jvgh89lemvvo17cbqvdxaa;

ALTER TABLE users_roles_aud
  DROP CONSTRAINT FKktxqr55ntd0j2i228uj8sq6j9;

    drop table if exists jwt_tokens cascade;

DROP TABLE IF EXISTS jwt_tokens_aud CASCADE;

    drop table if exists permissions cascade;

DROP TABLE IF EXISTS permissions_aud CASCADE;

DROP TABLE IF EXISTS revinfo CASCADE;

    drop table if exists roles cascade;

DROP TABLE IF EXISTS roles_aud CASCADE;

    drop table if exists roles_permissions cascade;

DROP TABLE IF EXISTS roles_permissions_aud CASCADE;

    drop table if exists users cascade;

DROP TABLE IF EXISTS users_aud CASCADE;

    drop table if exists users_roles cascade;

DROP TABLE IF EXISTS users_roles_aud CASCADE;

DROP SEQUENCE hibernate_sequence;

    drop sequence sequence_jwt_tokens;

    drop sequence sequence_permissions;

    drop sequence sequence_roles;

    drop sequence sequence_users;

CREATE SEQUENCE hibernate_sequence START 1 INCREMENT 1;

    create sequence sequence_jwt_tokens start 1 increment 1;

    create sequence sequence_permissions start 1 increment 1;

    create sequence sequence_roles start 1 increment 1;

    create sequence sequence_users start 1 increment 1;

    create table jwt_tokens (
      id                INT8         NOT NULL,
      uuid              VARCHAR(255) NOT NULL,
      version           INT8,
      created_by        INT8,
      created_date      TIMESTAMP    NOT NULL,
      updated_by        INT8,
      updated_date      TIMESTAMP,
      active            BOOLEAN      NOT NULL,
      expiration_date   TIMESTAMP    NOT NULL,
      invalidated       BOOLEAN      NOT NULL,
      invalidation_date TIMESTAMP,
      ip_adress         VARCHAR(39)  NOT NULL,
      user_id           INT8,
        primary key (id)
    );

CREATE TABLE jwt_tokens_aud (
  id                INT8 NOT NULL,
  rev               INT4 NOT NULL,
  revtype           INT2,
  uuid              VARCHAR(255),
  created_by        INT8,
  created_date      TIMESTAMP,
  updated_by        INT8,
  updated_date      TIMESTAMP,
  active            BOOLEAN,
  expiration_date   TIMESTAMP,
  invalidated       BOOLEAN,
  invalidation_date TIMESTAMP,
  ip_adress         VARCHAR(39),
  user_id           INT8,
  PRIMARY KEY (id, rev)
    );

    create table permissions (
      id           INT8         NOT NULL,
      uuid         VARCHAR(255) NOT NULL,
      version      INT8,
      created_by   INT8,
      created_date TIMESTAMP    NOT NULL,
      updated_by   INT8,
      updated_date TIMESTAMP,
      name         VARCHAR(64)  NOT NULL,
        primary key (id)
    );

CREATE TABLE permissions_aud (
  id           INT8 NOT NULL,
  rev          INT4 NOT NULL,
  revtype      INT2,
  uuid         VARCHAR(255),
  created_by   INT8,
  created_date TIMESTAMP,
  updated_by   INT8,
  updated_date TIMESTAMP,
  name         VARCHAR(64),
  PRIMARY KEY (id, rev)
    );

CREATE TABLE revinfo (
  rev      INT4 NOT NULL,
  revtstmp INT8,
  PRIMARY KEY (rev)
    );

    create table roles (
      id           INT8         NOT NULL,
      uuid         VARCHAR(255) NOT NULL,
      version      INT8,
      created_by   INT8,
      created_date TIMESTAMP    NOT NULL,
      updated_by   INT8,
      updated_date TIMESTAMP,
      name         VARCHAR(64)  NOT NULL,
        primary key (id)
    );

CREATE TABLE roles_aud (
  id           INT8 NOT NULL,
  rev          INT4 NOT NULL,
  revtype      INT2,
  uuid         VARCHAR(255),
  created_by   INT8,
  created_date TIMESTAMP,
  updated_by   INT8,
  updated_date TIMESTAMP,
  name         VARCHAR(64),
  PRIMARY KEY (id, rev)
    );

    create table roles_permissions (
        role_id int8 not null,
        permissions_id int8 not null,
        primary key (role_id, permissions_id)
    );

CREATE TABLE roles_permissions_aud (
  rev            INT4 NOT NULL,
  role_id        INT8 NOT NULL,
  permissions_id INT8 NOT NULL,
  revtype        INT2,
  PRIMARY KEY (rev, role_id, permissions_id)
    );

    create table users (
      id           INT8         NOT NULL,
      uuid         VARCHAR(255) NOT NULL,
      version      INT8,
      created_by   INT8,
      created_date TIMESTAMP    NOT NULL,
      updated_by   INT8,
      updated_date TIMESTAMP,
      email        VARCHAR(250) NOT NULL,
      enabled      BOOLEAN      NOT NULL,
      expired      BOOLEAN      NOT NULL,
      first_name   VARCHAR(120) NOT NULL,
      last_name    VARCHAR(120) NOT NULL,
      locked       BOOLEAN      NOT NULL,
      password     VARCHAR(64)  NOT NULL,
      username     VARCHAR(250) NOT NULL,
        primary key (id)
    );

CREATE TABLE users_aud (
  id           INT8 NOT NULL,
  rev          INT4 NOT NULL,
  revtype      INT2,
  uuid         VARCHAR(255),
  created_by   INT8,
  created_date TIMESTAMP,
  updated_by   INT8,
  updated_date TIMESTAMP,
  email        VARCHAR(250),
  enabled      BOOLEAN,
  expired      BOOLEAN,
  first_name   VARCHAR(120),
  last_name    VARCHAR(120),
  locked       BOOLEAN,
  password     VARCHAR(64),
  username     VARCHAR(250),
  PRIMARY KEY (id, rev)
    );

    create table users_roles (
        user_id int8 not null,
        roles_id int8 not null,
        primary key (user_id, roles_id)
    );

CREATE TABLE users_roles_aud (
  rev      INT4 NOT NULL,
  user_id  INT8 NOT NULL,
  roles_id INT8 NOT NULL,
  revtype  INT2,
  PRIMARY KEY (rev, user_id, roles_id)
    );

ALTER TABLE permissions
        add constraint UK_pnvtwliis6p05pn6i3ndjrqt2 unique (name);

ALTER TABLE roles
        add constraint UK_ofx66keruapi6vyqpv6f2or37 unique (name);

ALTER TABLE roles_permissions
        add constraint UK_oll9subcln0cdjt31bp72a3uv unique (permissions_id);

ALTER TABLE users
        add constraint UK_r43af9ap4edm43mmtq01oddj6 unique (username);

ALTER TABLE users_roles
        add constraint UK_60loxav507l5mreo05v0im1lq unique (roles_id);

ALTER TABLE jwt_tokens
  ADD CONSTRAINT FKhy6n4wirmw0ryw2wdmy9cx2mn
FOREIGN KEY (user_id)
        references users;

ALTER TABLE jwt_tokens_aud
  ADD CONSTRAINT FK6jp64i8dvuahfik6kui8prbjd
FOREIGN KEY (rev)
REFERENCES revinfo;

ALTER TABLE permissions_aud
  ADD CONSTRAINT FKbcjh1knyfnk51nv2cllrct4iw
FOREIGN KEY (rev)
REFERENCES revinfo;

ALTER TABLE roles_aud
  ADD CONSTRAINT FKt0mnl3rej2p0h9gxnbalf2kdd
FOREIGN KEY (rev)
REFERENCES revinfo;

ALTER TABLE roles_permissions
  ADD CONSTRAINT FKeqt383nibym26cjj8we4uar8h
FOREIGN KEY (permissions_id)
        references roles;

ALTER TABLE roles_permissions
  ADD CONSTRAINT FKqi9odri6c1o81vjox54eedwyh
FOREIGN KEY (role_id)
        references roles;

ALTER TABLE roles_permissions_aud
  ADD CONSTRAINT FKnofx22xg9kko3i1geh4jikive
FOREIGN KEY (rev)
REFERENCES revinfo;

ALTER TABLE users_aud
  ADD CONSTRAINT FKc4vk4tui2la36415jpgm9leoq
FOREIGN KEY (rev)
REFERENCES revinfo;

ALTER TABLE users_roles
  ADD CONSTRAINT FKa62j07k5mhgifpp955h37ponj
FOREIGN KEY (roles_id)
        references roles;

ALTER TABLE users_roles
  ADD CONSTRAINT FK2o0jvgh89lemvvo17cbqvdxaa
FOREIGN KEY (user_id)
        references users;

ALTER TABLE users_roles_aud
  ADD CONSTRAINT FKktxqr55ntd0j2i228uj8sq6j9
FOREIGN KEY (rev)
REFERENCES revinfo;
