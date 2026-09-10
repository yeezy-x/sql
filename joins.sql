select e.employee_name, b.bonus_amount, b.bonus_date 
from employees e
inner join bonuses b
on e.employee_id = b.employee_id

select e.employee_name , ep.role, ep.project_id, p.project_name
from employees e
inner join employee_projects ep on e.employee_id = ep.employee_id
inner join projects p on ep.project_id = p.project_id

select e.employee_name as employeeName, b.bonus_amount as bonusAmount 
from employees e
inner join bonuses b on e.employee_id = b.employee_id
where b.bonus_amount>10000

select e.employee_name as employeeName, m.employee_name as managerName, e.employment_status
from employees e
inner join employees m on e.manager_id = m.employee_id
where e.employment_status='On Leave'

select e.employee_name as employeeName, b.bonus_amount, b.bonus_id as bonus_id
from employees e
left join bonuses b on e.employee_id = b.employee_id
where b.bonus_id is null

select 
from employees m
left join employees e on e.employee_id=m.manager_id


select * from employees;

select e.employee_name as emp_name, m.employee_name as manager_name
from employees m 
left join employees e
on m.employee_id = e.manager_id
where m.employee_id in(
    select distinct employee_id from employees where manager_id is NULL
)


select e.employee_name, COUNT(ep.project_id) as total_projects
from employees e
left join employee_projects ep
on e.employee_id=ep.employee_id
group by e.employee_id
having count(ep.project_id)>1

select e.employee_name, ep.project_id
from employees e
left join employee_projects ep on e.employee_id=ep.employee_id
where ep.project_id is NULL

SELECT p.project_id, p.project_name
FROM projects p
LEFT JOIN employee_projects ep ON p.project_id = ep.project_id
WHERE ep.project_id IS NULL;

SELECT c.client_name,COUNT(c.client_id) AS total_number_Orders
FROM clients c
LEFT JOIN orders_data o ON c.client_id = o.client_id
GROUP BY c.client_id;