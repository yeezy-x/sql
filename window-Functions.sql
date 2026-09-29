select * from employees

#order by their salary descending order
SELECT * from employees
ORDER BY salary DESC

#ranking each row based on salary descending order
select *, ROW_NUMBER() OVER(order by salary desc) as row_num 
from employees

select *, RANK() OVER(order by salary desc) as rankings
from employees

select *, RANK() OVER(PARTITION BY department ORDER BY salary desc) as dept_rank
from employees

select *, DENSE_RANK() OVER(PARTITION BY department ORDER BY salary desc) as dept_rank_2
from employees

select department from employees GROUP BY department

SELECT *,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS ranking
FROM employees;

select *,
LAG(salary) over(order by employee_id) as prev_salary,
lead(salary) over(order by employee_id) as next_salary
from employees

----
# Assign a unique row number to each employee based on salary
select *,
ROW_NUMBER() over(order by salary desc) as unique_rank
from employees

# Rank employees based on salary using RANK()
SELECT *,
    RANK() OVER(ORDER BY salary DESC) AS ranking
FROM employees;

# Rank employees based on salary using DENSE_RANK()
SELECT *,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS ranking
FROM employees;

SELECT *,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number_ranking,
    RANK()       OVER(ORDER BY salary DESC) AS rank_ranking,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_ranking
FROM employees;

select e.employee_name , e.salary
from employees e
order by salary desc
limit 1 offset 1

select emp.employee_name , emp.salary
from (
    select e.employee_name,e.salary,
    DENSE_RANK() over(order by salary desc) as ranking
    from employees e
) emp
where ranking=2

SELECT *,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS ranking
FROM employees
WHERE department IS NOT NULL;


SELECT *
FROM (
    SELECT *,
        DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS ranking
    FROM employees
    WHERE department IS NOT NULL
) t
WHERE ranking = 1;

WITH ranked AS (
    SELECT *,
        DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS ranking
    FROM employees
    WHERE department IS NOT NULL
)
SELECT *
FROM ranked
WHERE ranking = 1;

select emp.employee_name, emp.salary
from (
    select e.employee_name, e.salary,
    lag(salary) over(order BY e.employee_id) as prev_salary
    from employees e
) emp
where salary>prev_salary

select emp.employee_name, emp.salary
from (
    select e.employee_name, e.salary,
    lead(salary) over(order BY e.employee_id) as next_salary
    from employees e
) emp
where salary<next_salary

SELECT *,
    salary - LAG(salary) OVER(ORDER BY employee_id) AS salary_difference
FROM employees;

-- GROUP BY: collapses all rows — result has one row per department
SELECT department
FROM employees
GROUP BY department;

-- PARTITION BY: keeps all rows — every employee appears with their dept rank
SELECT *,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS ranking
FROM employees;

with ranked as (
    select *,
    rank() over(partition by department order by salary desc) as rankings
    from employees 
    where department is NOT NULL
)
select department, rankings, count(*) as total_emps
from ranked
group by department, rankings
having count(*)>1
order by rankings asc

SELECT *,
    SUM(salary) OVER(PARTITION BY department) AS total_salary_expense
FROM employees
where department is not null

SELECT *,
    SUM(salary) OVER(PARTITION BY department ORDER BY employee_id) AS running_total
FROM employees;
SELECT *
FROM (
    SELECT *,
        AVG(salary) OVER(PARTITION BY department) AS average_salary
    FROM employees
) t
WHERE salary > average_salary;
