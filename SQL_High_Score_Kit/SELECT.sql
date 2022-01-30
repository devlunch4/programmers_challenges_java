/* 모든 레코드 조회하기 */
--문제 설명
--ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. ANIMAL_INS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.
--
--NAME	TYPE	NULLABLE
--ANIMAL_ID	VARCHAR(N)	FALSE
--ANIMAL_TYPE	VARCHAR(N)	FALSE
--DATETIME	DATETIME	FALSE
--INTAKE_CONDITION	VARCHAR(N)	FALSE
--NAME	VARCHAR(N)	TRUE
--SEX_UPON_INTAKE	VARCHAR(N)	FALSE
--동물 보호소에 들어온 모든 동물의 정보를 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요. SQL을 실행하면 다음과 같이 출력되어야 합니다.
--
--ANIMAL_ID	ANIMAL_TYPE	DATETIME	INTAKE_CONDITION	NAME	SEX_UPON_INTAKE
--A349996	Cat	2018-01-22 14:32:00	Normal	Sugar	Neutered Male
--A350276	Cat	2017-08-13 13:50:00	Normal	Jewel	Spayed Female
--A350375	Cat	2017-03-06 15:01:00	Normal	Meo	Neutered Male
--A352555	Dog	2014-08-08 04:20:00	Normal	Harley	Spayed Female
--..이하 생략

--ANSWER MySQL
SELECT *
FROM   animal_ins
ORDER  BY animal_id;

--ANSWER Oracle
SELECT *
FROM   animal_ins
ORDER  BY animal_id;


/* 역순 정렬하기 */
--문제 설명
--ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. ANIMAL_INS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.
--
--NAME	TYPE	NULLABLE
--ANIMAL_ID	VARCHAR(N)	FALSE
--ANIMAL_TYPE	VARCHAR(N)	FALSE
--DATETIME	DATETIME	FALSE
--INTAKE_CONDITION	VARCHAR(N)	FALSE
--NAME	VARCHAR(N)	TRUE
--SEX_UPON_INTAKE	VARCHAR(N)	FALSE
--동물 보호소에 들어온 모든 동물의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 이때 결과는 ANIMAL_ID 역순으로 보여주세요. SQL을 실행하면 다음과 같이 출력되어야 합니다.
--
--NAME	DATETIME
--Rocky	2016-06-07 09:17:00
--Shelly	2015-01-29 15:01:00
--Benji	2016-04-19 13:28:00
--Jackie	2016-01-03 16:25:00
--*Sam	2016-03-13 11:17:00
--..이하 생략

--ANSWER MySQL
SELECT NAME,
       datetime
FROM   animal_ins
ORDER  BY animal_id DESC;

--ANSWER Oracle
SELECT NAME,
       datetime
FROM   animal_ins
ORDER  BY animal_id DESC;


/* 아픈 동물 찾기 */
--문제 설명
--ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. ANIMAL_INS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.
--
--NAME	TYPE	NULLABLE
--ANIMAL_ID	VARCHAR(N)	FALSE
--ANIMAL_TYPE	VARCHAR(N)	FALSE
--DATETIME	DATETIME	FALSE
--INTAKE_CONDITION	VARCHAR(N)	FALSE
--NAME	VARCHAR(N)	TRUE
--SEX_UPON_INTAKE	VARCHAR(N)	FALSE
--동물 보호소에 들어온 동물 중 아픈 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 이때 결과는 아이디 순으로 조회해주세요.
--
--예시
--예를 들어 ANIMAL_INS 테이블이 다음과 같다면
--
--ANIMAL_ID	ANIMAL_TYPE	DATETIME	INTAKE_CONDITION	NAME	SEX_UPON_INTAKE
--A365172	Dog	2014-08-26 12:53:00	Normal	Diablo	Neutered Male
--A367012	Dog	2015-09-16 09:06:00	Sick	Miller	Neutered Male
--A365302	Dog	2017-01-08 16:34:00	Aged	Minnie	Spayed Female
--A381217	Dog	2017-07-08 09:41:00	Sick	Cherokee	Neutered Male
--이 중 아픈 동물은 Miller와 Cherokee입니다. 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.
--
--ANIMAL_ID	NAME
--A367012	Miller
--A381217	Cherokee

--ANSWER MySQL
SELECT animal_id,
       name
FROM   animal_ins
WHERE  intake_condition = 'Sick'
ORDER  BY animal_id;

--ANSWER Oracle
SELECT animal_id,
       name
FROM   animal_ins
WHERE  intake_condition = 'Sick'
ORDER  BY animal_id;



/* 어린 동물 찾기 */
--문제 설명
--ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. ANIMAL_INS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.
--
--NAME	TYPE	NULLABLE
--ANIMAL_ID	VARCHAR(N)	FALSE
--ANIMAL_TYPE	VARCHAR(N)	FALSE
--DATETIME	DATETIME	FALSE
--INTAKE_CONDITION	VARCHAR(N)	FALSE
--NAME	VARCHAR(N)	TRUE
--SEX_UPON_INTAKE	VARCHAR(N)	FALSE
--동물 보호소에 들어온 동물 중 젊은 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 이때 결과는 아이디 순으로 조회해주세요.
--
--예시
--예를 들어 ANIMAL_INS 테이블이 다음과 같다면
--
--ANIMAL_ID	ANIMAL_TYPE	DATETIME	INTAKE_CONDITION	NAME	SEX_UPON_INTAKE
--A365172	Dog	2014-08-26 12:53:00	Normal	Diablo	Neutered Male
--A367012	Dog	2015-09-16 09:06:00	Sick	Miller	Neutered Male
--A365302	Dog	2017-01-08 16:34:00	Aged	Minnie	Spayed Female
--A381217	Dog	2017-07-08 09:41:00	Sick	Cherokee	Neutered Male
--이 중 젊은 동물은 Diablo, Miller, Cherokee입니다. 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.
--
--ANIMAL_ID	NAME
--A365172	Diablo
--A367012	Miller
--A381217	Cherokee

--ANSWER MySQL
SELECT animal_id, name
FROM animal_ins
WHERE intake_condition
NOT LIKE 'Aged'
ORDER BY animal_id

--ANSWER Oracle
SELECT animal_id, name
FROM animal_ins
WHERE intake_condition
NOT LIKE 'Aged'
ORDER BY animal_id


/* 동물의 아이디와 이름 */
--문제 설명
--ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. ANIMAL_INS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.
--
--NAME	TYPE	NULLABLE
--ANIMAL_ID	VARCHAR(N)	FALSE
--ANIMAL_TYPE	VARCHAR(N)	FALSE
--DATETIME	DATETIME	FALSE
--INTAKE_CONDITION	VARCHAR(N)	FALSE
--NAME	VARCHAR(N)	TRUE
--SEX_UPON_INTAKE	VARCHAR(N)	FALSE
--동물 보호소에 들어온 모든 동물의 아이디와 이름을 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요. SQL을 실행하면 다음과 같이 출력되어야 합니다.
--
--ANIMAL_ID	NAME
--A349996	Sugar
--A350276	Jewel
--A350375	Meo
--A352555	Harley
--A352713	Gia
--A352872	Peanutbutter
--A353259	Bj
--((이하 생략))

--ANSWER MySQL
SELECT animal_id,
       name
FROM   animal_ins
ORDER  BY animal_id;

--ANSWER Oracle
SELECT animal_id,
       name
FROM   animal_ins
ORDER  BY animal_id;