use sakila; 

#1. List the number of films per category.

select * from film_category;
select * from category;
select * from film; 
#common key = film_id & category_id 

select count(f.film_id) as number_film, c.name
from film f 
join film_category fc 
on f.film_id = fc.film_id
join category c
on c.category_id = fc.category_id
group by c.name 
order by number_film desc;

#2. Display the first and the last names, as well as the address, of each staff member.
select * from staff ;
select * from address ;
#common key = address_id

select s.staff_id, s.first_name, s.last_name, a.address
from staff s
join address a on s.address_id = a.address_id
group by s.staff_id;

#3. Display the total amount rung up by each staff member in August 2005  
select * from payment;
select * from staff;
#common key = staff_id 

select count(p.amount) as total_amount, s.last_name, s.first_name 
from staff s
join payment p on s.staff_id = p.staff_id
where month(payment_date)=8 and year(payment_date) = 2005
group by s.last_name, s.first_name;

#4. List all films and the number of actors who are listed for each film.
select * from film_actor ;
select * from film;
#common key = film_id

select f.title, count(fc.actor_id) as number_actor
from film f
join film_actor fc on fc.film_id = f.film_id
group by f.title;

#5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
#List the customers alphabetically by their last names.
select * from payment ;
select * from customer;
#common key = customer_id 

select count(p.amount) as total_amount, c.last_name, c.first_name  
from payment p 
join customer c on c.customer_id = p.customer_id
group by c.last_name, c.first_name 
order by c.last_name ;




