CREATE TABLE Member (
 mb_num INT(4) NOT NULL AUTO_INCREMENT,
 mb_type INT(4) NOT NULL,
 mb_id VARCHAR(200) NOT NULL,
 mb_pw VARCHAR(200) NOT NULL,
 mb_nick VARCHAR(200) NOT NULL,
 mb_chatlist VARCHAR(3000),
 mb_pic VARCHAR(3000),
 mb_file VARCHAR(3000),
 mb_date DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY(mb_num),
  UNIQUE KEY(mb_id),
  UNIQUE KEY(mb_nick)
);



ALTER TABLE Analysis ADD an_date DATETIME not null DEFAULT NOW();
ALTER TABLE farmdiary ADD  fd_file VARCHAR(3000) AFTER fd_picture;
alter table Member drop column mb_fm_name;

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

INSERT INTO Crop (cp_num, cp_item, cp_kind, cp_type, cp_title, cp_cont) VALUE('0', '딸기',  '금실', '1', '딸기잿빛곰팡이병_초기', 
'발생환경|
병원균은 병든 부위에서 균핵 혹은 분생포자의 형태로 월동하여 전염원이 된다.
시설재배시 기온이 20℃내외이고 습도가 높을 때 많이 발생하며, 노지재배시는 여름철 장마기때 주로 발생한다.
과실의 감염은 주로 꽃이 달린 부위에서부터 시작되므로 과실이 커지면서 꽃이 쉽사리 떨어지지 않는 품종에서 발생이 심하다.
|증상설명|
주로 과실에 발생하나 잎, 꽃잎, 잎자루, 과병 등에도 발생한다.
과실에는 작은 수침상의 담갈색 병반으로 나타타고 점차 진전되면 과실이 부패한다.
부패된 과실에는 잿빛의 분생포자로 뒤덮힌다.
잎에는 꽃잎이 떨어져 묻어 있는 부분에서부터 감염이 시작된다.
과병과 잎자루에는 암갈색 병반이 형성되고, 진전되면 줄기가 말라죽으며, 잿빛의 곰팡이가 밀생한다.
|방제방법|
- 병든식물체는 비닐봉지 등에 모아 매몰하거나 소각하고, 수확후에 포장관리를 철저히 한다.
- 시설내의 온도와 습도관리를 잘 조절해 준다.
- 꽃잎이나 병든 잔사물이 과실이나 잎에 붙지 않도록 한다.
- 식물체가 웃자라지 않도록 투광에 유의한다.
- 병원균은 포자형성량이 매우 높아 한번 번지면 방제하기 어려우므로, 발생초기의 집중방제가 중요하다.
- 약제살포는 수화제나 유제보다 분제, 훈연제, 연무제 등이 습도를 높여 주지 않는 점에서 유리 하다.
- 본 병원균은 약제내성이 잘 생기므로 계통이 다른 등록약제를 교호살포하는 것이 좋다.');
INSERT INTO Crop (cp_num, cp_item, cp_kind, cp_type, cp_title, cp_cont) VALUE('3', '딸기',  '금실', '1', '딸기흰가루병_초기', 
'발생환경|
병원균은 병든 식물체의 잔재(殘滓)에 붙어 있는 균사나 분생포자의 형태로 월동하여 1차 전염원이 되는 것으로 생각된다.
주로 봄과 가을의 시설재배에서 많이 발생하며, 여름에는 발생하지 않는다.
|증상설명|
잎, 과실, 과병에 발생한다.
잎에서는 잎 뒷면에 흰색의 균총으로 나타나고, 과실에는 흰가루를 뿌려 놓은 것 같은 증상으로 나타난다.
어린 과실은 비대가 억제되고 경화되며, 착과기의 과실에 발생하면 상품가치가 떨어진다.
|방제방법|
- 발병이 심한지역은 저항성품종을 재배한다(수동, 보교조생, 히미꼬 등). - 합리적 시비로 왕성한 생육을 유도한다.
- 병든 잔사물은 일찍 제거하여 전염원을 없애고, 수확후의 포장관리에 유의한다.
- 발생초기에 예방적 약제살포로 2차 전염원의 밀도를 줄여준다.
- 다양한 약제가 등록되어 있다.');
INSERT INTO Crop (cp_num, cp_item, cp_kind, cp_type, cp_title, cp_cont) VALUE('0', '토마토',  '기타', '1', '토마토잎곰팡이병_초기', 
'발생환경|
병원균은 병든 잎이나 종자 등에서 겨울을 지내고 1차 전염원이 되나, 시설재배에서는 병원균이 각종 농자재에 붙어 겨울을 지내기도 한다.
2차 전염은 병반상에 형성된 포자가 전반되어 잎의 기공을 통하여 침입하여 발병된다.
20～25℃ 의 온도조건하에서 피해가 크며, 특히 시설재배지에서 심하게 발생한다.
|증상설명|
잎에 발생한다.
처음에는 잎의 표면에 흰색 또는 담회색의 반점으로 나타나고 진전되면 황갈색 병반으로 확대된다.
잎 뒷면에 담갈색의 병반이 형성되는데, 병반상에는 갈색의 곰팡이가 융단처럼 밀생되어 있는 것을 볼 수 있으며, 오래되면 균총이 갈색에서 연한 자색으로 변한다.
주로 아래 잎에서 피해가 크며, 심하면 아랫잎 전체가 누렇게되고 말라 죽는다.
|방제방법|
- 병든 잎을 신속히 제거한다.
- 90%이상의 상대습도가 유지되지 않도록 한다.
- 통풍이 잘되게 하고 밀식하지 않는다.
- 건전한 종자를 사용하고, 깨끗한 자재를 사용한다.
- 질소질 비료의 과용을 피한다.');
INSERT INTO Crop (cp_num, cp_item, cp_kind, cp_type, cp_title, cp_cont) VALUE('3', '토마토',  '기타', '1', '토마토황화잎말이바이러스병_초기', 
'발생환경|
토마토황화잎말림바이러스를 옮기는 담배가루이가 이 바이러스에 감염된 토마토 및 잡초의 즙액을 빨아 먹는 과정에서 이 바이러스를 충체내에 보독하여 건전 기주식물에 바이러스를 전염시킨다.
하지만 토마토황화잎말림바이러스는 즙액, 종자 및 접촉에 의해서 전염되지 않는다.
|증상설명|
주로 토마토 및 고추를 비롯한 가지과 작물 등에서 발생되는 병이다
어린 토마토 식물체가 감염되면 심한 위축과 함께 잎이 작고 뒤틀리게 된다.
크게 자란 토마토에 이 바이러스에 감염된 후에는 정상적으로 자라지 못하고 잎이 노랗게 변색이 되며 안으로 굽어지는 잎말림 증상을 보인다.
토마토 줄기에서는 절간 신장이 짧게 되어 식물체는 위축된다.
꽃이 피지 않거나 꽃이 피어도 과실의 맺지 못하고 토마토 과실이 일부 맺더라도 상품 생산이 불가능하다.
과병과 잎자루에는 암갈색 병반이 형성되고, 진전되면 줄기가 말라죽으며, 잿빛의 곰팡이가 밀생한다.
|방제방법|
- 이 바이러스병에  저항성인 토마토 품종의 선택을 우선 고려하여야 한다
- 육묘할 때 60메쉬 이하의 방충망을 이용하여 이 해충의 접근을 원천적으로 차단한다.
- 해충이 방충망으로 유입 의심시 이 해충에 대한 적용 약제를 살포하여 방제를 철저히 한다.
- 육묘업체를 통해서 묘를 공급 받을 경우, 해당 공급업체가 담배가루이의 유입 차단은 물론 철저하게 방제를 하였는지 확인한다.
- 묘를 받을 때 어린잎에 담배가루이알, 약충 및 성충이 있는지를 확인한다.
- 수시로 토마토황화잎말림병 증상이 나타나는지 확인해야 하며 감염된 식물체가 발견되면 즉시 철저히 제거한다.
- 토마토 재배 시설 주변에 서식하는 토마토황화잎말림병의 중간 다리 역할을 하는 쑥 등 잡초들을 제거해야 한다.
- 담배가루이 적용 약제는 디노테퓨란 입상수용제, 스피네토람 입상수화제, 피라다벤 수화제, 에마멕틴벤조에이트 유제, 아세타미프리드 수화제, 티아메톡삼 입상수화제, 티아클로프리드 액상수화제, 뷰베리아바시아나지에이치에이 유상현탁제 등이 있다.');

DELETE FROM Crop WHERE cp_type=1;

drop table Crop;

CREATE TABLE Crop (
 cp_info_num INT(4) NOT NULL AUTO_INCREMENT,
 cp_num INT(4),
 cp_item VARCHAR(200),
 cp_kind VARCHAR(200),
 cp_type INT(4),
 cp_title VARCHAR(2000),
 cp_cont TEXT,
 PRIMARY KEY(cp_info_num)
);

select * from Crop;

ALTER TABLE Crop ADD cp_kind VARCHAR(100) not null AFTER cp_item;

alter table farmdiary MODIFY fd_address VARCHAR(3000);

INSERT INTO Crop (di_mb_num, di_fm_num, di_cont, di_note) VALUE('1', '2',  '테스트1/테스트2/테스트3/테스트4', '오늘 특이사항4');
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
 bd_cnt INT(4),
 bd_re_num INT(4),
 bd_group INT(4),
 bd_seq INT(4),
 bd_level INT(4),
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
	fdm4_edu_file varchar(3000),
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
	fdm7_date datetime,
	fdm7_analysislist TEXT,
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
	fd_picture varchar(3000),
	fd_open int(1),
	PRIMARY KEY(fd_num),
	FOREIGN KEY (fd_mb_num) REFERENCES Member (mb_num)
);

alter table Analysis drop column an_file_pest;
alter table Analysis drop column an_pic_grow;
alter table farmdiary drop column fd_picture2;
alter table farmdiary drop column fd_picture3;

ALTER TABLE farmdiary_manage ADD fdm2_cp_num int(4) after fdm1_soil_check;
ALTER TABLE farmdiary ADD fd_picture VARCHAR(3000) after fd_humid;
ALTER TABLE farmdiary_manage ADD fdm7_analysislist TEXT;
ALTER TABLE farmdiary_manage ADD fdm7_grow_pic VARCHAR(3000);
ALTER TABLE farmdiary_manage ADD fdm7_an_num int(4);

alter table Comment add FOREIGN KEY (co_bd_num) REFERENCES Board (bd_num);
alter table farmdiary_manage add FOREIGN KEY (fdm2_cp_num) REFERENCES Crop (cp_num);

alter table farmdiary_manage drop foreign key fdm1_ad_num;
alter table farmdiary_manage drop foreign key fdm2_cp_num;
alter table farmdiary_manage drop foreign key fdm_mb_num;

ALTER TABLE farmdiary_manage DROP fdm7_date;
ALTER TABLE farmdiary_manage DROP fdm7_analysislist;
ALTER TABLE farmdiary_manage DROP fdm7_grow_pic;
ALTER TABLE farmdiary_manage DROP fdm7_grow_result;

CREATE TABLE Analysis (
 an_num INT(4) NOT NULL AUTO_INCREMENT,
 an_pic_grow VARCHAR(3000),
 an_pic_pest VARCHAR(3000),
 an_result_pest TEXT,
 an_result_grow TEXT,
  PRIMARY KEY(an_num)
);

CREATE TABLE Step (
 step_num INT(4) NOT NULL AUTO_INCREMENT,
 step_name VARCHAR(100),
  PRIMARY KEY(step_num)
);