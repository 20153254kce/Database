# MySQL 접속(콘솔환경)
#> mysql -u root -p
# -u : user,사용자 계정
# -p : password, 비밀번호

#데이터베이스 생성, 제거
CREATE DATABASE mydb;
DROP DATABASE mydb;

#데이터베이스 목록 조회
SHOW DATABASES;

#작업 데이터베이스 선택
USE mydb;

select * from user1;

#일반 관리자 생성, 권한부여, 반영
create USER 'cekang2'@'%' identified by '1234';
grant all privileges on mydb.* to 'cekang2'@'%'; # cekang2에게 모든권한 부여
flush privileges; # 계정권한 반영

#계정 삭제
drop user 'cekang2'@'%';

#비밀번호 수정
alter user 'cekang'@'%' identified by 'abcd';