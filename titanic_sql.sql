create database titanic_project;
use titanic_project;
select *
from titanic;

-- 1. show the first 10 rowa of the dataset
select *
from titanic
limit 10;


-- 2.find the number of dataset who survived;.

select count(Survived) as total_survived
from titanic
where Survived > 0;

-- 3. find the number of passengers in each class.

select Pclass,count(*) as total_passenger
from titanic
group by Pclass;

-- 4. find the average age of all passengers

select floor(avg(Age)) as "average_age"
from titanic;


-- 5. find the first 10 rows of the dataset sorted by passenger class in descending order.

select *
from titanic
order by Pclass desc limit 10;

-- 6. find the number of passengers in each class sorted by class in assending order.

select Pclass,count(*) as total_passenger
from titanic
group by Pclass
order by Pclass asc;

-- 7. find the average fare paid by passengers in each class.
select *
from titanic;

select Pclass, round(avg(fare),2) as average_fare
from titanic
group by Pclass
order by Pclass asc;

-- 8. find the name of the passenger with the highest fare.
  select *
from titanic;

select 
Name,Fare
from titanic
order by Fare desc limit 1;

select Name, max(Fare)
from titanic
where Fare = (select max(Fare) from titanic )
order by name desc limit 1;


-- 9. find the name of the passenger who had the highest age among the survivors.

-- 1. solution
select 
Name,
Age
from titanic
where Survived > 0 
order by Age desc limit 1;
 
 -- 2. solution
select Name, Age
from titanic 
where Age = (select max(Age) from titanic where Survived > 0);


-- 10. find the number of the passenger who paid more than the avg fare.

select *
from titanic;

select
count(*) as num_pass
from Titanic 
where fare > (select avg(Fare) from Titanic);


-- 11. Find the name of the passenger who had the most parents or children on board.

select
 name,
Parch 
from titanic
where parch = (select max(Parch) from titanic);

-- 12. find the number of male and female passengers who survived, and order the results by sex in ascending order.

select
sex,
count(*) as num_survived
from titanic 
where survived > 0
group by sex
order by sex ;

-- 13. Find the Name, Age, and fare of the oldest passenger who survived.

select
Name,
Age,
Fare
from titanic 
where Age = (select max(Age) from titanic where survived = 1); 
 
-- 14. Find the name and age of the youngest female passenger who survived in third class.

select
name,
Age
from titanic 
where (sex = "female" and pclass = 3) and survived = 1 and Age = (select min(age) from titanic where (sex = "female" and pclass = 3) and survived = 1);

-- 15. find the number of male and female passenger.

-- 1.solution
select
sex,
count(*) as num_passenger
from titanic 
group by sex;

-- 2.solution
select
sum(case when sex = 'male' then 1 else 0 end) as male_num,
sum(case when sex = 'female' then 1 else 0 end) as female_num
from titanic;

-- 16. Select all passenger who traveled in a cabin that was not shared by other passenger.

select 
*
from titanic
where Cabin not in (select Cabin from titanic group by Cabin having count(*) > 1);


