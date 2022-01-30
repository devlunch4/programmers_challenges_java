/* 고양이와 개는 몇 마리 있을까 */
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
--동물 보호소에 들어온 동물 중 고양이와 개가 각각 몇 마리인지 조회하는 SQL문을 작성해주세요. 이때 고양이를 개보다 먼저 조회해주세요.
--
--예시
--예를 들어 ANIMAL_INS 테이블이 다음과 같다면
--
--ANIMAL_ID	ANIMAL_TYPE	DATETIME	INTAKE_CONDITION	NAME	SEX_UPON_INTAKE
--A373219	Cat	2014-07-29 11:43:00	Normal	Ella	Spayed Female
--A377750	Dog	2017-10-25 17:17:00	Normal	Lucy	Spayed Female
--A354540	Cat	2014-12-11 11:48:00	Normal	Tux	Neutered Male
--고양이는 2마리, 개는 1마리 들어왔습니다. 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.
--
--ANIMAL_TYPE	count
--Cat	2
--Dog	1

--ANSWER MySQL
SELECT ANIMAL_TYPE,
       COUNT(*) COUNT
FROM   ANIMAL_INS
GROUP  BY ANIMAL_TYPE
ORDER  BY ANIMAL_TYPE;

--ANSWER Oracle
SELECT ANIMAL_TYPE,
       COUNT(*) COUNT
FROM   ANIMAL_INS
GROUP  BY ANIMAL_TYPE
ORDER  BY ANIMAL_TYPE;


/* 동명 동물 수 찾기 */
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
--동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요. 이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.
--
--예시
--예를 들어 ANIMAL_INS 테이블이 다음과 같다면
--
--ANIMAL_ID	ANIMAL_TYPE	DATETIME	INTAKE_CONDITION	NAME	SEX_UPON_INTAKE
--A396810	Dog	2016-08-22 16:13:00	Injured	Raven	Spayed Female
--A377750	Dog	2017-10-25 17:17:00	Normal	Lucy	Spayed Female
--A355688	Dog	2014-01-26 13:48:00	Normal	Shadow	Neutered Male
--A399421	Dog	2015-08-25 14:08:00	Normal	Lucy	Spayed Female
--A400680	Dog	2017-06-17 13:29:00	Normal	Lucy	Spayed Female
--A410668	Cat	2015-11-19 13:41:00	Normal	Raven	Spayed Female
--Raven 이름은 2번 쓰였습니다.
--Lucy 이름은 3번 쓰였습니다
--Shadow 이름은 1번 쓰였습니다.
--따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.
--
--NAME	COUNT
--Lucy	3
--Raven	2

--ANSWER MySQL
SELECT NAME, COUNT(NAME) COUNT
FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) > 1
ORDER BY NAME;

--ANSWER Oracle
SELECT NAME, COUNT(NAME) COUNT
FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) > 1
ORDER BY NAME;


/* 입양 시각 구하기(1) */
--문제 설명
--ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블입니다. ANIMAL_OUTS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME는 각각 동물의 아이디, 생물 종, 입양일, 이름, 성별 및 중성화 여부를 나타냅니다.
--
--NAME	TYPE	NULLABLE
--ANIMAL_ID	VARCHAR(N)	FALSE
--ANIMAL_TYPE	VARCHAR(N)	FALSE
--DATETIME	DATETIME	FALSE
--NAME	VARCHAR(N)	TRUE
--SEX_UPON_OUTCOME	VARCHAR(N)	FALSE
--보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 09:00부터 19:59까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 이때 결과는 시간대 순으로 정렬해야 합니다.
--
--예시
--SQL문을 실행하면 다음과 같이 나와야 합니다.
--
--HOUR	COUNT
--9	1
--10	2
--11	13
--12	10
--13	14
--14	9
--15	7
--16	10
--17	12
--18	16
--19	2

--ANSWER MySQL
SELECT HOUR(DATETIME)  HOUR,
       COUNT(DATETIME) COUNT
FROM   ANIMAL_OUTS
WHERE  HOUR(DATETIME) BETWEEN 9 AND 19
GROUP  BY HOUR(DATETIME)
ORDER  BY HOUR(DATETIME);


--ANSWER Oracle
SELECT TO_CHAR(DATETIME, 'HH24') HOUR,
       COUNT(DATETIME)           COUNT
FROM   ANIMAL_OUTS
WHERE  TO_CHAR(DATETIME, 'HH24') BETWEEN 9 AND 19
GROUP  BY TO_CHAR(DATETIME, 'HH24')
ORDER  BY TO_CHAR(DATETIME, 'HH24');


/* 입양 시각 구하기(2) */
--문제 설명
--ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블입니다. ANIMAL_OUTS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME는 각각 동물의 아이디, 생물 종, 입양일, 이름, 성별 및 중성화 여부를 나타냅니다.
--
--NAME	TYPE	NULLABLE
--ANIMAL_ID	VARCHAR(N)	FALSE
--ANIMAL_TYPE	VARCHAR(N)	FALSE
--DATETIME	DATETIME	FALSE
--NAME	VARCHAR(N)	TRUE
--SEX_UPON_OUTCOME	VARCHAR(N)	FALSE
--보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 이때 결과는 시간대 순으로 정렬해야 합니다.
--
--예시
--SQL문을 실행하면 다음과 같이 나와야 합니다.
--
--HOUR	COUNT
--0	0
--1	0
--2	0
--3	0
--4	0
--5	0
--6	0
--7	3
--8	1
--9	1
--10	2
--11	13
--12	10
--13	14
--14	9
--15	7
--16	10
--17	12
--18	16
--19	2
--20	0
--21	0
--22	0
--23	0

--ANSWER MySQL
SET @HOUR_LIST = -1;

SELECT ( @HOUR_LIST := @HOUR_LIST + 1 )     AS HOUR,
       (SELECT COUNT(*)
        FROM   ANIMAL_OUTS
        WHERE  HOUR(DATETIME) = @HOUR_LIST) AS COUNT
FROM   ANIMAL_OUTS
WHERE  @HOUR_LIST < 23
ORDER  BY HOUR;

--ANSWER Oracle
SELECT A.HOUR,
       COUNT(B.DATETIME) AS COUNT
FROM   (SELECT LEVEL - 1 AS HOUR
        FROM   DUAL
        CONNECT BY LEVEL <= 24) A
       LEFT JOIN ANIMAL_OUTS B
              ON A.HOUR = TO_CHAR(B.DATETIME, 'HH24')
GROUP  BY A.HOUR
ORDER  BY A.HOUR;