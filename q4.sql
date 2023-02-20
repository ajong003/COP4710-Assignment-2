-- List the last name of employees supervised by the manager of 'Headquarters' department. and the number of subordinates for each of these employees. -- [q4.sql]

SELECT  a.lname AS LNAME, COUNT(*) AS Subordinates
FROM employee a, employee b
WHERE a.superssn =   -- employee must be supervised by mgrssn from subquery 
	(SELECT mgrssn
     FROM department
     WHERE dname = "Headquarters")  -- finds the ssn of the "Headquarters" manager
AND
	a.ssn = b.superssn  -- only keep subordinates 
     		
GROUP BY a.lname