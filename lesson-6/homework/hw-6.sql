1. 
1st Way:

SELECT DISTINCT col1, col2 
FROM InputTbl 
ORDER BY col1, col2;  

2nd:

SELECT col1, col2 
FROM InputTbl 
GROUP BY col1, col2 
ORDER BY col1, col2;

2. 

SELECT A, B, C, D
FROM TestMultipleZero
WHERE A + B + C + D > 0
ORDER BY A, B, C, D;  

3.

SELECT id, name
FROM section1
WHERE id % 2 = 1
ORDER BY id;

4. 

SELECT id, name
FROM section1
WHERE id = (SELECT MIN(id) FROM section1)
ORDER BY id;

5.

SELECT id, name
FROM section1
WHERE id = (SELECT MAX(id) FROM section1)
ORDER BY id;  

6.

SELECT id, name
FROM section1
WHERE name LIKE 'B%'
ORDER BY id;

7. 

SELECT Code
FROM ProductCodes
WHERE LOCATE('_', Code) > 0
ORDER BY Code;
