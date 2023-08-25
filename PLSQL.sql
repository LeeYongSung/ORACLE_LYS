-- PL/SQL
-- 익명 블록
-- DECLARE, BEGIN, EXCEPTION -- ; 세미콜론 사용 X
SET SERVEROUTPUT ON
DECLARE
    
BEGIN
    
    DBMS_OUTPUT.PUT_LINE();

END;
/

SET SERVEROUTPUT ON         -- 실행 결과 출력하도록 설정
DECLARE
    vi_num NUMBER;         -- 선언부
BEGIN
    vi_num := 100;          -- 실행부
    DBMS_OUTPUT.PUT_LINE(vi_num);

END;
/


-- 조회 결과를 변수에 대입하기
-- INTO
DECLARE
    vs_emp_name VARCHAR2(100);                  -- 사원명
    vs_dept_name VARCHAR2(100);                 -- 부서명
BEGIN
    SELECT e.emp_name, d.dept_title
        INTO vs_emp_name, vs_dept_name         -- 조회 결과를 변수에 대입
    FROM employee e, department d
    WHERE e.dept_code = d.dept_id
        AND e.emp_id = 200;
    
    DBMS_OUTPUT.PUT_LINE(vs_emp_name || ' : ' || vs_dept_name);
END;
/


-- 조건문
-- IF
DECLARE
    vn_num1 NUMBER := 10;
    vn_num2 NUMBER := 20;
BEGIN
    IF vn_num1 > vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE(vn_num1 || '이 더 큽니다.');
    ELSE 
        DBMS_OUTPUT.PUT_LINE(vn_num2 || '이 더 큽니다.');
    END IF;
END;
/

-- IF ~ ELSE
DECLARE
    vn_dept_code department.dept_id%TYPE := 'D1';       -- 부서ID
    vn_salary NUMBER := 0;
BEGIN
    SELECT MAX(salary)
        INTO vn_salary
        FROM employee
        WHERE dept_code = vn_dept_code;
        
    DBMS_OUTPUT.PUT_LINE('D1 부서 최대급여 : ' || vn_salary);

    IF vn_salary BETWEEN 1000000 AND 2000000 THEN
        DBMS_OUTPUT.PUT_LINE(1);
    ELSIF vn_salary BETWEEN 2000001 AND 3000000 THEN
        DBMS_OUTPUT.PUT_LINE(2);
    ELSE
        DBMS_OUTPUT.PUT_LINE(3);
    END IF;    
END;
/

-- 반복문
-- LOOP
DECLARE
    vn_base_num NUMBER := 3;
    vn_cnt NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(vn_base_num || '*' || vn_cnt || '=' || vn_base_num * vn_cnt);
        vn_cnt := vn_cnt + 1;
        EXIT WHEN vn_cnt > 9;
    END LOOP;    
END;
/

-- WHILE LOOP
DECLARE
    vn_base_num NUMBER := 3;
    vn_cnt NUMBER := 1;
BEGIN
    WHILE vn_cnt <= 9 LOOP
        DBMS_OUTPUT.PUT_LINE(vn_base_num || '*' || vn_cnt || '=' || vn_base_num * vn_cnt);
        vn_cnt := vn_cnt + 1;
    END LOOP;    
END;
/

-- FOR LOOP
DECLARE
    vn_base_num NUMBER := 3;
BEGIN
    FOR i IN 1..9 LOOP
        DBMS_OUTPUT.PUT_LINE(vn_base_num || '*' || i || '=' || vn_base_num * i);
    END LOOP;    
END;
/

-- FOR LOOP(REVERSE)
DECLARE
    vn_base_num NUMBER := 3;
BEGIN
    FOR i IN REVERSE 1..9 LOOP
        DBMS_OUTPUT.PUT_LINE(vn_base_num || '*' || i || '=' || vn_base_num * i);
    END LOOP;    
END;
/

-- CONTINUE
DECLARE
    vn_num NUMBER := 1;
BEGIN
    FOR i IN 1..20 LOOP
        CONTINUE WHEN MOD(i, 2) = 0;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;    
END;
/

-- NULL
DECLARE
    vn_var VARCHAR2(10) := 'A';
BEGIN
    CASE
        WHEN vn_var = 'A' THEN
                DBMS_OUTPUT.PUT_LINE('A');
        WHEN vn_var = 'B' THEN        
                DBMS_OUTPUT.PUT_LINE('B');
        ELSE
            NULL;               -- 아무것도 처리하는 NULL 문
        END CASE;
END;
/

-- 프로시저 생성
CREATE OR REPLACE PROCEDURE pro_print
IS
    -- 선언부
    V_A NUMBER := 10;
    V_B NUMBER := 20;
    V_C NUMBER;
BEGIN
    -- 실행부
    V_C := V_A + V_B;
    DBMS_OUTPUT.PUT_LINE('V_C : ' || V_C);
END;
/

-- 프로시저 실행
EXECUTE pro_print();

-- 함수 생성
-- 사원번호로 부서명을 구하는 함수
CREATE OR REPLACE FUNCTION get_dept_title( p_emp_id NUMBER )
RETURN  VARCHAR2
IS
    out_title department.dept_title%TYPE;
BEGIN
    SELECT dept_title
        INTO out_title
    FROM employee e, department d
    WHERE e.dept_code = d.dept_id
        AND e.emp_id = p_emp_id;
    RETURN out_title;    
END;
/

-- SELECT 문에서 함수 실행
SELECT emp_name 사원명
     , get_dept_title(emp_id) 부서명
FROM employee;

-- 블록에서 함수 실행
DECLARE
    result department.dept_title%TYPE;
BEGIN
    result := get_dept_title( 200 );
    DBMS_OUTPUT.PUT_LINE(result);
END;
/

-- 함수 생성2
-- 세후 급여
CREATE OR REPLACE FUNCTION func_sal_tax( IN_SALARY IN NUMBER ) -- in 파라미터
RETURN  NUMBER
IS
    tax NUMBER := 0.10;
    result NUMBER;
BEGIN
    result := TRUNC(IN_SALARY - (IN_SALARY * tax), 2);
    RETURN result;
END;
/

SELECT emp_id
     , emp_name
     , salary 세전급여
     , func_sal_tax( salary ) 세후급여
FROM employee; 



-- 프로시저 (파라미터 사용)
-- board 테이블 생성
CREATE TABLE board (
     board_no NUMBER PRIMARY KEY
    ,title VARCHAR2(100) NOT NULL
    ,writer VARCHAR2(100) NOT NULL
    ,content VARCHAR2(2000) NULL
    ,reg_date DATE DEFAULT sysdate NOT NULL
    ,upd_date DATE DEFAULT sysdate NOT NULL
);

-- SEQ_BOARD 시퀀스 생성
DROP SEQUENCE SQE_BOARD;
CREATE SEQUENCE SEQ_BOARD
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 10000;
-- 입력 : 사원번호, 제목, 내용
-- board 테이블에 사원명으로 글쓰기를 하는 프로시저

CREATE OR REPLACE PROCEDURE pro_emp_write
(
    IN_EMP_ID IN employee.emp_id%TYPE,
    IN_TITLE IN VARCHAR2 DEFAULT '제목없음',
    IN_CONTENT IN VARCHAR2 DEFAULT '내용없음'
)
IS
    V_EMP_NAME employee.emp_name%TYPE;
BEGIN
    SELECT emp_name INTO V_EMP_NAME
    FROM employee
    WHERE emp_id = IN_EMP_ID;
    
    INSERT INTO board( board_no, title, writer, content )
    VALUES ( SEQ_BOARD.nextval, IN_TITLE, V_EMP_NAME, IN_CONTENT );
    
END;
/

--
EXECUTE pro_emp_write( '200', '제목1', '내용1' );
EXECUTE pro_emp_write( '201', '제목1');
EXECUTE pro_emp_write( '202');

SELECT * FROM board;


-- OUT 파라미터로 프로시저 사용하기
CREATE OR REPLACE PROCEDURE pro_out_emp (
    IN_EMP_ID IN employee.emp_id%TYPE,
    OUT_RESULT_STR OUT CLOB
)
IS
    V_EMP employee%ROWTYPE;
    -- %ROWTYPE
    -- : 해당 테이블 또는 뷰 컬럼들을 참조타입으로 선언
BEGIN
    SELECT * INTO V_EMP
    FROM employee
    WHERE emp_id = IN_EMP_ID;
    
    OUT_RESULT_STR := V_EMP.emp_id || '/' || V_EMP.emp_name || '/' || V_EMP.salary;
END;
/

--
DECLARE
    out_result_str CLOB;    
BEGIN
    pro_out_emp( '200', out_result_str );
    DBMS_OUTPUT.PUT_LINE( out_result_str );
END;
/

-- 프로시저로 OUT 파라미터 2개 이상 사용하기
CREATE OR REPLACE PROCEDURE pro_out_mul (
    IN_EMP_ID IN employee.emp_id%TYPE,
    OUT_DEPT_CODE OUT employee.dept_code%TYPE,
    OUT_JOB_CODE OUT employee.job_code%TYPE
)
IS
    V_EMP employee%ROWTYPE;
BEGIN
    SELECT * INTO V_EMP
    FROM employee
    WHERE emp_id = IN_EMP_ID;

    OUT_DEPT_CODE := V_EMP.dept_code;
    OUT_JOB_CODE := V_EMP.job_code;
END;
/
-- 프로시저 호출
-- 1) 매개변수가 없거나, IN 매개변수 만 : EXECUTE 프로시저명(인자1, 인자2);
-- 2) OUT 매개변수                    : PL/SQL 블록 안에서 호출

EXECUTE pro_out_mul( 1, 2, 3 ) -- OUT 파라미터가 있어서, 블록 안에서 호출해야함
--

DECLARE
    out_dept_code employee.dept_code%TYPE;
    out_job_code employee.job_code%TYPE;
BEGIN
    pro_out_mul('200', out_dept_code, out_job_code);
    DBMS_OUTPUT.PUT_LINE( out_dept_code );
    DBMS_OUTPUT.PUT_LINE( out_job_code );
END;
/