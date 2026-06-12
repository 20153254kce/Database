INSERT INTO Student (stdNo, stdName, stdHp, stdYear, stdAddress) VALUES
('20201011', '김유신', '010-1234-1001', 3, '경남 김해시'),
('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시'),
('20210213', '장보고', '010-1234-1003', 2, '전남 완도군'),
('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구'),
('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');

INSERT INTO Register (regStdNo, regLecNo, regMidScore, regFinalScore, regTotalScore, regGrade) VALUES
('20220415', 101, 60, 30, NULL, NULL),
('20210324', 103, 54, 36, NULL, NULL),
('20201011', 105, 52, 28, NULL, NULL),
('20220415', 102, 38, 40, NULL, NULL),
('20210324', 104, 56, 32, NULL, NULL),
('20210213', 103, 48, 40, NULL, NULL);

INSERT INTO Lecture (lecNo, lecName, lecCredit, lecTime, lecClass) VALUES
(101, '컴퓨터과학 개론', 2, 40, '본301'),
(102, '프로그래밍 언어', 3, 52, '본302'),
(103, '데이터베이스', 3, 56, '본303'),
(104, '자료구조', 3, 60, '본304'),
(105, '운영체제', 3, 52, '본305');


SELECT stdNo, stdName, stdHp, stdYear
FROM Student
WHERE stdNo NOT IN (SELECT regStdNo FROM Register);

SELECT 
    regStdNo, 
    regLecNo,
    (regMidScore + regFinalScore) AS totalScore,
    regGrade
FROM Register;

SELECT 
    s.stdNo, 
    s.stdName, 
    s.stdYear, 
    l.lecName, 
    r.regMidScore, 
    r.regFinalScore,
    (r.regMidScore + r.regFinalScore) AS totalScore,
    r.regGrade
FROM Student s
JOIN Register r ON s.stdNo = r.regStdNo
JOIN Lecture l ON r.regLecNo = l.lecNo
WHERE s.stdYear = 2;