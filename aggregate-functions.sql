-- SQLBook: Code
#order of execution 
# from -> where -> groupby -> having -> select -> distinct -> orderby -> limit
-- SQLBook: Code
SELECT count(*) as total_employees FROM employees
-- SQLBook: Code
select COUNT(1) as total_emp from employees
-- SQLBook: Code
select count(manager_id) as total_managers from employees
-- SQLBook: Code
select sum(salary) as total_Salary from employees
-- SQLBook: Code
select avg(salary) as total_Salary from employees
-- SQLBook: Code
SELECT 
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees;
-- SQLBook: Code
