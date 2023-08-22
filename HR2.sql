-- SELECT 실행 순서
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

-- 21. 12.45, -12.45 보다 크거나 같은 정수 중 제일 작은 수를 계산하는 SQL 문을 각각 작성하시오.
-- CEIL 올림 / FLOOR 내림
-- * dual ?
-- : 산술 연산, 함수 결과 등을 확인해볼 수 있는 임시 테이블
-- CEIL() "천장"
-- : 지정한 값보다 크거나 같은 정수 중 제일 작은 수를 반환하는 함수
SELECT CEIL(12.45) FROM dual;
SELECT CEIL(-12.45) FROM dual;
SELECT CEIL(12.45), CEIL(-12.45) FROM dual;

-- 22. 12.55와 -12.55 보다 작거나 같은 정수 중 가장 큰 수를 계산하는 SQL 문을 각각 작성하시오.
SELECT FLOOR(12.55) FROM dual;
SELECT FLOOR(-12.55) FROM dual;
SELECT FLOOR(12.55), FLOOR(-12.55) FROM dual;

-- 23. 각 소문제에 제시된 수와 자리 수를 이용하여 반올림하는 SQL문을 작성하시오.
-- ROUND (값, 자리수)
-- 지정한 값을, 해당 자리수에서 반올림하는 함수
-- a a a a a . b b b b
-- .....-2-1 . 0 1 2 3
-- 0.54 를 소수점 아래 첫째 자리에서 반올림하시오. → 결과 : 1
SELECT ROUND(0.54, 0) FROM dual;
-- 0.54 를 소수점 아래 둘째 자리에서 반올림하시오. → 결과 : 0.5
SELECT ROUND(0.54, 1) FROM dual;
-- 125.67 을 일의 자리에서 반올림하시오. → 결과 : 130
SELECT ROUND(125.67, -1) FROM dual;
-- 125.67 을 십의 자리에서 반올림하시오. → 결과 : 100
SELECT ROUND(125.67, -2) FROM dual;

-- 24. 각 소문제에 제시된 두 수를 이용하여 나머지를 구하는 SQL문을 작성하시오.
-- MOD(A, B)
-- : A를 B로 나눈 나머지를 구하는 함수
-- 3을 8로 나눈 나머지
SELECT MOD(3, 8) 나머지 FROM dual;
-- 30을 4로 나눈 나머지
SELECT MOD(30, 4) 나머지 FROM dual;

-- 25. 각 소문제에 제시된 두 수를 이용하여 제곱수를 구하는 SQL문을 작성하시오.
-- POWER(A ,B)
-- : A의 B 제곱을 구하는 함수
-- 2의 10제곱을 구하시오.
SELECT POWER(2, 10)"2^10" FROM dual;
-- 2의 31제곱을 구하시오.
SELECT POWER(2, 31)"2^31" FROM dual;

-- 26. 각 소문제에 제시된 수를 이용하여 제곱근을 구하는 SQL문을 작성하시오.
-- SQRT(A)
-- : A의 제곱근을 구하는 함수
-- * A는 양의 정수와 실수만 사용 가능
-- 2의 제곱근을 구하시오
SELECT SQRT(2) FROM dual;
-- 100의 제곱근을 구하시오.
SELECT SQRT(100) FROM dual;

-- 27. 각 소문제에 제시된 수와 자리 수를 이용하여 해당 수를 절삭하는 SQL문을 작성하시오.
-- TRUNC(값, 자리수)
-- 지정한 값을, 해당 자리수에서 절삭하는 함수
-- a a a a a . b b b b
-- .....-2-1 . 0 1 2 3
-- 527425.1234 을 소수점 아래 첫째 자리에서 절삭하시오.
SELECT TRUNC(527425.1234, 0) FROM dual;
-- 527425.1234 을 소수점 아래 둘째 자리에서 절삭하시오.
SELECT TRUNC(527425.1234, 1) FROM dual;
-- 527425.1234 을 일의 자리에서 절삭하시오.
SELECT TRUNC(527425.1234, -1) FROM dual;
-- 527425.1234 을 십의 자리에서 절삭하시오.
SELECT TRUNC(527425.1234, -2) FROM dual;

-- 28. 각 소문제에 제시된 수를 이용하여 절댓값을 구하는 SQL문을 작성하시오.
-- ABS(A)
-- : 값 A의 절댓값을 구하여 반환하는 함수
-- 20 의 절댓값을 구하시오.
SELECT ABS(20) FROM dual;
-- 12.456 의 절댓값을 구하시오.
SELECT ABS(12.456) FROM dual;

-- 29. <예시>와 같이 문자열을 대문자, 소문자, 첫글자만 대문자로 변환하는 SQL문을 작성하시오.
-- 대문자 UPPER() / 소문자 LOWER() / 첫글자만 대문자 INITCAP()
SELECT UPPER('AlOhA WoRlD~!') FROM dual;
SELECT LOWER('AlOhA WoRlD~!') FROM dual;
SELECT INITCAP('AlOhA WoRlD~!') FROM dual;

-- 30. <예시>와 같이 문자열의 글자 수와 바이트 수를 출력하는 SQL문을 작성하시오.
-- LENGTH() - 글자 수 / LENGTHB() - 바이트 수
-- * 영문, 숫자, 빈칸  : 1 byte
-- * 한글             : 3 byte
SELECT LENGTH('ALOHA WORLD') AS "글자 수"
      ,LENGTHB('ALOHA WORLD') AS "바이트 수"
FROM dual;
SELECT LENGTH('알로하 월드') AS "글자 수"
      ,LENGTHB('알로하 월드') AS "바이트 수"
FROM dual;

-- 31. <예시>와 같이 각각 함수와 기호를 이용하여 두 문자열을 병합하여 출력하는 SQL문을 작성하시오.
-- CONCAT()
SELECT CONCAT(CONCAT('ALOHA', 'WORLD'), '123') AS "함수"
     , 'ALOHA' || 'WORLD' || '123' AS "기호"
FROM dual;

-- 32. <예시>와 같이 주어진 문자열의 일부만 출력하는 SQL문을 작성하시오.
-- SUBSTR(문자열, 시작번호, 글자수) / -1로 맨 뒤에부터 카운트 가능
-- www.alohacampus.com
SELECT SUBSTR('www.alohacampus.com', 1, 3) AS "1"
     , SUBSTR('www.alohacampus.com', 5, 11) AS "2"
     , SUBSTR('www.alohacampus.com', -3, 3) AS "3"
FROM dual;
-- 바이트
SELECT SUBSTRB('www.alohacampus.com', 1, 3) AS "1"
     , SUBSTRB('www.alohacampus.com', 5, 11) AS "2"
     , SUBSTRB('www.alohacampus.com', -3, 3) AS "3"
FROM dual;

-- www.알로하캠퍼스.com
SELECT SUBSTR('www.알로하캠퍼스.com', 1, 3) AS "1"
     , SUBSTR('www.알로하캠퍼스.com', 5, 6) AS "2"
     , SUBSTR('www.알로하캠퍼스.com', -3, 3) AS "3"
FROM dual;
-- 바이트
SELECT SUBSTRB('www.알로하캠퍼스.com', 1, 3) AS "1"
     , SUBSTRB('www.알로하캠퍼스.com', 5, 6*3) AS "2"
     , SUBSTRB('www.알로하캠퍼스.com', -3, 3) AS "3"
FROM dual;

-- 33. <예시>와 같이 문자열에서 특정 문자의 위치를 구하는 SQL문을 작성하시오.
-- INSTR(문자열, 찾을문자, 시작번호, 순서)
-- 'ALOHACAMPUS'
SELECT INSTR('ALOHACAMPUS', 'A', 1, 1) AS "1번째 A"
     , INSTR('ALOHACAMPUS', 'A', 1, 2) AS "2번째 A"
     , INSTR('ALOHACAMPUS', 'A', 1, 3) AS "3번째 A"
FROM dual;

-- 34. <예시>와 같이 대상 문자열을 왼쪽/오른쪽에 출력하고 빈공간을 특정 문자로 채우는 SQL문을 작성하시오.
-- LPAD(문자열, 글자수, 빈공간의 값) / RPAD(문자열, 글자수, 빈공간의 값)
-- : 문자열에 지정한 칸(Byte)을 확보하고, 왼쪽(오른쪽)에 특정 문자로 채움
SELECT LPAD('ALOHACAMPUS', 20, '#') AS 왼쪽
     , RPAD('ALOHACAMPUS', 20, '#') AS 오른쪽
FROM dual;

-- 35. 테이블 EMPLOYEES 의 FIRST_NAME과 HIRE_DATE 를 검색하되 <예시>와 같이 날짜 형식을 지정하는 
-- SQL 문을 작성하시오. (HR 계정 샘플 데이터)
-- TO_CHAR( 데이터, '날짜/숫자 형식' )
-- : 특정 데이터를 문자열 형식으로 변환하는 함수
SELECT first_name AS 이름
     , TO_CHAR(hire_date, 'YYYY-MM-DD (dy) HH:MI:SS') AS 입사일자
FROM employees;

-- 36. 테이블 EMPLOYEES 의 FIRST_NAME과 SALARY 를 검색하되 <예시>와 같이 날짜 형식을 지정하는 
-- SQL 문을 작성하시오.
-- 숫자형 -> 문자형
오. (HR 계정 샘플 데이터)
SELECT first_name AS 이름
     , salary AS 급여
     , TO_CHAR( salary, '$999,999,999.00') 급여
FROM employees;

-- 37. <예시> 와 같이 문자형으로 주어진 데이터를 날짜형 데이터로 변환하는 SQL 문을 작성하시오.
-- TO_DATE( 데이터 )
-- : 문자형 데이터를 날짜형 데이터로 변환하는 함수
SELECT 20230822 AS 문자
     , TO_DATE('20230822', 'YYYYMMDD') AS 날짜
     , TO_DATE('2023.08.22', 'YYYY.MM.DD') AS 날짜
     , TO_DATE('2023/08/22', 'YYYY/MM/DD') AS 날짜
     , TO_DATE('2023-08-22', 'YYYY-MM-DD') AS 날짜
FROM dual;

-- 38. <예시> 와 같이 문자형으로 주어진 데이터를 숫자형 데이터로 변환하는 SQL 문을 작성하시오.
-- TO_NUMBER( 데이터, 형식 )
-- : 문자형 데이터를 숫자형 데이터로 변환하는 함수
SELECT '1,200,000' AS 문자
      , TO_NUMBER('1,200,000', '999,999,999') AS 숫자
FROM dual;

-- 39. <예시>와 같이 현재 날짜를 반환하는 SQL 문을 작성하시오.
-- sysdate : 현재 날짜/시간 정보를 가지고 있는 키워드
SELECT sysdate FROM dual;

SELECT sysdate-1 어제
     , sysdate 오늘
     , sysdate+1 내일
FROM dual;

-- 40. <예시> 와 같이 입사일자와 오늘 날짜를 계산하여 근무달수와 근속연수를 구하는 SQL 문을 작성하시오.
-- MONTH_BETWEEN(A, B)
-- : 날짜 A부터 B까지 개월 수 차이를 반환하는 함수
-- (단, A > B 즉, A가 더 최근 날짜로 지정되어야 양수로 반환)
SELECT first_name AS 이름
     , TO_CHAR(hire_date, 'YYYY.MM.DD') AS 입사일자
     , TO_CHAR(sysdate, 'YYYY.MM.DD') AS 오늘
     , TRUNC( sysdate - hire_date ) || '일' AS 근무일수
     , TRUNC( MONTHS_BETWEEN(sysdate ,hire_date))|| '개월' AS 근무달수
     , TRUNC( MONTHS_BETWEEN(sysdate ,hire_date) / 12) || '년' AS 근속연수
FROM employees; -- HIRE_DATE

-- 41. <예시> 와 같이 오늘 날짜와 6개월 후의 날짜를 출력하는 SQL 문을 작성하시오.
-- ADD_MONTH ( 날짜, 개월 수)
-- : 지정한 날짜로부터 해당 개월 수 후의 날짜를 반환하는 함수
SELECT sysdate 오늘
     , ADD_MONTHS(sysdate, 6) "6개월 후"
FROM dual;

SELECT '2023/07/25' 개강
     , ADD_MONTHS('2023/07/25', 6) 종강 -- 몇개월 전으로 가고 싶으면 -
FROM dual;

-- 42. <예시> 와 같이 오늘 날짜와 오늘 이후 돌아오는 토요일의 날짜를 출력하는 SQL 문을 작성하시오.
-- NEXT_DAY(날짜, 요일)
-- 일 월 화  수 목  금 토
-- 1  2  3  4  5  6  7 
SELECT sysdate AS 오늘
     , NEXT_DAY(sysdate, 7) AS "다음 토요일"
FROM dual;

SELECT NEXT_DAY(sysdate, 1) AS "다음 일요일"
     , NEXT_DAY(sysdate, 2) AS "다음 월요일"
     , NEXT_DAY(sysdate, 3) AS "다음 화요일"
     , NEXT_DAY(sysdate, 4) AS "다음 수요일"
     , NEXT_DAY(sysdate, 5) AS "다음 목요일"
     , NEXT_DAY(sysdate, 6) AS "다음 금요일"
     , NEXT_DAY(sysdate, 7) AS "다음 토요일"
FROM dual;

-- 43. <예시> 와 같이 오늘 날짜와 월초, 월말 일자를 구하는 SQL 문을 작성하시오.
-- LAST_DAY(날짜) - 지정한 날짜와 동일한 월의 월말 일자를 반환하는 함수
-- 날짜 : XXXXX.YYYYYYY
-- 1970년01월01일 00시 00분 00초 00ms -> 2023년 08월 22일 ...
-- 지난 일자를 정수로 계산, 시간정보는 소수부분으로 계산
-- XXXXX.YYYYYY 날짜 데이터를 월 단위로 절삭하면, 월초를 구할 수 있다.
SELECT TRUNC( sysdate, 'MM' ) AS 월초
     , sysdate AS 오늘
     , LAST_DAY( sysdate ) AS 월말
FROM dual;

-- 44. 테이블 EMPLOYEES 의 COMMISSION_PCT 를 중복없이 검색하되, NULL 이면 0으로 조회하고 내림차순으로 정렬하는
-- SQL 문을 작성하시오. (HR 계정 샘플 데이터)
-- DISTINCT - 중복 없이
-- NVL(값, 대체할 값) - 값 = 해당 컬럼
-- : 해당 값이 NULL 이면, 지정된 값으로 변환하는 함수
SELECT DISTINCT NVL(commission_pct, 0) AS "커미션(%)"
FROM employees
ORDER BY NVL(commission_pct, 0) DESC;
-- 조회한 컬럼의 별칭으로 ORDER BY 절에서 사용할 수 있다
SELECT DISTINCT NVL(commission_pct, 0) AS "커미션(%)"
FROM employees
ORDER BY "커미션(%)" DESC;

-- 45. 테이블 EMPLOYEES 의 FIRST_NAME, SALARY, COMMISSION_PCT 속성을 이용하여 <예시>와 같이 
-- SQL 문을 작성하시오. (HR 계정 샘플 데이터)
SELECT first_name AS 이름
     , salary AS 급여
     , NVL(commission_pct, 0) AS 커미션
     , salary + (salary * NVL(commission_pct, 0)) AS 최종급여
FROM employees
ORDER BY 최종급여 DESC;
-- NVL2( 값, NULL 아닐 때 값, NULL 일 때 값)
SELECT first_name AS 이름
     , salary AS 급여
     , NVL(commission_pct, 0) AS 커미션
     , salary + (salary * NVL(commission_pct, 0)) AS 최종급여
     , NVL2(commission_pct, salary + salary * commission_pct, salary) AS 최종급여2
FROM employees
ORDER BY 최종급여 DESC;

-- 46. 테이블 EMPLOYEES 의 FIRST_NAME, DEPARTMENT_ID 속성을 이용하여 <예시>와 같이 
-- SQL 문을 작성하시오.(HR 계정 샘플 데이터)
-- ENCODE : 암호화 / DECODE : 복호화
-- DECODE(컬럼명, 조건값1, 반환값1, 조건값2, 반환값2, ...)
-- : 지정한 컬럼의 값이 조건ㄱ밧에 일치하면 바로 뒤의 반환값을 출력하는 함수

SELECT first_name 이름
     , DECODE( department_id, 10, 'Administration',
                              20, 'Marketing',
                              30, 'Purchasing',
                              40, 'Human Resources',
                              50, 'Shipping',
                              60, 'IT',
                              70, 'Public Relations',
                              80, 'Sales',
                              90, 'Executive',
                              100, 'Finance'
     
     
     )
FROM employees
;
SELECT *
FROM departments;

-- 47. 테이블 EMPLOYEES 의 FIRST_NAME, DEPARTMENT_ID 속성을 이용하여 <예시>와 같이 
-- SQL 문을 작성하시오.(HR 계정 샘플 데이터)
-- CASE 문
-- : 조건식을 만족할 때, 출력할 값을 지정하는 구문
-- CASE
--      WHEN 조건식1 THEN 반환값1
--      WHEN 조건식@ THEN 반환값2
--      WHEN 조건식3 THEN 반환값3
--      WHEN 조건식4 THEN 반환값4
-- END
SELECT first_name 이름
     , CASE 
            WHEN department_id = 10  THEN 'Administration' 
            WHEN department_id = 20  THEN 'Marketing' 
            WHEN department_id = 30  THEN 'Purchasing' 
            WHEN department_id = 40  THEN 'Human Resources' 
            WHEN department_id = 50  THEN 'Shipping' 
            WHEN department_id = 60  THEN 'IT' 
            WHEN department_id = 70  THEN 'Public Relations' 
            WHEN department_id = 80  THEN 'Sales' 
            WHEN department_id = 90  THEN 'Executive' 
            WHEN department_id = 100 THEN 'Finance' 
       END 부서
FROM employees;

-- 48. 다음 <예시> 와 같이 테이블 EMPLOYEES 의 사원 수를 구하는 SQL 문을 작성하시오.(HR 계정 샘플 데이터)
-- COUNT(컬럼명) : 해당 테이블의 컴럼수를 반환
-- 컬럼을 지정하여 NULL 을 제외한 데이터 개수를 반환하는 함수
-- * NULL 이 없는 데이터라면 어떤 컬럼을 지정하더라도 개수가 같기 떄문에,
--   일반적으로, COUNT(*) 로 개수를 구한다.
SELECT COUNT(*) 사원수
FROM employees;

-- 49 .다음 <예시> 와 같이 테이블 EMPLOYEES 의 최고급여, 최저급여를 구하는 SQL 문을 작성하시오.
-- (HR 계정 샘플 데이터)
SELECT MAX(salary) 최고급여
     , MIN(salary) 최저급여
FROM employees;

-- 50. 다음 <예시> 와 같이 테이블 EMPLOYEES 의 급여합계, 급여평균을 구하는 SQL 문을 작성하시오.
SELECT SUM(salary) AS 급여합계
     , ROUND(AVG(salary), 2) AS 급여평균
FROM employees;

-- 51. 다음 <예시> 와 같이 테이블 EMPLOYEES 의 급여표준편자와 급여분산을 구하는 SQL 문을 작성하시오.
SELECT ROUND(STDDEV(salary), 2) AS 급여표준편차
     , ROUND(VARIANCE(salary), 2) AS 급여분산
FROM employees;

-- 52. 아래 <예시>의 TABLE 기술서를 참고하여 MS_STUDENT 테이블을 생성하는 SQL 문을 작성하시오.
-- * 테이블 생성
/*
    CREATE TABLE 테이블명 (
        컬럼명1    타입      [DEFAULT 기본값]      [NOT NULL / NULL] [ 제약조건 ],
        컬럼명2    타입      [DEFAULT 기본값]      [NOT NULL / NULL] [ 제약조건 ],
        컬럼명3    타입      [DEFAULT 기본값]      [NOT NULL / NULL] [ 제약조건 ],
        ...
    );
*/
CREATE TABLE MS_STUDENT (
    ST_NO       NUMBER          NOT NULL    PRIMARY KEY,
    NAME        VARCHAR2(20)    NOT NULL,
    CTZ_NO      CHAR(14)        NOT NULL,
    EMAIL       VARCHAR2(100)   NOT NULL    UNIQUE, 
    ADDRESS     VARCHAR2(1000)  NULL,
    DEPT_NO     NUMBER          NOT NULL,
    MJ_NO       NUMBER          NOT NULL,
    REG_DATE    DATE            DEFAULT sysdate NOT NULL,
    UPD_DATE    DATE            DEFAULT sysdate NOT NULL,
    ETC         VARCHAR2(1000)  DEFAULT '없음' NULL
    
);

COMMENT ON TABLE MS_STUDENT IS '학생들의 정보를 관리한다.';
COMMENT ON COLUMN MS_STUDENT.ST_NO IS '학생번호';
COMMENT ON COLUMN MS_STUDENT.NAME IS '이름';
COMMENT ON COLUMN MS_STUDENT.CTZ_NO IS '주민등록번호';
COMMENT ON COLUMN MS_STUDENT.EMAIL IS '이메일';
COMMENT ON COLUMN MS_STUDENT.ADDRESS IS '주소';
COMMENT ON COLUMN MS_STUDENT.DEPT_NO IS '학부번호';
COMMENT ON COLUMN MS_STUDENT.MJ_NO IS '전공번호';
COMMENT ON COLUMN MS_STUDENT.REG_DATE IS '등록일자';
COMMENT ON COLUMN MS_STUDENT.UPD_DATE IS '수정번호';
COMMENT ON COLUMN MS_STUDENT.ETC IS '특이사항';

DROP TABLE MS_STUDENT;

-- 53. 아래 <예시> 를 참고하여 MS_STUDENT 테이블에 속성을 추가하는 SQL 문을 작성하시오.

-- 테이블에 속성 추가
-- ALTER TABLE 테이블명 ADD 컬럼명 타입 DEFAULT 기본값 [NOT NULL];
ALTER TABLE MS_STUDENT ADD GENDER CHAR(6) DEFAULT '기타' NOT NULL;
COMMENT ON COLUMN MS_STUDENT.GENDER IS '성별';
ALTER TABLE MS_STUDENT ADD STATUS VARCHAR2(10) DEFAULT '대기' NOT NULL;
COMMENT ON COLUMN MS_STDENT.STATUS IS '재적';
ALTER TABLE MS_STUDENT ADD ADM_DATE DATE NULL;
COMMENT ON COLUMN MS_STDENT.ADM_DATE IS '입학일자';
ALTER TABLE MS_STUDENT ADD GRD_DATE DATE NOT NULL;
COMMENT ON COLUMN MS_STDENT.GRD_DATE IS '졸업일자';

SELECT * FROM MS_STUDENT;

ALTER TABLE MS_STUDENT DROP COLUMN GENDER;
ALTER TABLE MS_STUDENT DROP COLUMN STATUS;
ALTER TABLE MS_STUDENT DROP COLUMN ADM_DATE;
ALTER TABLE MS_STUDENT DROP COLUMN GRD_DATE;

DESC MS_STUDENT;

-- 54. 아래 <예시> 를 참고하여 MS_STUDENT 테이블의 주민번호 속성을 생년월일 속성으로 수정하는 SQL 문을 작성하시오.
ALTER TABLE MS_STUDENT RENAME COLUMN CTZ_NO TO BIRTH;
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE;
COMMENT ON COLUMN MS_STUDENT.BIRTH IS '생년월일';

-- 속성 변경 - 타입 변경
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE;
-- 속성 변경 - NULL 여부 변경
ALTER TABLE MS_STUDENT MODIFY BIRTH NULL;
-- 속성 변경 - DEFAULT 변경
ALTER TABLE MS_STUDENT MODIFY BIRTH DEFAULT sysdate;

-- 동시에 적용 가능
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE DEFAULT sysdate NOT NULL;

-- 55. 아래 <예시> 를 참고하여 MS_STUDENT 테이블의 학부번호 속성을 삭제하는 SQL 문을 작성하시오.
ALTER TABLE MS_STUDENT DROP COLUMN DEPT_NO;

-- 56. MS_STUDENT 테이블을 삭제하는 SQL 문을 작성하시오.
DROP TABLE MS_STUDENT;

-- 57. 아래 <예시>의 TABLE 기술서를 참고하여 MS_STUDENT 테이블을 생성하는 SQL 문을 작성하시오.
CREATE TABLE MS_STUDENT (
     ST_NO      NUMBER          NOT NULL   PRIMARY KEY
    ,NAME       VARCHAR2(20)    NOT NULL
    ,BIRTH      DATE            NOT NULL
    ,EMAIL      VARCHAR2(100)   NOT NULL
    ,ADDRESS    VARCHAR2(1000)  NULL
    ,MJ_NO      VARCHAR2(10)   NOT NULL
    ,GENDER     CHAR(6)         DEFAULT '기타'    NOT NULL
    ,STATUS     VARCHAR2(10)    DEFAULT '대기'    NOT NULL
    ,ADM_DATE   DATE    NULL
    ,GRD_DATE   DATE    NULL
    ,REG_DATE   DATE    DEFAULT sysdate NOT NULL
    ,UPD_DATE   DATE    DEFAULT sysdate NOT NULL
    ,ETC        VARCHAR2(1000)  DEFAULT '없음' NULL
);

COMMENT ON TABLE MS_STUDENT IS '학생들의 정보를 관리한다.';
COMMENT ON COLUMN MS_STUDENT.ST_NO IS '학생 번호';
COMMENT ON COLUMN MS_STUDENT.NAME IS '이름';
COMMENT ON COLUMN MS_STUDENT.BIRTH IS '생년월일';
COMMENT ON COLUMN MS_STUDENT.EMAIL IS '이메일';
COMMENT ON COLUMN MS_STUDENT.ADDRESS IS '주소';
COMMENT ON COLUMN MS_STUDENT.MJ_NO IS '전공번호';

COMMENT ON COLUMN MS_STUDENT.GENDER IS '성별';
COMMENT ON COLUMN MS_STUDENT.STATUS IS '재적';
COMMENT ON COLUMN MS_STUDENT.ADM_DATE IS '입학일자';
COMMENT ON COLUMN MS_STUDENT.GRD_DATE IS '졸업일자';

COMMENT ON COLUMN MS_STUDENT.REG_DATE IS '등록일자';
COMMENT ON COLUMN MS_STUDENT.UPD_DATE IS '수정일자';
COMMENT ON COLUMN MS_STUDENT.ETC IS '특이사항';

-- 58. 아래 <예시> 를 참고하여 MS_STUDENT 테이블에 데이터를 삽입하는 SQL 문을 작성하시오.
INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH ,EMAIL ,ADDRESS ,MJ_NO ,GENDER 
                        ,STATUS ,ADM_DATE ,GRD_DATE ,REG_DATE ,UPD_DATE ,ETC)
VALUES ('20180001', '최서아', '991005', 'csa@univ.ac,kr', '서울', 'I01',
        '여', '재학', '2018/03/01', NULL, sysdate, sysdate, NULL);
select * from ms_student;

INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20210001', '박서준', TO_DATE('2002/05/04', 'YYYY/MM/DD'), 'psj@univ.ac.kr', '서울', 'B02',
         '남', '재학', TO_DATE('2021/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );


INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20210002', '김아윤', TO_DATE('2002/05/04', 'YYYY/MM/DD'), 'kay@univ.ac.kr', '인천', 'S01',
         '여', '재학', TO_DATE('2021/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20160001', '정수안', TO_DATE('1997/02/10', 'YYYY/MM/DD'), 'jsa@univ.ac.kr', '경남', 'J01',
         '여', '재학', TO_DATE('2016/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20150010', '윤도현', TO_DATE('1996/03/11', 'YYYY/MM/DD'), 'ydh@univ.ac.kr', '제주', 'K01',
         '남', '재학', TO_DATE('2016/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );


INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20130007', '안아람', TO_DATE('1994/11/24', 'YYYY/MM/DD'), 'aar@univ.ac.kr', '경기', 'Y01',
         '여', '재학', TO_DATE('2013/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, '영상예술 특기자' );


INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20110002', '한성호', TO_DATE('1992/10/07', 'YYYY/MM/DD'), 'hsh@univ.ac.kr', '서울', 'E03',
         '남', '재학', TO_DATE('2015/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );

SELECT * FROM MS_STUDENT;

-- 59. INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20210001', '박서준', TO_DATE('2002/05/04', 'YYYY/MM/DD'), 'psj@univ.ac.kr', '서울', 'B02',
         '남', '재학', TO_DATE('2021/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );


INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20210002', '김아윤', TO_DATE('2002/05/04', 'YYYY/MM/DD'), 'kay@univ.ac.kr', '인천', 'S01',
         '여', '재학', TO_DATE('2021/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20160001', '정수안', TO_DATE('1997/02/10', 'YYYY/MM/DD'), 'jsa@univ.ac.kr', '경남', 'J01',
         '여', '재학', TO_DATE('2016/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20150010', '윤도현', TO_DATE('1996/03/11', 'YYYY/MM/DD'), 'ydh@univ.ac.kr', '제주', 'K01',
         '남', '재학', TO_DATE('2016/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );


INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20130007', '안아람', TO_DATE('1994/11/24', 'YYYY/MM/DD'), 'aar@univ.ac.kr', '경기', 'Y01',
         '여', '재학', TO_DATE('2013/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, '영상예술 특기자' );


INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20110002', '한성호', TO_DATE('1992/10/07', 'YYYY/MM/DD'), 'hsh@univ.ac.kr', '서울', 'E03',
         '남', '재학', TO_DATE('2015/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );

SELECT * FROM MS_STUDENT;

-- 59.
-- UPDATE MS_STUDENT
--    SET 컬럼1 = 변결할 값,
--        컬럼2 = 변경할 값,
--        ...
-- WHERE 조건;
UPDATE MS_STUDENT 
   SET ADDRESS = '서울',
       STATUS = '휴학'
WHERE ST_NO = '20160001';

UPDATE MS_STUDENT
   SET ADDRESS = '서울',
       STATUS = '졸업',
       GRD_DATE = '20200220',
       UPD_DATE = sysdate,
       ETC = '수석'
WHERE ST_NO = '20150010';

-- 60.
DELETE FROM MS_STUDENT
WHERE ST_NO = '20110002';

--61.
--62.
-- 백업 테이블 만들기
CREATE TABLE MS_STUDENT_BACK AS SELECT * FROM MS_STUDENT;
SELECT * FROM MS_STUDENT_BACK;

-- 63.
DELETE FROM MS_STUDENT;

SELECT * FROM MS_STUDENT;

-- 64.
INSERT INTO MS_STUDENT
SELECT * FROM MS_STUDENT_BACK;

-- 65.
-- CONSTRAINT : 제약 조건 추가시 사용
ALTER TABLE MS_STUDENT
ADD CONSTRAINT MS_STD_GENDER_CHECK
CHECK(gender IN ('여', '남', '기타'));

UPDATE MS_STUDENT
SET GENDER = '???';

-- 제약조건
-- 기본키 (PRIMARY KEY)
-- : 중복 불가, NULL 불가 (필수 입력)
-- * 해당 테이블의 데이터를 고유하게 구분할 수 있는 속성으로 지정

-- 고유기 (UNIQUE KEY)
-- : 중복 불가, NULL 허용
-- * 중복되지 않아야 할 데이터 (ID, 주민번호, 이메일, ... )


-- CHECK 제약조건
-- : 지정한 값만 입력/수정 가능하도록 제한하는 조건
-- 지정한 값이 아닌 다른 값을 입력/수정하는 경우
-- 체크 제약조건(HR.MS_STD_GENDER_CHECK)이 위배되었습니다 에러 발생

CREATE TABLE MS_USER (
     USER_NO       NUMBER          NOT NULL   PRIMARY KEY
    ,USER_ID       VARCHAR2(100)   NOT NULL   UNIQUE
    ,USER_PW       VARCHAR2(200)   NOT NULL
    ,USER_NAME     VARCHAR2(50)    NOT NULL
    ,BIRTH         DATE            NOT NULL
    ,TEL           VARCHAR2(20)    NOT NULL   UNIQUE
    ,ADDRESS       VARCHAR2(20)    NULL
    ,REG_DATE      DATE            DEFAULT sysdate NOT NULL
    ,UPD_DATE      DATE            DEFAULT sysdate NOT NULL
);
COMMENT ON TABLE MS_USER            IS '커뮤니티 회원의 정보를 관리한다.';
COMMENT ON COLUMN MS_USER.USER_NO   IS '회원정보';
COMMENT ON COLUMN MS_USER.USER_ID   IS '아이디';
COMMENT ON COLUMN MS_USER.USER_PW   IS '비밀번호';
COMMENT ON COLUMN MS_USER.USER_NAME IS '이름';
COMMENT ON COLUMN MS_USER.BIRTH     IS '생년월일';
COMMENT ON COLUMN MS_USER.TEL       IS '전화번호';
COMMENT ON COLUMN MS_USER.ADDRESS   IS '주소';
COMMENT ON COLUMN MS_USER.REG_DATE  IS '등록일자';
COMMENT ON COLUMN MS_USER.UPD_DATE  IS '수정일자';

CREATE TABLE MS_BOARD (
     BOARD_NO     NUMBER          NOT NULL   PRIMARY KEY
    ,TITLE        VARCHAR2(200)   NOT NULL
    ,CONTENT      CLOB            NOT NULL
    ,WRITER       VARCHAR2(100)   NOT NULL
    ,HIT          NUMBER          NULL
    ,LIKE_CNT     NUMBER          NOT NULL
    ,DEL_YN       CHAR(2)         NULL
    ,DEL_DATE     DATE            NULL
    ,REG_DATE     DATE            DEFAULT sysdate NOT NULL
    ,UPD_DATE     DATE            DEFAULT sysdate NOT NULL
);
COMMENT ON TABLE MS_BOARD             IS '커뮤니티 게시판 정보를 관리한다.';
COMMENT ON COLUMN MS_BOARD.BOARD_NO   IS '글번호';
COMMENT ON COLUMN MS_BOARD.TITLE      IS '제목';
COMMENT ON COLUMN MS_BOARD.CONTENT    IS '내용';
COMMENT ON COLUMN MS_BOARD.WRITER     IS '작성자';
COMMENT ON COLUMN MS_BOARD.HIT        IS '조회수';
COMMENT ON COLUMN MS_BOARD.LIKE_CNT   IS '좋아요 수';
COMMENT ON COLUMN MS_BOARD.DEL_YN     IS '삭제여부';
COMMENT ON COLUMN MS_BOARD.DEL_DATE   IS '삭제일자';
COMMENT ON COLUMN MS_BOARD.REG_DATE   IS '등록일자';
COMMENT ON COLUMN MS_BOARD.UPD_DATE   IS '수정일자';

CREATE TABLE MS_FILE (
     FILE_NO        NUMBER          NOT NULL   PRIMARY KEY
    ,BOARD_NO       NUMBER          NOT NULL
    ,FILE_NAME      VARCHAR2(2000)  NOT NULL
    ,FILE_DATE      BOLB            NOT NULL
    ,REG_DATE       DATE            DEFAULT sysdate NOT NULL
    ,UPD_DATE       DATE            DEFAULT sysdate NOT NULL
);
COMMENT ON TABLE MS_FILE             IS '커뮤니티 게시판 첨부파일의 정보를 관리한다.';
COMMENT ON COLUMN MS_FILE.FILE_NO    IS '파일번호';
COMMENT ON COLUMN MS_FILE.BOARD_NO   IS '글번호';
COMMENT ON COLUMN MS_FILE.FILE_NAME  IS '파일명';
COMMENT ON COLUMN MS_FILE.FILE_DATE  IS '파일';
COMMENT ON COLUMN MS_FILE.REG_DATE   IS '등록일자';
COMMENT ON COLUMN MS_FILE.UPD_DATE   IS '수정일자';

CREATE TABLE MS_REPLY (
     REPLY_NO       NUMBER          NOT NULL        PRIMARY KEY
    ,BOARD_NO       NUMBER          NOT NULL
    ,CONTENT        VARCHAR2(2000)  NOT NULL
    ,WRITER         VARCHAR2(100)   NOT NULL
    ,DEL_YN         CHAR(2)         DEFAULT 'N'     NULL
    ,DEL_DATE       DATE            NULL
    ,REG_DATE       DATE            DEFAULT sysdate NOT NULL
    ,UPD_DATE       DATE            DEFAULT sysdate NOT NULL
);
COMMENT ON TABLE MS_REPLY              IS '커뮤니티 게시판의 댓글 정보를 관리한다.';
COMMENT ON COLUMN MS_REPLY.REPLY_NO    IS '댓글번호';
COMMENT ON COLUMN MS_REPLY.BOARD_NO    IS '글번호';
COMMENT ON COLUMN MS_REPLY.CONTENT     IS '내용';
COMMENT ON COLUMN MS_REPLY.WRITER      IS '작성자';
COMMENT ON COLUMN MS_REPLY.DEL_YN      IS '삭제여부';
COMMENT ON COLUMN MS_REPLY.DEL_DATE    IS '삭제일자';
COMMENT ON COLUMN MS_REPLY.REG_DATE    IS '등록일자';
COMMENT ON COLUMN MS_REPLY.UPD_DATE    IS '수정일자';