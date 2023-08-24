-- 83.
-- 1) 직원명이 이태림인 사람의 부서 코드
SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '이태림';

-- 2) 그 부서의 직원들
SELECT EMP_ID 사원번호
     , EMP_NAME 직원명
     , EMAIL 이메일
     , PHONE 전화번호
FROM EMPLOYEE E
WHERE (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '이태림') = E.DEPT_CODE
;

-- 84.
-- 서브쿼리
SELECT * FROM DEPARTMENT;
SELECT DEPT_ID 부서번호
     , DEPT_TITLE 부서명
     , LOCATION_ID 지역ID
FROM DEPARTMENT A
WHERE DEPT_ID IN (SELECT DISTINCT DEPT_CODE 
                  FROM EMPLOYEE E, DEPARTMENT D 
                  WHERE E.DEPT_CODE = D.DEPT_ID)
--                  SELECT DISTINCT DEPT_CODE
--                  FROM EMPLOYEE
--                  WHERE DEPT_CODE IS NOT NULL;
ORDER BY A.DEPT_ID
;
-- EXISTS
-- : 존재하는 데이터만 확인해서 조회한다.
SELECT DEPT_ID 부서번호
     , DEPT_TITLE 부서명
     , LOCATION_ID 지역ID
FROM DEPARTMENT D
WHERE EXISTS (
                SELECT *
                FROM EMPLOYEE E
                WHERE E.DEPT_CODE = D.DEPT_ID
             )
ORDER BY DEPT_ID
;

-- 85.
SELECT DEPT_ID 부서번호
     , DEPT_TITLE 부서명
     , LOCATION_ID 지역ID
FROM DEPARTMENT D
WHERE DEPT_ID NOT IN (
                      SELECT DISTINCT DEPT_CODE 
                      FROM EMPLOYEE E 
                      WHERE E.DEPT_CODE = D.DEPT_ID
                     )
ORDER BY D.DEPT_ID
;

-- 86.
SELECT E.EMP_ID 사원번호
     , E.EMP_NAME 직원명
     , E.DEPT_CODE 부서번호
     , D.DEPT_TITLE 부서명
     , TO_CHAR(E.SALARY, '999,999,999') 급여
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.SALARY > (
                    SELECT MAX(SALARY) 
                    FROM EMPLOYEE 
                    WHERE DEPT_CODE = 'D1'
                 ) 
  AND E.DEPT_CODE = D.DEPT_ID
;
-- ALL
SELECT E.EMP_ID 사원번호
     , E.EMP_NAME 직원명
     , E.DEPT_CODE 부서번호
     , D.DEPT_TITLE 부서명
     , TO_CHAR(E.SALARY, '999,999,999') 급여
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID 
    AND E.SALARY > ALL (
                        SELECT MAX(SALARY) 
                        FROM EMPLOYEE 
                        WHERE DEPT_CODE = 'D1'
                        )
;

-- 87.
SELECT E.EMP_ID 사원번호
     , E.EMP_NAME 직원명
     , E.DEPT_CODE 부서번호
     , D.DEPT_TITLE 부서명
     , TO_CHAR(E.SALARY, '999,999,999') 급여
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.SALARY > (
                    SELECT MIN(SALARY) 
                    FROM EMPLOYEE 
                    WHERE DEPT_CODE = 'D9'
                 ) 
  AND E.DEPT_CODE = D.DEPT_ID
;

-- ANY 
-- : 조건이 만족하는 값이 하나라도 있으면 결과를 출력하는 연산자
SELECT E.EMP_ID 사원번호
     , E.EMP_NAME 직원명
     , E.DEPT_CODE 부서번호
     , D.DEPT_TITLE 부서명
     , TO_CHAR(E.SALARY, '999,999,999') 급여
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID 
    AND E.SALARY > ANY (
                        SELECT MIN(SALARY) 
                        FROM EMPLOYEE 
                        WHERE DEPT_CODE = 'D9'
                        )
;

-- 88.
SELECT EMP_ID 사원번호
     , EMP_NAME 직원명
     , NVL(DEPT_ID, '없음') 부서번호
     , NVL(DEPT_TITLE, '없음') 부서명
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
;

-- 89.
SELECT NVL(EMP_ID, '(없음)') 사원번호
     , NVL(EMP_NAME, '(없음)') 직원명
     , DEPT_ID 부서번호
     , DEPT_TITLE 부서명
FROM EMPLOYEE E
RIGHT JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
;

-- 90.
SELECT NVL(EMP_ID, '(없음)') 사원번호
     , NVL(EMP_NAME, '(없음)') 직원명
     , NVL(DEPT_ID, '(없음)') 부서번호
     , NVL(DEPT_TITLE, '(없음)') 부서명
FROM EMPLOYEE E
    FULL JOIN DEPARTMENT D
           ON E.DEPT_CODE = D.DEPT_ID
;

-- 91.
-- 사원번호, 직원명, 부서번호, 지역명, 국가명, 급여, 입사일자 출력
-- 지역명 : LOCATION.LOCAL_NAME
-- 국가명 : NATIONAL.NATIONAL_NAME
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;

SELECT E.EMP_NO 사원번호
     , E.EMP_NAME 직원명
     , D.DEPT_ID 부서번호
     , D.DEPT_TITLE 부서명
     , L.LOCAL_NAME 지역명
     , N.NATIONAL_NAME 국가명
     , E.SALARY 급여
     , E.HIRE_DATE 입사일자
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
LEFT JOIN LOCATION L   ON D.LOCATION_ID = L.LOCAL_CODE
LEFT JOIN NATIONAL N   ON L.NATIONAL_CODE = N.NATIONAL_CODE
;

-- 92.
SELECT * FROM EMPLOYEE;
-- 매니저들의 사원번호
SELECT DISTINCT MANAGER_ID FROM EMPLOYEE WHERE MANAGER_ID IS NOT NULL;

-- EMPLOYEE, DEPARTMENT, JOB 테이블을 조인하여 조회
SELECT EMP_ID 사원번호
     , EMP_NAME 직원명
     , DEPT_TITLE 부서명
     , JOB_NAME 직급
     , '매니저' 구분
FROM EMPLOYEE E
    LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
    JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE EMP_ID IN ( SELECT DISTINCT MANAGER_ID FROM EMPLOYEE WHERE MANAGER_ID IS NOT NULL )
;

-- 93.
SELECT EMP_ID 사원번호
     , EMP_NAME 직원명
     , DEPT_TITLE 부서명
     , JOB_NAME 직급
     , '사원' 구분
FROM EMPLOYEE E
    LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
    JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE EMP_ID NOT IN ( SELECT DISTINCT MANAGER_ID FROM EMPLOYEE WHERE MANAGER_ID IS NOT NULL )
;

-- 94.
-- UNION 키워드
-- SELECT 문에는 두 조건이 모두 짝을 이뤄야 함
SELECT EMP_ID 사원번호
     , EMP_NAME 직원명
     , DEPT_TITLE 부서명
     , JOB_NAME 직급
     , '매니저' 구분
FROM EMPLOYEE E
    LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
    JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE EMP_ID IN ( SELECT DISTINCT MANAGER_ID FROM EMPLOYEE WHERE MANAGER_ID IS NOT NULL )
UNION
SELECT EMP_ID 사원번호
     , EMP_NAME 직원명
     , DEPT_TITLE 부서명
     , JOB_NAME 직급
     , '사원' 구분
FROM EMPLOYEE E
    LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
    JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE EMP_ID NOT IN ( SELECT DISTINCT MANAGER_ID FROM EMPLOYEE WHERE MANAGER_ID IS NOT NULL )
;


-- 95.
SELECT EMP_ID 사원번호
     , EMP_NAME 직원명
     , DEPT_TITLE 부서명
     , JOB_NAME 직급
     , CASE
             WHEN EMP_ID IN (
                            SELECT DISTINCT MANAGER_ID 
                            FROM EMPLOYEE 
                            WHERE MANAGER_ID IS NOT NULL
                            )
             THEN '매니저'
             ELSE '사원'
        END 구분
FROM EMPLOYEE E
    LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
    JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
;

-- 96.
SELECT SUBSTR(EMP_NO, 1, 2)
      ,SUBSTR(EMP_NO, 8, 1)
FROM EMPLOYEE ;
SELECT * FROM EMPLOYEE;

SELECT E.EMP_ID 사원번호
     , E.EMP_NAME 직원명
     , D.DEPT_TITLE 부서명
     , J.JOB_NAME 직급
     , CASE 
            WHEN EMP_ID IN (
                             SELECT DISTINCT MANAGER_ID
                             FROM EMPLOYEE
                             WHERE MANAGER_ID IS NOT NULL
                           )
            THEN '매니저'
            ELSE '사원'
       END 구분
     , CASE
            WHEN SUBSTR(EMP_NO, 8, 1) IN (
                                    SELECT SUBSTR(EMP_NO, 8, 1)
                                    FROM EMPLOYEE
                                    WHERE SUBSTR(EMP_NO, 8, 1) = 1
                                    )
            THEN '남자'
            ELSE '여자'
       END 성별
       , TO_CHAR(SYSDATE, 'YYYY') - 
       ( CASE
                WHEN SUBSTR(EMP_NO, 8, 1) IN ('1', '2') THEN '19'
                WHEN SUBSTR(EMP_NO, 8, 1) IN ('3', '4') THEN '20'
         END || SUBSTR(EMP_NO, 1, 2) ) + 1 나이
       , RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') 주민등록번호
FROM EMPLOYEE E
    LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
    JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
;

-- 97.
SELECT SUBSTR(EMP_NO, 1, 2)
      ,SUBSTR(EMP_NO, 8, 1)
FROM EMPLOYEE ;
SELECT * FROM EMPLOYEE;

SELECT ROWNUM 순번 
     , E.EMP_ID 사원번호
     , E.EMP_NAME 직원명
     , D.DEPT_TITLE 부서명
     , J.JOB_NAME 직급
     , CASE 
            WHEN EMP_ID IN (
                             SELECT DISTINCT MANAGER_ID
                             FROM EMPLOYEE
                             WHERE MANAGER_ID IS NOT NULL
                           )
            THEN '매니저'
            ELSE '사원'
       END 구분
     , CASE
            WHEN SUBSTR(EMP_NO, 8, 1) IN (
                                    SELECT SUBSTR(EMP_NO, 8, 1)
                                    FROM EMPLOYEE
                                    WHERE SUBSTR(EMP_NO, 8, 1) = 1
                                    )
            THEN '남자'
            ELSE '여자'
       END 성별
       , TO_CHAR(SYSDATE, 'YYYY') - 
       ( CASE
                WHEN SUBSTR(EMP_NO, 8, 1) IN ('1', '2') THEN '19'
                WHEN SUBSTR(EMP_NO, 8, 1) IN ('3', '4') THEN '20'
         END || SUBSTR(EMP_NO, 1, 2) ) + 1 현재나이
       , TRUNC( MONTHS_BETWEEN ( SYSDATE, TO_DATE(
                                                   CASE
                                                        WHEN SUBSTR(EMP_NO, 8, 1) IN ('1', '2') THEN '19'
                                                        WHEN SUBSTR(EMP_NO, 8, 1) IN ('1', '2') THEN '20'
                                                   END || SUBSTR(EMP_NO, 1, 6)
                                                   )
                                ) / 12
               ) 만나이
       , TRUNC( MONTHS_BETWEEN(sysdate ,hire_date) / 12) 근속년수
       , RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') 주민등록번호
       , TO_CHAR(HIRE_DATE, 'YYYY.MM.DD') 입사일자
       , TO_CHAR((SALARY + NVL(SALARY*BONUS, 0)) * 12, '999,999,999,999') 연봉
FROM EMPLOYEE E
    LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
    JOIN JOB J USING(JOB_CODE)
-- 조인하고자 하는 두 테이블의 컴럼명이 같을 때 
-- ON 키워드 대신 조인 조건을 간단하게 작성하는 키워드
;