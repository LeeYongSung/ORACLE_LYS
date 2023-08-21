
-- Ŀ�� ���� ����Ű : ctrl + enter
-- ���� ��ü ���� : F5
SELECT 1+1 FROM dual;

-- 1. ���� ���� ��ɾ�
-- conn ������/��й�ȣ
conn system/123456;


-- 2. 
-- SQL�� ��/�ҹ��� ������ ����.
-- ��ɾ� Ű���� �빮��, �ĺ��ڴ� �ҹ��� �ַ� ����Ѵ�. (���� ��Ÿ�ϴ��)
SELECT user_id, username
FROM all_users
WHERE username = 'HR';

-- ���� �����ϱ�
 -- 11g ���� ���� : � �̸����ε� ���� ���� ����
 -- 12c ���� �̻� : 'c##'���ξ �ٿ��� ������ �����ϵ��� ��å�� ����
 
-- C## ���� ���� ����
 -- ALTER SESSION SET '_ORACLE_SCRIPT' = TRUE;
ALTER SESSION SET '_ORACLE_SCRIPT' = TRUE;
 
-- HR ���� ����
CREATE USER HR IDENTIFIED BY 123456;

-- ���̺� �����̽� ����
 -- HR ������ �⺻ ���̺� ������ 'users' �������� ����
 -- ALTER USER ������ DEFAULT TABLESPACE users;
ALTER USER HR DEFAULT TABLESPACE users;


-- ������ ����� �� �ִ� �뷮 ����
 -- HR ������ ��� �뷮�� ���Ѵ�� ����
 -- ALTER USER ������ QUOTA UNLIMITED ON ���̺����̽�;
ALTER USER HR QUOTA UNLIMITED ON users;

-- ������ ������ �ο�
 -- HR ������ connect, resource ������ �ο�
 -- GRANT ���Ѹ�1, ���Ѹ�2 TO ������;
GRANT connect, resource TO HR;

-- �⺻ ��������
 -- HR ������ �����ϰ�, �⺻ ���� �� ���� �ο�
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER HR IDENTIFIED BY 123456;
ALTER USER HR DEFAULT TABLESPACE users;
ALTER USER HR QUOTA UNLIMITED ON users;
GRANT connect, resource TO HR;


-- ���� ����
-- DROP USER ������ [CASCADE];
DROP USER HR CASCADE;

-- ���� ��� ����
-- ALTER USER ������ ACCOUNT UNLOCK;
ALTER USER HR ACCOUNT UNLOCK;

-- HR ���� ��Ű��(������) ��������
    -- 1. SQL PLUS
    -- 2. HR ������ ����
    -- 3. ��ɾ� �Է�
     -- @[���]\hr_main.sql
        -- @? : ����Ŭ�� ��ġ�� �⺻ ���
        -- @?/demo/schema/human_resources/hr_main.sql
    -- 4. 123456[��й�ȣ]
    -- 5. users [tablespace]
    -- 6. temp [temp tablespace]
    -- 7 [log ���] - @?/demo/schema/log
    
    
-- 3.
-- ���̺� EMPLOYEES �� ���̺� ������ ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- * ������̺��� �����ȣ��, �̸��� ��ȸ
DESC employees;
SELECT employee_id, first_name FROM employees;

-- 4. ���̺� EMPLOYEES �� <����>�� ���� ��µǵ��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- employee_id AS �����ȣ
-- * ���Ⱑ ������, ����ǥ �������� 
-- employee_id AS ��� ��ȣ (X) / employee_id AS "��� ��ȣ" (O) / 
-- employee_id �����ȣ
-- * AS ��������
-- AS(alias) : ��µǴ� �ķ��� ������ ���� ��ɾ�
SELECT employee_id AS "��� ��ȣ" -- ��� ���Ⱑ ������, " " �� ǥ��
     , first_name AS �̸�
     , last_name AS ��
     , email AS �̸���
     , phone_number AS ��ȭ��ȣ
     , hire_date AS �Ի�����
     , salary AS �޿�
FROM employees;

-- 
SELECT * FROM employees; -- (*) [�ֽ��͸�ũ] : ��� �÷� ����

-- 5. ���̺� EMPLOYEES �� JOB_ID�� �ߺ��� �����͸� �����ϰ� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- * DISTINCT �÷��� : �ߺ��� �����͸� �����ϰ� ��ȸ�ϴ� Ű����
SELECT DISTINCT JOB_ID FROM employees;

-- 6. ���̺� EMPLOYEES �� SALARY(�޿�)�� 6000�� �ʰ��ϴ� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM employees WHERE SALARY > 6000;

-- 7. ���̺� EMPLOYEES �� SALARY(�޿�)�� 10000�� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM employees WHERE SALARY = 10000;

-- 8. ���̺� EMPLOYEES �� ��� �Ӽ����� SALARY �� �������� �������� �����ϰ�, FIRST_NAME �� �������� �������� ����
-- �Ͽ� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ���� ��ɾ�
-- ORDER BY �÷��� [ASC / DESC]
-- * ASC      : ��������
-- * DESC     : ��������
-- * (����)    : ���������� �⺻��
SELECT * FROM employees ORDER BY SALARY DESC, first_name ASC;

-- 9. ���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �� ����� ��� �÷��� ��ȸ�ϴ� 
-- SQL ���� �ۼ��Ͻÿ�. OR ���
-- ���� ����
-- OR : ~ �Ǵ�
-- WHERE A OR B
SELECT * FROM employees WHERE job_id = 'FI_ACCOUNT' OR job_id = 'IT_PROG';

-- 10. ���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �� ����� ��� �÷��� ��ȸ�ϴ� 
-- SQL ���� �ۼ��Ͻÿ�. IN ���
-- * �÷��� IN ('A', 'B') : OR ������ ��ü�Ͽ� ����� �� �ִ� Ű����
SELECT * FROM employees WHERE job_id IN ('FI_ACCOUNT', 'IT_PROG'); 

-- 11. ���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �ƴ� ����� ��� �÷��� ��ȸ�ϴ� 
-- SQL ���� �ۼ��Ͻÿ�.
-- * �÷��� NOT IN ('A', 'B') : 'A', 'B' �� ������ ����� ��ȸ
SELECT * FROM employees WHERE job_id NOT IN ('FI_ACCOUNT', 'IT_PROG'); 

-- 12. ���̺� EMPLOYEES �� JOB_ID�� ��IT_PROG�� �̸鼭 SALARY �� 6000 �̻��� ����� ��� �÷��� ��ȸ�ϴ� 
-- SQL ���� �ۼ��Ͻÿ�.
-- ���� ����
-- AND ���� : ~�̸鼭, �׸���, ���ÿ�
-- WHERE A AND B
SELECT * FROM employees WHERE job_id = 'IT_PROG' AND salary >= 6000;

-- 13. ���̺� EMPLOYEES �� FIRST_NAME �� ��S���� �����ϴ� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM employees WHERE first_name LIKE 'S%';

-- 14. ���̺� EMPLOYEES �� FIRST_NAME �� ��s���� ������ ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM employees WHERE first_name LIKE '%s';

-- 15. ���̺� EMPLOYEES �� FIRST_NAME �� ��s���� ���ԵǴ� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM employees WHERE first_name LIKE 'S%' OR first_name LIKE '%s%';

-- 16. ���̺� EMPLOYEES �� FIRST_NAME �� 5������ ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM employees WHERE first_name LIKE'_____';
-- LENGTH(�÷���) : ���� ���� ��ȯ�ϴ� �Լ�
SELECT * FROM employees WHERE LENGTH(first_name) = 5;

-- 17. ���̺� EMPLOYEES �� COMMISSION_PCT�� NULL �� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM employees WHERE COMMISSION_PCT IS null;

-- 18. ���̺� EMPLOYEES �� COMMISSION_PCT�� NULL�� �ƴ� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM employees WHERE COMMISSION_PCT IS NOT null;

-- 19. ���̺� EMPLOYEES �� ����� HIRE_DATE�� 04�� �̻��� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM employees WHERE HIRE_DATE >='04/01/01';
-- SQL Developere ���� ������ �����͸� ��¥�� �����ͷ� �ڵ� ��ȯ
SELECT * FROM employees WHERE hire_date >= TO_DATE('20040101', 'YYYYMMDD'); 
-- TO_DATE : ������ �����͸� ��¥�� �����ͷ� ��ȯ�ϴ� �Լ�

-- 20. ���̺� EMPLOYEES �� ����� HIRE_DATE�� 04�⵵���� 05�⵵�� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM employees WHERE hire_date >= TO_DATE('20040101', 'YYYYMMDD')
                                        AND hire_date <= TO_DATE('20051231', 'YYYYMMDD'); 
-- �÷� BETWEEN A AND B;
-- : A ���� ũ�ų� ���� B���� �۰ų� ���� ���� (����)
SELECT * FROM employees WHERE hire_date BETWEEN TO_DATE('20040101', 'YYYYMMDD')
                                        AND TO_DATE('20051231', 'YYYYMMDD'); 
SELECT * FROM employees WHERE HIRE_DATE BETWEEN '04/01/01' AND '05/12/31';

-- 21. 12.45, -12.45 ���� ũ�ų� ���� ���� �� ���� ���� ���� ����ϴ� SQL ���� ���� �ۼ��Ͻÿ�.
