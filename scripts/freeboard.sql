-- �����Խ��� : ���̺�2�� (���α�����, �������)

create table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null,			-- �ۼ���
	password varchar(10) not null,		-- �ۺ�й�ȣ(�ʿ��Ҷ��� ���)
	subject varchar(40) not null,		-- ������
	content varchar(2000) not null,		-- ����
	readCount int default 0,			-- ��ȸ��
	wdate datetime default current_timestamp,	-- ������ ���糯¥/�ð�
	ip varchar(15) default '127.0.0.1',			-- �ۼ��� ip
	commentCount smallint default 0,			-- ��� ����
	primary key(idx)
);

ALTER TABLE freeboard MODIFY COLUMN wdate timestamp
DEFAULT current_timestamp;

insert into freeboard (name,password,subject,content,ip)
values ('honey','1111','���� ~~','���� �ݰ���','192.168.17.3');
insert into freeboard (name,password,subject,content,ip)
values ('�糪','1111','welcome my home ~~','���� �ݰ��� ���','192.168.22.3');
insert into freeboard (name,password,subject,content,ip)
values ('����','1111','���� ~~','�߰� �Ǻ�','192.168.23.3');
insert into freeboard (name,password,subject,content,ip)
values ('nayoen','1111','���� ~~','���� �ݰ���2','192.168.24.3');
insert into freeboard (name,password,subject,content,ip)
values ('����ȣ','1111','��ο� ~~','��� ����','192.168.25.4');
insert into freeboard (name,password,subject,content,ip)
values ('������','1111','���� ~~','��Ϸ� ������','192.168.26.7');


select * from freeboard;

-- mysql ���� limit Ű���� : limit ��ȣ, ����
-- mysql,oracle select ����� ���� ���࿡ ������� ��ȣ�� �ο��ϴ� �÷�(row num)
-- �� ��������ϴ�.  limit �� ��ȣ�� row num �Դϴ�.(mysql�� 0���� ����)

select * from freeboard f order by idx desc;
select * from freeboard f order by idx desc limit 0,15;	-- ������ ���
select * from freeboard f order by idx desc limit 15,15; -- 2������ ���
select * from freeboard f order by idx desc limit 30,15; -- 3������ ���
select * from freeboard f order by idx desc limit 45,15; -- 4������ ���
select * from freeboard f order by idx desc limit 60,15; -- 5������ ���
select * from freeboard f order by idx desc limit 75,15; -- 6������ ���
select * from freeboard f order by idx desc limit 90,15; -- 7������ ���
select * from freeboard f order by idx desc limit 105,15; -- 8������ ���
select * from freeboard f order by idx desc limit 120,15; -- 9������ ���
-- ���� : n=10������ ����? (n-1)*15
select * from freeboard f order by idx desc limit 135,15; -- 10������ ���
commit;
i
-- �� ���� : subject, content ����. idx �÷��� �������� �մϴ�.

update freeboard set subject = '�³���~', content='���ڰ� ���Ϻ���'
where idx = 154;

-- ��ȸ�� ���� : ���� �� ����(url ��û �߻�) ī��Ʈ +1

update freeboard set readCount = readCount +1 where idx=154;

delete from freeboard where idx=151 and password = '1111';	-- �߸��� ��Ӥ�����ȣ: ������� null
delete from freeboard where idx=151 and password = '1212';	-- �ùٸ� ��й�ȣ : ������� 1��

delete from freeboard where idx=151;


-- ��� ���̺� : board_comment
create table board_comment(
	idx int not null auto_increment,
	mref int not null,	-- ���α�(�θ��)�� idx��
	name varchar(30) not null,			-- �ۼ���
	password varchar(10) not null,		-- �ۺ�й�ȣ(�ʿ��Ҷ��� ���)
	content varchar(2000) not null,		-- ����
	wdate timestamp default current_timestamp,	-- ������ ���糯¥/�ð�
	ip varchar(15) default '127.0.0.1',			-- �ۼ��� ip
	primary key(idx),
	foreign key(mref) references freeboard(idx)
);

insert into board_comment(mref,name,password,content,ip)
values (141,'����','1234','���� �Ϸ絵 ������','192.168.11.11');
insert into board_comment(mref,name,password,content,ip)
values (141,'����','1234','���� �Ϸ絵 ������','192.168.11.11');
insert into board_comment(mref,name,password,content,ip)
values (141,'����','1234','���� �Ϸ絵 ������','192.168.11.11');

insert into board_comment(mref,name,password,content,ip)
values (137,'����','1234','���� �Ϸ絵 ������','192.168.11.11');

-- 1)
insert into board_comment(mref,name,password,content,ip)
values (137,'����','1234','���� �Ϸ絵 ������','192.168.11.11');

select * from freeboard f order by idx desc limit 0,15;
-- ��� ���� (�۸�Ͽ��� �ʿ��մϴ�.)
select count(*) from board_comment bc  where mref=141;	-- 154������ ��� ����
select count(*) from board_comment bc  where mref=137;	-- 137������ ��� ����
select count(*) from board_comment bc  where mref=100;	-- 100������ ��� ����

-- 2) ��� ����Ʈ
select * from board_comment where mref = 141;
select * from board_comment where mref = 137;
select * from board_comment where mref = 100;

-- 3) �۸�� �����ϴ� dao.getList() ���� �տ��� ��۰����� update
update freeboard set commentCount=(
	select count(*) from board_comment bc  where mref=141) where idx=141;
update freeboard set commentCount=(
	select count(*) from board_comment bc  where mref=137) where idx=137;

-- 4) �� �󼼺��⿡�� ��� �Է� �� ������ ��
update freeboard set commentCount=commentCount + 1 where idx=0;

commit;