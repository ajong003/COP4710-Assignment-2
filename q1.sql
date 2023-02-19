--List the location(s) of the department where the employee with 'Michael' as a dependent, works for. -- [q1.sql]

SELECT dlocation
from dept_locations
WHERE dnumber = 
    ( SELECT dno
     from employee, dependent
     WHERE employee.ssn = dependent.essn
     AND dependent.dependent_name = "Michael"
    )