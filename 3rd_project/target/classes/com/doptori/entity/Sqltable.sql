CREATE TABLE Member (
 mb_num INT(4) NOT NULL AUTO_INCREMENT,
 mb_type INT(4) NOT NULL,
 mb_id VARCHAR(200) NOT NULL,
 mb_pw VARCHAR(200) NOT NULL,
 mb_nick VARCHAR(200) NOT NULL,
 mb_fm_num VARCHAR(3000),
 mb_chatlist VARCHAR(3000),
 mb_pic VARCHAR(3000),
 mb_file VARCHAR(3000),
 mb_date DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY(mb_num),
  UNIQUE KEY(mb_id),
  UNIQUE KEY(mb_nick)
);

ALTER TABLE Member ADD  mb_re_num VARCHAR(3000) AFTER mb_file;

CREATE TABLE Address (
 ad_num INT(8) NOT NULL AUTO_INCREMENT,
 ad_sido VARCHAR(100),
 ad_gugun VARCHAR(100),
 ad_dong VARCHAR(100),
 ad_ri VARCHAR(100),
  PRIMARY KEY(ad_num)
);

select * from Farm;
INSERT INTO Member (mb_type, mb_id, mb_pw, mb_nick) VALUE('1', 'test1',  '1234', 'test1');
INSERT INTO Farm (fm_mb_num, fm_ad_num, fm_detail, fm_name, fm_dong, fm_area, fm_cp_num) VALUE('1', '1', '세부 주소', '농장이름', '동이름', '1.5', '1');
INSERT INTO Crop (cp_name, cp_type, cp_title, cp_cont) VALUE('딸기', '1',  '병해충', '내용설명');

CREATE TABLE Farm (
 fm_num INT(4) NOT NULL AUTO_INCREMENT,
 fm_mb_num INT(4) NOT NULL,
 fm_ad_num INT(8) NOT NULL,
 fm_detail VARCHAR(2000) NOT NULL,
 fm_name VARCHAR(200) NOT NULL,
 fm_dong VARCHAR(200) NOT NULL,
 fm_area DECIMAL(18,1),
 fm_cp_num INT(4),
  PRIMARY KEY(fm_num),
  FOREIGN KEY (fm_mb_num) REFERENCES Member (mb_num),
  FOREIGN KEY (fm_ad_num) REFERENCES Address (ad_num),
  FOREIGN KEY (fm_cp_num) REFERENCES Crop (cp_num)
);

CREATE TABLE Crop (
 cp_num INT(4) NOT NULL AUTO_INCREMENT,
 cp_name VARCHAR(200),
 cp_type INT(4),
 cp_title VARCHAR(2000),
 cp_cont TEXT,
  PRIMARY KEY(cp_num)
);

CREATE TABLE Diary (
 di_num INT(4) NOT NULL AUTO_INCREMENT,
 di_mb_num INT(4) NOT NULL,
 di_fm_num INT(4) NOT NULL,
 di_date DATETIME NOT NULL DEFAULT NOW(),
 di_cont TEXT,
 di_note TEXT,
 di_pic VARCHAR(3000),
 di_tem DECIMAL(4,1),
 di_hum DECIMAL(4,1),
  PRIMARY KEY(di_num),
  FOREIGN KEY (di_mb_num) REFERENCES Member (mb_num),
  FOREIGN KEY (di_fm_num) REFERENCES Farm (fm_num)
);

CREATE TABLE Chatroom (
 cr_num INT(4) NOT NULL AUTO_INCREMENT,
 cr_name VARCHAR(2000) NOT NULL,
 cr_date DATETIME NOT NULL DEFAULT NOW(),
 cr_mb_num INT(4) NOT NULL,
 cr_limit INT(4) NOT NULL,
  PRIMARY KEY(cr_num),
  FOREIGN KEY (cr_mb_num) REFERENCES Member (mb_num)
);

CREATE TABLE Chat (
 ch_num INT(4) NOT NULL AUTO_INCREMENT,
 ch_cr_num INT(4) NOT NULL,
 ch_mb_num INT(4) NOT NULL,
 ch_cont TEXT,
 ch_date DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY(ch_num),
  FOREIGN KEY (ch_cr_num) REFERENCES Chatroom (cr_num)
);

CREATE TABLE Reserve (
 re_num INT(4) NOT NULL AUTO_INCREMENT,
 re_mb_nums INT(4) NOT NULL,
 re_mb_numb INT(4) NOT NULL,
 re_date DATETIME NOT NULL DEFAULT NOW(),
 re_selldate DATETIME NOT NULL,
 re_place TEXT NOT NULL,
 re_cp_name varchar(200) NOT NULL,
 re_weight DECIMAL(4,1) NOT NULL,
 re_price INT(8) NOT NULL,
 re_memo TEXT,
  PRIMARY KEY(re_num)
);

CREATE TABLE Board (
 bd_num INT(4) NOT NULL AUTO_INCREMENT,
 bd_type INT(4) NOT NULL,
 bd_mb_num INT(4) NOT NULL,
 bd_date DATETIME NOT NULL DEFAULT NOW(),
 bd_title VARCHAR(2000) NOT NULL,
 bd_cont TEXT NOT NULL,
 bd_pic VARCHAR(3000),
 bd_cnt INT(4) ,
  PRIMARY KEY(bd_num),
  FOREIGN KEY (bd_mb_num) REFERENCES Member (mb_num)
);

CREATE TABLE Comment (
 co_num INT(4) NOT NULL AUTO_INCREMENT,
 co_bd_num INT(4) NOT NULL,
 co_mb_num INT(4) NOT NULL,
 co_cont TEXT,
 co_date DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY(co_num),
  FOREIGN KEY (co_bd_num) REFERENCES Board (bd_num),
  FOREIGN KEY (co_mb_num) REFERENCES Member (mb_num)
);

INSERT INTO member_table (mb_id, mb_pw, address, mb_tell) VALUE('build', 'build1',  '서울특별시 강남구 도곡동', '010-1234-1234');