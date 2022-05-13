use sakila;
select * from actor where first_name like 'Scarlett';

select * from actor where last_name like 'Johansson';

select * from actor where first_name like '%o%';

select * from actor where first_name like '%o%' and last_name like '%a%';

select * from actor where first_name like '__b';

select * from city where city like 'a%';

select * from city where country like 'Spain';

select * from  film where length > 80 and length < 100;

select * from film where char_length(title) > 12;

select * from film where rating like 'PG' or rating like 'G';

select * from film where rating != 'NG-17';

select count(first_name) from actor;

select count(city) from city where country_id = 87;

select count(country) from country where country like 'a%';

select avg(length) from film where rating like 'PG';

select * from film where length = (select max(length) from film);

select * from film having min(length);