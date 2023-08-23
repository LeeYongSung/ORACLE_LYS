-- 70. 주어진 “community.dmp” 덤프파일을 ‘joeun2’ 계정에 import 하는 명령어를 작성하시오.
-- joenn 계정 생성
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER joeun IDENTIFIED BY 123456;
ALTER USER joeun DEFAULT TABLESPACE users;
ALTER USER joeun QUOTA UNLIMITED ON users;
GRANT connect, resource TO joeun;

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER joeun2 IDENTIFIED BY 123456;
ALTER USER joeun2 DEFAULT TABLESPACE users;
ALTER USER joeun2 QUOTA UNLIMITED ON users;
GRANT connect, resource TO joeun2;

-- 덤프 파일 import 하기 (CMD 에서 실행)
-- imp userid=관리자계정/비밀번호 file=덤프파일 경로 fromuser=덤프소유계정 touser=임포트할계정
imp userid=system/123456 file=C:\Users\tj-bu\Documents\LeeElijah\SQL\community.dmp fromuser=joeun touser=joeun;


-- 71. 사용 중인 계정(‘joeun’)이 소유하고 있는 데이터를 “community.dmp” 덤프파일로 export 하는 명령어를 작성하시오.
-- exp userid=생성계정/비밀번호 file=덤프파일경로 log=로그파일경로
-- * 생성계정은 import 할 때 fromuser 로 쓰인다.
exp userid=joeun/123456 file=C:\Users\tj-bu\Documents\LeeElijah\SQL\community2.dmp log=C:\Users\tj-bu\Documents\LeeElijah\SQL\community2.log

-- 72. 
-- 테이블 MS_BOARD 에서 WRITER 속성을 아래 <예시>와 같이 데이터 타입을 변경하고, 테이블 MS_USER 의
-- USER_NO 를 참조하는 외래키를 지정하는 SQL 문을 작성하시오.
SELECT * FROM MS_BOARD;
-- 1) MS_BOARD 테이블의 WRITER 속성의 타입을 NUMBER 로 변경하시오.
ALTER TABLE MS_BOARD MODIFY writer NUMBER;
-- 외래키 지정
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명
-- FOREIGN KEY (외래키컬럼) REFERENCES 참조테이블(기본키);;
ALTER TABLE MS_BOARD ADD CONSTRAINT MS_BOARD_WRITER_FK
FOREIGN KEY (WRITER) REFERENCES MS_USER(USER_NO);

-- 2) MS_BOARD 테이블의 WRITER 속성에 대하여 MS_USER 의 USER_NO 를 참조하도록 외래키를 지정하시오.
ALTER TABLE MS_FILE ADD CONSTRAINT MS_FILE_BOARD_NO_FK
FOREIGN KEY (BOARD_NO) REFERENCES MS_BOARD(BOARD_NO);

-- 3) 테이블 MS_REPLY 의 BOARD_NO 속성을 테이블 MS_BOARD 의 BOARD_NO 를 참조하는 외래키로 지정하는
-- SQL문을 작성하시오.
ALTER TABLE MS_REPLY ADD CONSTRAINT MS_REPLY_BOARD_NO_FK
FOREIGN KEY (BOARD_NO) REFERENCES MS_BOARD(BOARD_NO);

-- 제약조건 삭제
ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명;

-- 73. 테이블 MS_USER 에 아래 <예시> 과 같이 속성을 추가하는 SQL문을 작성하시오.
ALTER TABLE MS_USER ADD CTZ_NO CHAR(14) NULL UNIQUE;
ALTER TABLE MS_USER ADD GENDER CHAR(6) NULL;
COMMENT ON COLUMN MS_USER.CTZ_NO IS '주민번호';
COMMENT ON COLUMN MS_USER.GENDER IS '성별';

-- 74. 테이블 MS_USER 의 GENDER 속성이 (‘여‘, ‘남‘, ‘기타‘) 값을 갖도록 하는 제약조건을 추가하는 SQL 문을 작성하시오.
ALTER TABLE MS_USER
ADD CONSTRAINT MS_USER_GENDER_CHECK
CHECK(gender IN ('여', '남', '기타'));

-- 75. 테이블 MS_FILE 에 <예시> 와 같이 확장자 속성을 추가하는 SQL 문을 작성하시오.
ALTER TABLE MS_FILE ADD EXT VARCHAR2(10) NULL;
COMMENT ON COLUMN MS_FILE.EXT IS '확장자';

-- 76. 테이블 MS_FILE 의 FILE_NAME 속성에서 확장자를 추출하여 EXT 속성에 UPDATE 하는 SQL 문을 작성하시오.
-- 테이블 MS_FILE 의 FILE_NO 를 기준으로 매치한다.
-- FILE NAME 에서 추출한 확장자가 jpeg, jpg, gif, png 가 아니면 삭제한다.
-- FILE_NAME 에서 추출한 확장자를 EXT 속성에 UPDATE 한다.
MERGE INTO MS_FILE T        -- 대상 테이블 지정
-- 사용할 데이터의 자원을 지정
USING ( SELECT FILE_NO, FILE_NAME FROM MS_FILE ) F
-- ON (UPDATE 될 조건)
ON (T.FILE_NO = F.FILE_NO)
-- 매치 조건에 만족한 경우
WHEN MATCHED THEN
    -- SUBSTR (문자열, 시작번호)
    UPDATE SET T.EXT = SUBSTR(F.FILE_NAME, INSTR(F.FILE_NAME, '.', -1) +1 )
    DELETE WHERE SUBSTR(F.FILE_NAME, INSTR(F.FILE_NAME, '.', -1) +1 )
            NOT IN('jpeg', 'jpg', 'gif', 'png');
-- WHEN NOT MATCHED THEN
-- [매치가 안 될 때,]

-- 파일 추가
-- 참조 무결성 위배 ( 부모 키가 없는 상태에서 그 부모키를 참조하려고 할 때)
INSERT INTO MS_FILE ( FILE_NO, BOARD_NO, FILE_NAME, FILE_DATA, REG_DATE, UPD_DATE, EXT )
VALUES (1, 1, '강아지.png', '123', sysdate, sysdate, 'jpg');

INSERT INTO MS_FILE ( FILE_NO, BOARD_NO, FILE_NAME, FILE_DATA, REG_DATE, UPD_DATE, EXT )
VALUES (2, 1, 'Main.fxml', '123', sysdate, sysdate, '---');

-- 게시글 추가
INSERT INTO MS_BOARD ( BOARD_NO, TITLE, CONTENT, WRITER, HIT, LIKE_CNT,
                       DEL_YN, DEL_DATE, REG_DATE, UPD_DATE )
VALUES (1, '제목', '내용', 1, 0, 0, 'N', NULL, sysdate, sysdate );

-- 유저 추가
INSERT INTO MS_USER ( USER_NO, USER_ID, USER_PW, USER_NAME, BIRTH, TEL, ADDRESS
                    , REG_DATE, UPD_DATE, GENDER, CTZ_NO)
VALUES ( 1, 'JOEUN', '123456', '김조은', TO_DATE('2020/01/01', 'YYYY/MM/DD'),
        '010-1234-1234', '부평', sysdate, sysdate, '남', '200101-334444');
        
SELECT * FROM MS_USER;
SELECT * FROM MS_BOARD;
SELECT * FROM MS_FILE;

-- 77.
ALTER TABLE MS_FILE
ADD CONSTRAINT MS_FILE_EXT_CHECK
CHECK(EXT IN ('jpg', 'jpeg', 'gif', 'png')); 

INSERT INTO MS_FILE ( FILE_NO, BOARD_NO, FILE_NAME, FILE_DATA, REG_DATE, UPD_DATE, EXT )
VALUES (3, 1, 'Main.java', '123', sysdate, sysdate, 'java');
INSERT INTO MS_FILE ( FILE_NO, BOARD_NO, FILE_NAME, FILE_DATA, REG_DATE, UPD_DATE, EXT )
VALUES (4, 1, '고양이.jpg', '123', sysdate, sysdate, 'jpg');

-- 78. 모든 행 삭제
-- TRUNCATE 도 DELETE 랑 같은 결과
TRUNCATE TABLE MS_USER;
TRUNCATE TABLE MS_BOARD;
TRUNCATE TABLE MS_FILE;
TRUNCATE TABLE MS_REPLY;

DELETE FROM MS_USER;
DELETE FROM MS_BOARD;
DELETE FROM MS_FILE;
DELETE FROM MS_REPLY;
/*
    DELETE vs TRUNCATE
    * DELETE     - 데이터 조작어 (DML)
        - 한 행 단위로 데이터를 삭제한다.
        - COMMIT, ROLLBACK 를 이용하여 변경사항을 적용하거나 되돌릴 수 있음
        
    * TRUNCATE   - 데이터 정의어 (DDL)
        - 모든 행을 삭제한다.
        - 삭제된 데이터를 되돌릴 수 없다.
*/

-- 79. 아래 <예시> 에 주어진 테이블의 속성을 삭제하는 SQL 문을 작성하시오.
/*
1. [MS_BOARD] 테이블의 WRITER 속성을 삭제하시오.
2. [MS_FILE] 테이블의 BOARD_NO 속성을 삭제하시오.
3. [MS_REPLY] 테이블의 BOARD_NO 속성을 삭제하시오
*/
ALTER TABLE MS_BOARD DROP COLUMN WRITER;
ALTER TABLE MS_FILE DROP COLUMN bOARD_NO;
ALTER TABLE MS_REPLY DROP COLUMN BOARD_NO;

-- 80. <예시>에 주어진 속성들을 각 테이블에 추가한 뒤 외래키로 지정하시오. 참조 테이블에 대하여 삭제 시, 연결된 속성의 값도
-- 삭제를 하는 제약조건도 추가하는 SQL 문을 작성하시오.

-- 1. [MS_BOARD] 테이블의 WRITER 속성을 추가하시오.
ALTER TABLE MS_BOARD ADD WRITER NUMBER NOT NULL;
/*
    1 MS_BOARD 의 WRITER 속성을 MS_USER 의 USER_NO 를 참조하는 외래키로 지정하시오.
    2 참조 테이블의 데이터 삭제 시, 연쇄적으로 삭제되도록 옵션을 지정하시오.
*/
ALTER TABLE MS_BOARD ADD CONSTRAINT MS_BOARD_WRITER_FK
FOREIGN KEY (WRITER) REFERENCES MS_USER(USER_NO)
ON DELETE CASCADE;
-- ON DELETE [NO ACTION, RESTRICT, CASCADE, SET NULL]
-- * RESTRICT   : 자식 테이블의 데이터가 존재하면, 삭제 안 함
-- * CASCADE    : 자식 테이블의 데이터도 함께 삭제
-- * SET NULL   : 자식 테이블의 데이터를 NULL로 변경

-- 2. [MS_FILE] 테이블의 BOARD_NO 속성을 추가하시오.
ALTER TABLE MS_FILE ADD BOARD_NO NUMBER NOT NULL;
/*
    1 MS_FILE 의 BOARD_NO 속성을 MS_BOARD 의 BOARD_NO 를 참조하는 외래키로 지정하시오.
    2 참조 테이블의 데이터 삭제 시, 연쇄적으로 삭제되도록 옵션을 지정하시오.
*/
ALTER TABLE MS_FILE ADD CONSTRAINT MS_FILE_BOARD_NO_FK
FOREIGN KEY (BOARD_NO) REFERENCES MS_BOARD(BOARD_NO)
ON DELETE CASCADE;

-- 3. [MS_REPLY] 테이블의 BOARD_NO 속성을 추가하시오.
ALTER TABLE MS_REPLY ADD BOARD_NO NUMBER NOT NULL;
/*
    1 MS_REPLY 의 BOARD_NO 속성을 MS_BOARD 의 BOARD_NO 를 참조하는 외래키로 지정하시오.
    2 참조 테이블의 데이터 삭제 시, 연쇄적으로 삭제되도록 옵션을 지정하시오.
*/
ALTER TABLE MS_REPLY ADD CONSTRAINT MS_REPLY_BOARD_NO_FK
FOREIGN KEY (BOARD_NO) REFERENCES MS_BOARD(BOARD_NO)
ON DELETE CASCADE;

-- 회원탈퇴 (회원번호 : 1)
DELETE FROM MS_USER WHERE USER_NO = 1;

SELECT * FROM MS_BOARD;
SELECT * FROM MS_USER;
-- ON DELETE CASCADE 옵션으로 외래키 지정 시,
-- MS_USER 데이터를 삭제하면,
-- MS_BOARD 의 참조된 데이터도 연쇄적으로 삭제된다.

-- MS_USER 데이터를 삭제되면,
-- MS)FILE, MS)REPLY에 참조된 데이터도 연쇄적으로 삭제된다.

-- 외래키 제약조건 정리

--ALTER TABLE 테이블명
--ADD CONSTRAINT 제약조건명 FOREIGN KEY (외래키 속성)
--REFERENCES 참조테이블(참조 속성);

-- 옵션
-- ON UPDATE            -- 참조 테이블 수정 시,
-- * CASCADE            : 자식 데이터 수정
-- * SET NULL           : 자식 데이터는 NULL
-- * SET DEFAULT        : 자식 데이터는 기본값
-- * RESTRUCT           : 자식 테이블의 참조하는 데이터가 존재하면, 부모 데이터 수정 불가
-- * NO ACTION          : 아무런 행위도 취하지 않는다.(기본값)

-- ON DELETE
-- * CASCADE            : 자식 데이터 삭제
-- * SET NULL           : 자식 데이터는 NULL
-- * SET DEFAULT        : 자식 데이터는 기본값
-- * RESTRUCT           : 자식 테이블의 참조하는 데이터가 존재하면, 부모 데이터 수정 불가
-- * NO ACTION          : 아무런 행위도 취하지 않는다.(기본값)


/*
    ▶ 서브 쿼리 (Sub Query : 하위 질의)
    : SQL 문 내부에 사용하는 SELECT 문
    * 메인쿼리 : 서브쿼리를 사용하는 최종적인 SELECT 문
    
    * 서브쿼리 종류
    - 스칼라 서브쿼리  : SELECT 절에서 사용하는 서브쿼리
    - 인라인 뷰       : FROM 절에서 사용하는 서브쿼리
    - 서브 쿼리       : WHERE 절에서 사용하는 서브쿼리
*/
-- 81. 스칼라 서브쿼리로 출력결과를 조회하는 SQL 문을 작성하시오.
DROP USER joeun CASCADE;
GRANT DBA TO joeun;
imp userid=system/123456 file=C:\Users\tj-bu\Documents\LeeElijah\SQL\joeun.dmp fromuser=joeun touser=joeun;

SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM job;

-- 스칼라 서브쿼리
SELECT emp_id 사원번호
     , emp_name 직원명
     , (SELECT dept_title FROM department d WHERE d.dept_id = e.dept_code) 부서명
     , (SELECT job_name FROM job j WHERE j.job_code = e.job_code) 직급명
FROM employee e;

-- 82. 

SELECT dept_code 부서명
     , MAX(salary) 최고급여
     , MIN(salary) 최저급여
     , ROUND(AVG(salary), 2) 평균급여
FROM employee
GROUP BY dept_code;

SELECT emp_id 사원번호
     , emp_name 직원명
     , dept_title 부서명
     , salary 급여
     , 최고급여
     , 최저급여
     , 평균급여
FROM employee e, department d,
    (
    SELECT dept_code 부서명
         , MAX(salary) 최고급여
         , MIN(salary) 최저급여
         , ROUND(AVG(salary), 2) 평균급여
    FROM employee
    GROUP BY dept_code
    ) t
WHERE e.dept_code = d.dept_id
  AND e.salary = t.최고급여
;