#combine columns from multiple tables - join
#result of one query to act as input to another - subquery
#u want to check existence - exists
# u want to filter against a list of values from another table - in

select * from employees 
where salary > (select AVG(salary) as avg_salary
from employees)

#this returns all emp tied with highest salaries
select employee_name as emp_name from employees
where salary = (
    SELECT MAX(salary) as highest_salary
    from employees
)

#return only one emp
select employee_name as emp_name from employees
ORDER BY salary desc 
limit 1

select employee_name as emp_name from employees
where department in (
    select department
    from employees
    where employee_name='Aarav Sharma'
)

select employee_name as emp_name 
from employees
where salary > ALL (
    select salary 
    from employees
    where department='Support'
)

select * 
FROM employees
where department in (
    select department
    from employees
    where employment_status='On Leave'
)

select e.employee_name, b.bonus_amount
from employees e
inner join bonuses b on e.employee_id=b.employee_id

SELECT * from employees
where employee_id in(
    select DISTINCT employee_id
    from bonuses
)

select e.employee_name, b.bonus_amount
from employees e
left join bonuses b 
on e.employee_id=b.employee_id
where exists (
    select 1
    from bonuses b
    where b.employee_id=e.employee_id
)

select e.employee_name,b.bonus_amount
from employees e
left join bonuses b 
on e.employee_id=b.employee_id
where b.bonus_amount is NULL

SELECT e.employee_name, b.bonus_id
FROM employees e
LEFT JOIN bonuses b ON e.employee_id = b.employee_id
WHERE b.bonus_id IS NULL;

select * from employees e
where not EXISTS(
    select 1
    from bonuses b
    where b.employee_id=e.employee_id
)

select *
from employees e1
where salary > ALL(
    select AVG(salary) as avg_salary
    from employees e2
    GROUP BY department
)
#above for salary>[]

select * from employees

##Find employees whose salary is greater than the average salary of their own department 
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary) AS average_salary
    FROM employees e1
    WHERE e1.department = e.department  -- reference to outer query
);

##improved version grouping by dept
select 
    department,
    COUNT(*) AS employees_above_avg,
    GROUP_CONCAT(employee_name SEPARATOR ', ') AS employee_names
from employees e1
where salary>(
    select AVG(salary) as avg_salary
    from employees e2
    where e2.department=e1.department
)
GROUP BY department


## employees who are assigned to at least one project
select e.employee_name , ep.project_id
from employees e 
inner join employee_projects ep on e.employee_id=ep.employee_id
# here if an employee has two or more project all are listed for eg aarav sharma

# but if u want to know that the project just exists use exists
select * from employees e
where EXISTS (
    select 1
    from employee_projects ep
    where ep.employee_id=e.employee_id
)

#more detailed version of above queries
#It finds each employee, counts how many projects 
#they have, and returns only employees who have more
# than 1 project.
select e.employee_name ,COUNT(ep.project_id) as projects_no
from employees e
left join employee_projects ep ON e.employee_id=ep.employee_id
GROUP BY e.employee_id
having COUNT(ep.project_id)>0

#employees who earn more than their manager
#sol 1
select * from employees e
inner join employees m on e.manager_id=m.employee_id
where e.salary>m.salary

#sol 2
select * from employees e
where salary>(
    select m.salary
    from employees m
    where m.employee_id=e.manager_id
)

#from -> where -> groupby -> having -> select -> orderby -> limit