create TABLE Board (
    id VARCHAR(20) PRIMARY key,
    title VARCHAR(100) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    inserted DATE DEFAULT SYSDATE
);
DESC Board;
CREATE SEQUENCE auto START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;
ALTER TABLE Board ADD writer VARCHAR(20) DEFAULT'-' NOT NULL;
ALTER TABLE Board ADD writerPassword VARCHAR(50) NULL;

--见辫贸府
ALTER TABLE Board MODIFY title INVISIBLE;
ALTER TABLE Board MODIFY content INVISIBLE;
ALTER TABLE Board MODIFY inserted INVISIBLE;

ALTER TABLE Board MODIFY title VISIBLE;
ALTER TABLE Board MODIFY content VISIBLE;
ALTER TABLE Board MODIFY inserted VISIBLE;


DROP TABLE Member;
CREATE TABLE Member(
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    password VARCHAR(50) NULL
);

ALTER TABLE Board DROP COLUMN memberName;

desc Member;
ALTER TABLE Board 
ADD CONSTRAINT memberWriter FOREIGN KEY(name) REFERENCES Member(name);

CREATE SEQUENCE mAuto START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;

commit;

select * from Member;
select * from Board;
INSERT INTO Member VALUES (mAuto.nextval, 'js', '11');
DELETE FROM Member;

--寇贰虐 昏力
ALTER TABLE Board DROP CONSTRAINT memberName;




DROP TABLE Member;
CREATE TABLE Member(
    name VARCHAR(30) PRIMARY KEY,
    password VARCHAR(100) NOT NULL
);

DESC Member;

DROP TABLE Board;
CREATE TABLE Board(
   id INT PRIMARY KEY,
   boardName VARCHAR(30) REFERENCES Member(name),
   password VARCHAR(1000) NULL,
   title VARCHAR(100) NOT NULL,
   content VARCHAR(2000) NULL,
   inserted DATE DEFAULT SYSDATE
);
CREATE SEQUENCE auto START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;
desc Board;



select * from (select rownum rm, b.* from
(select * from board order by id desc) b)
where rm between #{start} and #{end};

