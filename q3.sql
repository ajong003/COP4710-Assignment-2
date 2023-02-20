-- List the name of project(s) managed by the 'Research' department with the total number of work hours assigned to each of these projects. -- [q3.sql]

SELECT project.pname, sum(works_on.hours)   -- sums hours
FROM project, works_on
WHERE project.dnum IN      -- finds all projects with dnumber from "research" 
	(SELECT department.dnumber
     FROM department
		WHERE department.dname = "Research"
    		)
AND project.pnumber=works_on.pno  -- match works_on pno with the pno from project
GROUP BY project.pname  -- group by each pname 