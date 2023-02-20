-- List the location(s) of the department where the employee with 'Michael' as a dependent, works for. -- [q1.sql]

SELECT dlocation
from dept_locations
WHERE dnumber =                                            -- dnumber must be the same as the dnumber from the subquery (subquery returns 1 result so "any" or "In" is not needed) 

    ( SELECT dno											-- finds the dno from the employee that has "Michael" as a dependent
     from employee, dependent                              -- cartesian product
     WHERE employee.ssn = dependent.essn                    -- join condition 
     AND dependent.dependent_name = "Michael"
    )