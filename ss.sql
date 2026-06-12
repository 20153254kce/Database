ALTER TABLE user1 DROP COLUMN birth;
select * from user1;
select * from user2;
select * from user3;
select * from user4;
select * from user5;

insert into user2 value ('a123','땅콩','1999-01-01','부산');
DELETE FROM user1 WHERE userid IS NULL OR userid = '';


select * from user;
select * from article;
select * from user;

DELIMITER $$

DROP PROCEDURE IF EXISTS insertTestData$$

CREATE PROCEDURE insertTestData()
BEGIN
    DECLARE i INT DEFAULT 98;
    
    -- 1부터 97까지 반복하면서 INSERT 실행
    WHILE i <= 200 DO
        INSERT INTO Article (type, title, content, comment, file, hit, writer, regIp, wdate)
        VALUES (
            'free', 
            CONCAT('테스트 게시글 제목 ', i), 
            CONCAT('테스트 게시글 내용입니다. 번호: ', i), 
            0, 
            0, 
            0, 
            'abc1234', 
            '0:0:0:0:0:0:0:1', 
            NOW()
        );
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- 💡 작성한 프로시저를 실제로 실행하여 데이터 97개 넣기
CALL insertTestData();

-- (선택) 다 쓰고 난 프로시저는 깔끔하게 삭제
DROP PROCEDURE insertTestData;


select * from article;