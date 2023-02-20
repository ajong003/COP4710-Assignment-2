-- List the last name of the manager for the project 'Computerization' along with the number of work assignments for this project. -- [q2.sql]

select employee.lname as LNAME, count(*) as Projects   -- select with column rename
FROM employee, works_on  -- product
WHERE employee.ssn = 
		-- link pname computerization to manager via department
		( SELECT department.mgrssn
         FROM department, project  -- product 
         WHERE project.pname="Computerization"
         		AND	
         		project.dnum = department.dnumber     -- find the department from "Computerization" 
        		 AND	
         		works_on.pno = project.pnumber        -- only include rows in final result where project number = project number from project name "Computerization" 
         		
         )
        	
GROUP BY employee.lname  -- group rows by Last name