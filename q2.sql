--List the last name of the manager for the project 'Computerization' along with the number of work assignments for this project. -- [q2.sql]

--variation 1
select employee.lname as LNAME, count(*) as Projects
FROM employee, works_on
WHERE employee.ssn = 
		-- link pname computerization to manager via department
		( SELECT department.mgrssn
         FROM department, project
         WHERE project.pname="Computerization"
         		AND	
         		project.dnum = department.dnumber
         )
AND
       works_on.pno =   
       (SELECT project.pnumber
        FROM project
        WHERE project.pname = "Computerization" 
        )
        	
GROUP BY employee.lname


--variation 2
select employee.lname as LNAME, count(*) as Projects
FROM employee, works_on
WHERE employee.ssn = 
		-- link pname computerization to manager via department
		( SELECT department.mgrssn
         FROM department, project
         WHERE project.pname="Computerization"
         		AND	
         		project.dnum = department.dnumber
         		AND	
         		works_on.pno = project.pnumber
         )
        	
GROUP BY employee.lname


--variation 3
select employee.lname as lNAME, count(*) as Projects
FROM employee, works_on
WHERE EXISTS
		-- link pname computerization to manager via department
		( SELECT *
         FROM department, project
         WHERE project.pname="Computerization"
         		AND	
         		project.dnum = department.dnumber
         		AND	
         		works_on.pno = project.pnumber
         		and employee.ssn = department.mgrssn
         )
GROUP BY employee.lname