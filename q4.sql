--List the last name of employees supervised by the manager of 'Headquarters' department. and the number of subordinates for each of these employees. -- [q4.sql]

SELECT  a.lname AS LNAME, COUNT(*) AS Subordinates
FROM employee a, employee b
WHERE a.superssn = 
	(SELECT mgrssn
     FROM department
     WHERE dname = "Headquarters")
AND
	a.ssn = b.superssn
     		
GROUP BY a.lname