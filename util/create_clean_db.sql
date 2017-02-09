CREATE TABLE tab_team_debaters (
    id integer NOT NULL PRIMARY KEY,
    team_id integer NOT NULL,
    debater_id integer NOT NULL REFERENCES tab_debater (id),
    UNIQUE (team_id, debater_id)
);
CREATE TABLE tab_team (
    id integer NOT NULL PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE,
    school_id integer NOT NULL REFERENCES tab_school (id),
    seed integer NOT NULL,
    checked_in bool NOT NULL
);
CREATE TABLE tab_tabsettings (
    id integer NOT NULL PRIMARY KEY,
    `key` varchar(20) NOT NULL UNIQUE,
    value integer NOT NULL
);
INSERT INTO tab_tabsettings VALUES (1,'cur_round',1);
INSERT INTO tab_tabsettings VALUES (2,'tot_rounds',5);
INSERT INTO tab_tabsettings VALUES (3,'var_teams_to_break',8);
INSERT INTO tab_tabsettings VALUES (4,'nov_teams_to_break',4);
INSERT INTO tab_tabsettings VALUES (5,'lenient_late',0);
CREATE TABLE tab_scratch (
    id integer NOT NULL PRIMARY KEY,
    judge_id integer NOT NULL REFERENCES tab_judge (id),
    team_id integer NOT NULL REFERENCES tab_team (id),
    scratch_type integer NOT NULL
);
CREATE TABLE tab_school (
    id integer NOT NULL PRIMARY KEY,
    name varchar(50) NOT NULL UNIQUE
);
CREATE TABLE tab_roundstats (
    id integer NOT NULL PRIMARY KEY,
    debater_id integer NOT NULL REFERENCES tab_debater (id),
    round_id integer NOT NULL REFERENCES tab_round (id),
    speaks decimal NOT NULL,
    ranks decimal NOT NULL,
    debater_role varchar(4)
);
CREATE TABLE tab_round_judges (
    id integer NOT NULL PRIMARY KEY,
    round_id integer NOT NULL,
    judge_id integer NOT NULL REFERENCES tab_judge (id),
    UNIQUE (round_id, judge_id)
);
CREATE TABLE tab_round (
    id integer NOT NULL PRIMARY KEY,
    round_number integer NOT NULL,
    gov_team_id integer NOT NULL REFERENCES tab_team (id),
    opp_team_id integer NOT NULL REFERENCES tab_team (id),
    chair_id integer REFERENCES tab_judge (id),
    pullup integer NOT NULL,
    room_id integer NOT NULL REFERENCES tab_room (id),
    victor integer NOT NULL
);
CREATE TABLE tab_room (
    id integer NOT NULL PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE,
    rank decimal NOT NULL
);
CREATE TABLE tab_noshow (
	id integer NOT NULL,
	no_show_team_id integer NOT NULL,
	round_number integer NOT NULL,
	lenient_late bool,
	PRIMARY KEY(id),
	FOREIGN KEY(no_show_team_id) REFERENCES tab_team(id)
);
CREATE TABLE tab_judge_schools (
    id integer NOT NULL PRIMARY KEY,
    judge_id integer NOT NULL,
    school_id integer NOT NULL REFERENCES tab_school (id),
    UNIQUE (judge_id, school_id)
);
CREATE TABLE tab_judge (
    id integer NOT NULL PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE,
    rank decimal NOT NULL,
    phone varchar(20) NOT NULL,
    provider varchar(40) NOT NULL
);
CREATE TABLE tab_debater (
    id integer NOT NULL PRIMARY KEY,
    name varchar(30) NOT NULL UNIQUE,
    phone varchar(20) NOT NULL,
    provider varchar(40) NOT NULL,
    novice_status integer NOT NULL
);
CREATE TABLE tab_checkin (
    id integer NOT NULL PRIMARY KEY,
    judge_id integer NOT NULL REFERENCES tab_judge (id),
    round_number integer NOT NULL
);
CREATE TABLE tab_bye (
    id integer NOT NULL PRIMARY KEY,
    bye_team_id integer NOT NULL REFERENCES tab_team (id),
    round_number integer NOT NULL
);
CREATE TABLE south_migrationhistory (
    id integer NOT NULL PRIMARY KEY,
    app_name varchar(255) NOT NULL,
    migration varchar(255) NOT NULL,
    applied datetime NOT NULL
);
CREATE TABLE django_session (
    session_key varchar(40) NOT NULL PRIMARY KEY,
    session_data text NOT NULL,
    expire_date datetime NOT NULL
);
INSERT INTO django_session VALUES ('yxwvgpfwe32qp2wb0ud1hfidqe4h3sa2','NzNlMzBiMjcyNzAzNzMxNmFjNDkyNTdhNzIyYzU3MDM5NjQ1ZGViZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-02-12 08:49:18.618892');
INSERT INTO django_session VALUES ('uz5yz9ca5e8qd99svj0fobuxl8isforv','NmYxNzFhOGJmOTBmYzEyZGVmNzM4NGI2NTliMWZhMjQxOGEwZTMxYjp7fQ==','2014-03-11 07:57:54.162721');
INSERT INTO django_session VALUES ('ym53x539ruvfpjk5kgviijmajio70mf5','NTM4M2E5MmQ4OWVkYWJhNGU2MWNiNGJhNTc5NjIxNjc1YzFmODNmODp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2014-03-11 08:01:52.463006');
CREATE TABLE django_content_type (
    id integer NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    app_label varchar(100) NOT NULL,
    model varchar(100) NOT NULL,
    UNIQUE (app_label, model)
);
INSERT INTO django_content_type VALUES (1,'log entry','admin','logentry');
INSERT INTO django_content_type VALUES (2,'permission','auth','permission');
INSERT INTO django_content_type VALUES (3,'group','auth','group');
INSERT INTO django_content_type VALUES (4,'user','auth','user');
INSERT INTO django_content_type VALUES (5,'content type','contenttypes','contenttype');
INSERT INTO django_content_type VALUES (6,'session','sessions','session');
INSERT INTO django_content_type VALUES (7,'migration history','south','migrationhistory');
INSERT INTO django_content_type VALUES (8,'tab settings','tab','tabsettings');
INSERT INTO django_content_type VALUES (9,'school','tab','school');
INSERT INTO django_content_type VALUES (10,'debater','tab','debater');
INSERT INTO django_content_type VALUES (11,'team','tab','team');
INSERT INTO django_content_type VALUES (12,'judge','tab','judge');
INSERT INTO django_content_type VALUES (13,'scratch','tab','scratch');
INSERT INTO django_content_type VALUES (14,'room','tab','room');
INSERT INTO django_content_type VALUES (15,'round','tab','round');
INSERT INTO django_content_type VALUES (16,'bye','tab','bye');
INSERT INTO django_content_type VALUES (17,'no show','tab','noshow');
INSERT INTO django_content_type VALUES (18,'round stats','tab','roundstats');
INSERT INTO django_content_type VALUES (19,'check in','tab','checkin');
CREATE TABLE django_admin_log (
    id integer NOT NULL PRIMARY KEY,
    action_time datetime NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr varchar(200) NOT NULL,
    action_flag smallint unsigned NOT NULL,
    change_message text NOT NULL
);
INSERT INTO django_admin_log VALUES (1,'2014-02-25 08:02:05.388120',1,4,'2','entry',1,'');
INSERT INTO django_admin_log VALUES (2,'2014-02-25 08:02:40.270576',1,4,'2','entry',2,'Changed is_staff and user_permissions.');
INSERT INTO django_admin_log VALUES (3,'2014-02-25 08:02:51.072567',1,4,'1','tab',2,'Changed email.');
CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL PRIMARY KEY,
    user_id integer NOT NULL,
    permission_id integer NOT NULL REFERENCES auth_permission (id),
    UNIQUE (user_id, permission_id)
);
INSERT INTO auth_user_user_permissions VALUES (1,2,28);
INSERT INTO auth_user_user_permissions VALUES (2,2,29);
INSERT INTO auth_user_user_permissions VALUES (3,2,30);
CREATE TABLE auth_user_groups (
    id integer NOT NULL PRIMARY KEY,
    user_id integer NOT NULL,
    group_id integer NOT NULL REFERENCES auth_group (id),
    UNIQUE (user_id, group_id)
);
CREATE TABLE auth_user (
    id integer NOT NULL PRIMARY KEY,
    password varchar(128) NOT NULL,
    last_login datetime NOT NULL,
    is_superuser bool NOT NULL,
    username varchar(30) NOT NULL UNIQUE,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    email varchar(75) NOT NULL,
    is_staff bool NOT NULL,
    is_active bool NOT NULL,
    date_joined datetime NOT NULL
);
INSERT INTO auth_user VALUES (1,'pbkdf2_sha256$12000$nYG2DQF2hZqE$zqowLaDoH5hWJESE8p0NlQNmYPoAdf+jF1WRpJTNq/Y=','2014-02-25 08:01:52',1,'tab','','','jolynch@mit.edu',1,1,'2014-01-29 08:27:31');
INSERT INTO auth_user VALUES (2,'pbkdf2_sha256$12000$DLVPWJm7LxbY$PNYPrL/1eyo/I2IdEYls2SY634KJrIGlwTbBV6/REBs=','2014-02-25 08:02:05',0,'entry','','','',1,1,'2014-02-25 08:02:05');
CREATE TABLE auth_permission (
    id integer NOT NULL PRIMARY KEY,
    name varchar(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename varchar(100) NOT NULL,
    UNIQUE (content_type_id, codename)
);
INSERT INTO auth_permission VALUES (1,'Can add log entry',1,'add_logentry');
INSERT INTO auth_permission VALUES (2,'Can change log entry',1,'change_logentry');
INSERT INTO auth_permission VALUES (3,'Can delete log entry',1,'delete_logentry');
INSERT INTO auth_permission VALUES (4,'Can add permission',2,'add_permission');
INSERT INTO auth_permission VALUES (5,'Can change permission',2,'change_permission');
INSERT INTO auth_permission VALUES (6,'Can delete permission',2,'delete_permission');
INSERT INTO auth_permission VALUES (7,'Can add group',3,'add_group');
INSERT INTO auth_permission VALUES (8,'Can change group',3,'change_group');
INSERT INTO auth_permission VALUES (9,'Can delete group',3,'delete_group');
INSERT INTO auth_permission VALUES (10,'Can add user',4,'add_user');
INSERT INTO auth_permission VALUES (11,'Can change user',4,'change_user');
INSERT INTO auth_permission VALUES (12,'Can delete user',4,'delete_user');
INSERT INTO auth_permission VALUES (13,'Can add content type',5,'add_contenttype');
INSERT INTO auth_permission VALUES (14,'Can change content type',5,'change_contenttype');
INSERT INTO auth_permission VALUES (15,'Can delete content type',5,'delete_contenttype');
INSERT INTO auth_permission VALUES (16,'Can add session',6,'add_session');
INSERT INTO auth_permission VALUES (17,'Can change session',6,'change_session');
INSERT INTO auth_permission VALUES (18,'Can delete session',6,'delete_session');
INSERT INTO auth_permission VALUES (19,'Can add migration history',7,'add_migrationhistory');
INSERT INTO auth_permission VALUES (20,'Can change migration history',7,'change_migrationhistory');
INSERT INTO auth_permission VALUES (21,'Can delete migration history',7,'delete_migrationhistory');
INSERT INTO auth_permission VALUES (22,'Can add tab settings',8,'add_tabsettings');
INSERT INTO auth_permission VALUES (23,'Can change tab settings',8,'change_tabsettings');
INSERT INTO auth_permission VALUES (24,'Can delete tab settings',8,'delete_tabsettings');
INSERT INTO auth_permission VALUES (25,'Can add school',9,'add_school');
INSERT INTO auth_permission VALUES (26,'Can change school',9,'change_school');
INSERT INTO auth_permission VALUES (27,'Can delete school',9,'delete_school');
INSERT INTO auth_permission VALUES (28,'Can add debater',10,'add_debater');
INSERT INTO auth_permission VALUES (29,'Can change debater',10,'change_debater');
INSERT INTO auth_permission VALUES (30,'Can delete debater',10,'delete_debater');
INSERT INTO auth_permission VALUES (31,'Can add team',11,'add_team');
INSERT INTO auth_permission VALUES (32,'Can change team',11,'change_team');
INSERT INTO auth_permission VALUES (33,'Can delete team',11,'delete_team');
INSERT INTO auth_permission VALUES (34,'Can add judge',12,'add_judge');
INSERT INTO auth_permission VALUES (35,'Can change judge',12,'change_judge');
INSERT INTO auth_permission VALUES (36,'Can delete judge',12,'delete_judge');
INSERT INTO auth_permission VALUES (37,'Can add scratch',13,'add_scratch');
INSERT INTO auth_permission VALUES (38,'Can change scratch',13,'change_scratch');
INSERT INTO auth_permission VALUES (39,'Can delete scratch',13,'delete_scratch');
INSERT INTO auth_permission VALUES (40,'Can add room',14,'add_room');
INSERT INTO auth_permission VALUES (41,'Can change room',14,'change_room');
INSERT INTO auth_permission VALUES (42,'Can delete room',14,'delete_room');
INSERT INTO auth_permission VALUES (43,'Can add round',15,'add_round');
INSERT INTO auth_permission VALUES (44,'Can change round',15,'change_round');
INSERT INTO auth_permission VALUES (45,'Can delete round',15,'delete_round');
INSERT INTO auth_permission VALUES (46,'Can add bye',16,'add_bye');
INSERT INTO auth_permission VALUES (47,'Can change bye',16,'change_bye');
INSERT INTO auth_permission VALUES (48,'Can delete bye',16,'delete_bye');
INSERT INTO auth_permission VALUES (49,'Can add no show',17,'add_noshow');
INSERT INTO auth_permission VALUES (50,'Can change no show',17,'change_noshow');
INSERT INTO auth_permission VALUES (51,'Can delete no show',17,'delete_noshow');
INSERT INTO auth_permission VALUES (52,'Can add round stats',18,'add_roundstats');
INSERT INTO auth_permission VALUES (53,'Can change round stats',18,'change_roundstats');
INSERT INTO auth_permission VALUES (54,'Can delete round stats',18,'delete_roundstats');
INSERT INTO auth_permission VALUES (55,'Can add check in',19,'add_checkin');
INSERT INTO auth_permission VALUES (56,'Can change check in',19,'change_checkin');
INSERT INTO auth_permission VALUES (57,'Can delete check in',19,'delete_checkin');
CREATE TABLE auth_group_permissions (
    id integer NOT NULL PRIMARY KEY,
    group_id integer NOT NULL,
    permission_id integer NOT NULL REFERENCES auth_permission (id),
    UNIQUE (group_id, permission_id)
);
CREATE TABLE auth_group (
    id integer NOT NULL PRIMARY KEY,
    name varchar(80) NOT NULL UNIQUE
);
CREATE INDEX tab_team_debaters_abbefef2 ON tab_team_debaters (debater_id);
CREATE INDEX tab_team_debaters_95e8aaa1 ON tab_team_debaters (team_id);
CREATE INDEX tab_team_abbc0ae2 ON tab_team (school_id);
CREATE INDEX tab_scratch_95e8aaa1 ON tab_scratch (team_id);
CREATE INDEX tab_scratch_00051756 ON tab_scratch (judge_id);
CREATE INDEX tab_roundstats_abbefef2 ON tab_roundstats (debater_id);
CREATE INDEX tab_roundstats_68f7808b ON tab_roundstats (round_id);
CREATE INDEX tab_round_judges_68f7808b ON tab_round_judges (round_id);
CREATE INDEX tab_round_judges_00051756 ON tab_round_judges (judge_id);
CREATE INDEX tab_round_d370eb92 ON tab_round (gov_team_id);
CREATE INDEX tab_round_c9f5884f ON tab_round (room_id);
CREATE INDEX tab_round_ae0b9df7 ON tab_round (opp_team_id);
CREATE INDEX tab_round_5079e06f ON tab_round (chair_id);
CREATE INDEX tab_noshow_1e44af88 ON tab_noshow (no_show_team_id);
CREATE INDEX tab_judge_schools_abbc0ae2 ON tab_judge_schools (school_id);
CREATE INDEX tab_judge_schools_00051756 ON tab_judge_schools (judge_id);
CREATE INDEX tab_checkin_00051756 ON tab_checkin (judge_id);
CREATE INDEX tab_bye_518f943a ON tab_bye (bye_team_id);
CREATE INDEX django_session_b7b81f0c ON django_session (expire_date);
CREATE INDEX django_admin_log_6340c63c ON django_admin_log (user_id);
CREATE INDEX django_admin_log_37ef4eb4 ON django_admin_log (content_type_id);
CREATE INDEX auth_user_user_permissions_83d7f98b ON auth_user_user_permissions (permission_id);
CREATE INDEX auth_user_user_permissions_6340c63c ON auth_user_user_permissions (user_id);
CREATE INDEX auth_user_groups_6340c63c ON auth_user_groups (user_id);
CREATE INDEX auth_user_groups_5f412f9a ON auth_user_groups (group_id);
CREATE INDEX auth_permission_37ef4eb4 ON auth_permission (content_type_id);
CREATE INDEX auth_group_permissions_83d7f98b ON auth_group_permissions (permission_id);
CREATE INDEX auth_group_permissions_5f412f9a ON auth_group_permissions (group_id);
