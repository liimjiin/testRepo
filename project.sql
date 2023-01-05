-- Admin (관리자)
CREATE TABLE admin(
    adminId varchar(20) not null,
    adminPw varchar(20) not null,
    adminName varchar(20) not null,
    adminEmail varchar(30) not null
);

INSERT INTO admin VALUES('admin', '1234', '홍길동', 'test@gmail.com');
SELECT * FROM admin;
DROP TABLE admin;

-- Member (회원)
CREATE TABLE member(
	memNo int primary key auto_increment,
	memName varchar(30) not null,
    memEmail varchar(30) not null,
	memPw varchar(20) not null,
    memZipcode varchar(10),
    memRoadAddr varchar(200),
    memJibunAddr varchar(200),
    memDetailAddr varchar(200),
    unique key(memEmail)
);
drop table member;
SELECT * FROM member;

-- Product (제품)
CREATE TABLE product(
    pNo int primary key auto_increment,
    pCategory_fk varchar(20),
    pName varchar(50),
    pCompany varchar(50),
    pImage_1 varchar(50),
    pImage_2 varchar(200),
    pQty int default 0,
    price int default 0,
    pSpec varchar(20),
    pContent varchar(300)
);

drop table product;
SELECT * FROM product;

-- Category (카테고리)
CREATE TABLE category(
	catNo int primary key auto_increment,
    catMajor varchar(20) not null,
    catMinor varchar(30) not null
);

select * from category order by catMajor, catMinor;
drop table category;

-- Indent (주문)
CREATE TABLE indent(
	indentNo int primary key auto_increment,
    indentName_fk varchar(30) not null,
    indentStatus varchar(30) not null
);

drop table indent;

-- Cart (장바구니)
CREATE TABLE cart(
	cartNo int auto_increment primary key,
    memNo int,
    pNo int,
    prodCount int,
    
    foreign key (memNo) references member(memNo),
    foreign key (pNo) references product(pNo)
);

drop table cart;