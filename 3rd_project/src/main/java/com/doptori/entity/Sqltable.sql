drop table member;
drop table room;
drop table quiz;

CREATE TABLE member (
 mb_num INT(4) NOT NULL AUTO_INCREMENT,
 mb_code INT(4) NOT NULL, 
 mb_id VARCHAR(100) NOT NULL,
 mb_pw VARCHAR(2000) NOT NULL,
 mb_nick VARCHAR(100) NOT NULL,
 mb_age VARCHAR(100) NOT NULL,
 mb_point INT(20) NOT NULL default 0,
 mb_accuracy INT(20) NOT NULL default 0,
 mb_friend VARCHAR(2000),
 mb_room VARCHAR(2000),
 mb_sentence VARCHAR(200),
  PRIMARY KEY(mb_num),
  UNIQUE KEY(mb_id),
  UNIQUE KEY(mb_nick)
);


CREATE TABLE board (
 bd_num INT(4) NOT NULL AUTO_INCREMENT,
 bd_type INT(4) NOT NULL,
 bd_title VARCHAR(1000) NOT NULL,
 bd_content VARCHAR(2000) NOT NULL,
 bd_time datetime not null default now(),
 bd_writer VARCHAR(100) NOT NULL,
 bd_state INT(4) NOT NULL,
  PRIMARY KEY(bd_num)
);


CREATE TABLE room (
 rm_num INT(4) NOT NULL AUTO_INCREMENT,
 rm_host VARCHAR(100) NOT NULL,
 rm_join VARCHAR(2000),
  PRIMARY KEY(rm_num)
);


CREATE TABLE log (
 lg_num INT(4) NOT NULL AUTO_INCREMENT,
 lg_rm_num INT(4) NOT NULL,
 lg_mb_num INT(4) NOT NULL,
 lg_content VARCHAR(2000) NOT NULL,
 lg_time datetime not null default now(),
 lg_correct INT(4) NOT NULL,
  PRIMARY KEY(lg_num),
  FOREIGN KEY (lg_rm_num) REFERENCES room(rm_num)
);


CREATE TABLE quiz (
 qz_num INT(4) NOT NULL AUTO_INCREMENT,
 qz_question VARCHAR(2000) NOT NULL,
 qz_answer VARCHAR(2000) NOT NULL,
 qz_point INT(4) NOT NULL,
  PRIMARY KEY(qz_num)
);