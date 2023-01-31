CREATE TABLE member (
 mb_num INT(4) NOT NULL AUTO_INCREMENT,
 mb_type INT(4) NOT NULL,
 mb_id VARCHAR(200) NOT NULL,
 mb_pw VARCHAR(200) NOT NULL,
 mb_nick VARCHAR(200) NOT NULL,
 mb_ad_num INT(8),
 mb_fm_num INT(4),
 mb_chatlist VARCHAR(3000),
 mb_pic LONGBLOB,
  PRIMARY KEY(mb_num),
  UNIQUE KEY(mb_id),
  UNIQUE KEY(mb_nick)
);

CREATE TABLE Address (
 ad_num INT(8) NOT NULL AUTO_INCREMENT,
 ad_sido VARCHAR(100),
 ad_gugun VARCHAR(100),
 ad_dong VARCHAR(100),
 ad_ri VARCHAR(100),
  PRIMARY KEY(ad_num)
);

CREATE TABLE Farm (
 fm_num INT(4) NOT NULL AUTO_INCREMENT,
 fm_mb_num INT(4) NOT NULL,
 fm_ad_num INT(8) NOT NULL,
 fm_name VARCHAR(200) NOT NULL,
 fm_dong VARCHAR(200) NOT NULL,
 fm_size INT(8),
 fm_crop VARCHAR(200),
  PRIMARY KEY(fm_num)
);

CREATE TABLE Crop (
 cp_num INT(4) NOT NULL AUTO_INCREMENT,
 cp_name VARCHAR(200),
 cp_type INT(4),
 cp_title VARCHAR(2000),
 cp_cont VARCHAR(4000),
  PRIMARY KEY(cp_num)
);

CREATE TABLE Diary (
 di_num INT(4) NOT NULL AUTO_INCREMENT,
 di_mb_num INT(4) NOT NULL,
 di_mb_type INT(4) NOT NULL,
 di_fm_num INT(4) NOT NULL,
 di_date DATETIME NOT NULL DEFAULT NOW(),
 di_cont VARCHAR(4000),
 di_note VARCHAR(3000),
 di_pic LONGBLOB,
 di_tem DOUBLE(4,1),
 di_hum DOUBLE(4,1),
  PRIMARY KEY(di_num)
);

CREATE TABLE Chat (
 ch_num INT(4) NOT NULL AUTO_INCREMENT,
 ch_mb_num1 INT(4) NOT NULL,
 ch_mb_num2 INT(4) NOT NULL,
 ch_who INT(4) NOT NULL,
 ch_date DATETIME NOT NULL DEFAULT NOW(),
 ch_cont VARCHAR(4000),
 ch_re_num INT(4),
  PRIMARY KEY(ch_num),
  FOREIGN KEY (ch_re_num) REFERENCES Reserve(re_num)
);

CREATE TABLE Reserve (
 re_num INT(4) NOT NULL AUTO_INCREMENT,
 re_mb_nums INT(4) NOT NULL,
 re_mb_numb INT(4) NOT NULL,
 re_date DATETIME NOT NULL DEFAULT NOW(),
 re_time DATETIME NOT NULL,
 re_name VARCHAR(200) NOT NULL,
 re_kg DOUBLE(4,1) NOT NULL,
 re_price INT(8) NOT NULL,
  PRIMARY KEY(re_num)
);

CREATE TABLE Board (
 bd_num INT(4) NOT NULL AUTO_INCREMENT,
 bd_type INT(4) NOT NULL,
 bd_mb_num INT(4) NOT NULL,
 bd_date DATETIME NOT NULL DEFAULT NOW(),
 bd_title VARCHAR(2000) NOT NULL,
 bd_cont VARCHAR(4000) NOT NULL,
 bd_pic LONGBLOB,
  PRIMARY KEY(bd_num)
);