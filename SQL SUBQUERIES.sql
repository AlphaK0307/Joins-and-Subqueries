--Question1--
select first_name, last_name, district 
from customer 
join address 
on customer.address_id = address.address_id
where address.district = 'Texas'

--Question2--
select amount, first_name, last_name
from payment
right join customer
on payment.customer_id = payment.customer_id
where amount > 6.99


--Question3--
select first_name, last_name
from customer
where customer.customer_id in (
	select customer_id from payment 
	where amount > 175
)


--Question4--



--Question5 Which film category has the most movies in it?--

select film_id from film_category
where film_id in (
	select film_id from film_actor 
	group by film_id 
	order by count(film_id) 
	limit 1
)

--Question6. What film had the most actors in it?--

select title from film
where film_id in (
	select film_id from film_actor 
	group by film_id 
	order by count(actor_id) 
	limit 1
)


--Question7 Which actor has been in the least movies?--

select count(film_actor.actor_id), film_actor.actor_id
from film_actor
join film
on film.film_id = film_actor.film_id
group by actor_id
order by count;





--Question8 Which country has the most cities?--

select country, count(district)
from address
join customer
on customer.address_id = address.address_id
group by address.district
having count(address.district) > 5








