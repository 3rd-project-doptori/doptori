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

ALTER TABLE Reserve ADD  re_cp_num int(4) not null AFTER re_place;
alter table Reserve drop column re_cp_name;

CREATE TABLE Address (
 ad_num INT(8) NOT NULL AUTO_INCREMENT,
 ad_sido VARCHAR(100),
 ad_gugun VARCHAR(100),
 ad_dong VARCHAR(100),
 ad_ri VARCHAR(100),
  PRIMARY KEY(ad_num)
);

select * from Member;
INSERT INTO Member (mb_type, mb_id, mb_pw, mb_nick) VALUE('1', 'test3',  '1234', 'test3');

INSERT INTO Farm (fm_mb_num, fm_ad_num, fm_detail, fm_name, fm_dong, fm_area, fm_cp_num) VALUE('1', '2', '세부 주소', '농장이름', '동이름', '1.5', '2');
INSERT INTO Crop (cp_name, cp_type, cp_title, cp_cont) VALUE('토마토', '1',  '병해충', '내용설명');
INSERT INTO Diary (di_mb_num, di_fm_num, di_date, di_note) VALUE('1', '1', '2023-02-20', '물주기');


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

select * from Crop;

ALTER TABLE Crop ADD cp_kind VARCHAR(100) not null AFTER cp_item;

alter table Crop drop column cp_name;

INSERT INTO Diary (di_mb_num, di_fm_num, di_cont, di_note) VALUE('1', '2',  '테스트1/테스트2/테스트3/테스트4', '오늘 특이사항4');
select * from Diary;


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
 re_bd_num INT(4) NOT NULL,
  PRIMARY KEY(re_num),
  FOREIGN KEY (re_bd_num) REFERENCES Board (bd_num)
);

alter table Reserve add re_bd_num int(4) not null;
alter table Reserve add re_bd_num int(4) not null;
alter table Reserve add re_bd_num int(4) not null;
alter table Reserve add re_bd_num int(4) not null;

alter table Board add bd_re_num int(4);
alter table Reserve add FOREIGN KEY (re_bd_num) REFERENCES Board (bd_num);

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
	
create table schedule(
	mb_num int(4),
	schedule_idx int(4) NOT NULL AUTO_INCREMENT,
	schedule_num int(4),
	schedule_subject TEXT,
	schedule_desc TEXT,
	schedule_date datetime,
	schedule_share varchar(50),
	schedule_mycolor varchar(50),
	PRIMARY KEY(schedule_idx),
	FOREIGN KEY (mb_num) REFERENCES Member (mb_num)
);

drop table calendar;

INSERT INTO calendar values('1','1','할일title','test',
'내용-content','2021/05/01',
'2021/05/03','1','yellow','navy','navy');

select * from calendar;

create table farmdiary_manage(
	fdm_num int(4) NOT NULL AUTO_INCREMENT,
	fdm_type int(2) NOT NULL,
	fdm_mb_num int(4) NOT NULL,
	fdm1_ad_num int(8),
	fdm1_detail_address varchar(1000),
	fdm1_lot_area DECIMAL(10,1),
	fdm1_actual_area DECIMAL(10,1),
	fdm1_idle_area DECIMAL(10,1),
	fdm1_soil_check int(1),
	fdm2_item varchar(100),
	fdm2_kind varchar(100),
	fdm2_culture_area DECIMAL(10,1),
	fdm2_contract int(8),
	fdm2_target datetime,
	fdm3_fertilizer varchar(100),
	fdm3_fertilizer_kind varchar(100),
	fdm3_pesticide varchar(100),
	fdm3_pesticide_kind varchar(100),
	fdm4_edu_start datetime,
	fdm4_edu_end datetime,
	fdm4_edu_name varchar(100),
	fdm4_edu_place varchar(1000),
	fdm4_edu_cont TEXT,
	fdm4_edu_pic varchar(3000),
	fdm5_man_name varchar(100),
	fdm5_man_phone varchar(100),
	fdm5_man_ability int(2),
	fdm5_man_cost int(10),
	fdm5_man_memo varchar(1000),
	fdm6_account varchar(100),
	fdm6_represent varchar(100),
	fdm6_regi_num varchar(100),
	fdm6_phone varchar(100),
	fdm6_address varchar(1000),
	fdm6_sectors varchar(100),
	fdm6_business varchar(100),
	PRIMARY KEY(fdm_num),
	FOREIGN KEY (fdm_mb_num) REFERENCES Member (mb_num)
);

create table farmdiary(
	fd_num int(4) NOT NULL AUTO_INCREMENT,
	fd_mb_num int(4) NOT NULL,
	fd_start datetime NOT NULL,
	fd_end datetime NOT NULL,
	fd_address varchar(1000) NOT NULL,
	fd_item varchar(100) NOT NULL,
	fd_kind varchar(100) NOT NULL,
	fd_step varchar(100) NOT NULL,
	fd_cont TEXT NOT NULL,
	fd_pesticide varchar(100),
	fd_pesticide_amount DECIMAL(10,1),
	fd_fertilizer varchar(100),
	fd_fertilizer_amount DECIMAL(10,1),
	fd_man_name varchar(100),
	fd_worktime DECIMAL(4,1),
	fd_weather varchar(100),
	fd_low_temp DECIMAL(4,1),
	fd_high_temp DECIMAL(4,1),
	fd_precipitation DECIMAL(4,1),
	fd_humid DECIMAL(4,1),
	fd_picture1 varchar(3000),
	fd_picture2 varchar(3000),
	fd_picture3 varchar(3000),
	fd_open int(1),
	PRIMARY KEY(fd_num),
	FOREIGN KEY (fd_mb_num) REFERENCES Member (mb_num)
);

ALTER TABLE farmdiary_manage ADD fdm2_cp_num int(4) after fdm1_soil_check;
ALTER TABLE farmdiary_manage ADD fdm7_pest_pic VARCHAR(3000);
ALTER TABLE farmdiary_manage ADD fdm7_pest_result TEXT;
ALTER TABLE farmdiary_manage ADD fdm7_grow_pic VARCHAR(3000);
ALTER TABLE farmdiary_manage ADD fdm7_grow_result TEXT;

alter table Comment add FOREIGN KEY (co_bd_num) REFERENCES Board (bd_num);
alter table farmdiary_manage add FOREIGN KEY (fdm2_cp_num) REFERENCES Crop (cp_num);

alter table farmdiary_manage drop foreign key fdm1_ad_num;
alter table farmdiary_manage drop foreign key fdm2_cp_num;
alter table farmdiary_manage drop foreign key fdm_mb_num;

CREATE TABLE Analysis (
 an_num INT(4) NOT NULL AUTO_INCREMENT,
 an_pic VARCHAR(3000),
 an_result_pest TEXT,
 an_result_grow TEXT,
  PRIMARY KEY(an_num)
);