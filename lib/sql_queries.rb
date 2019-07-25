

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
"select projects.title, sum(pledges.amount)
from pledges 
inner join projects on projects.id = pledges.project_id
group by pledges.project_id
order by projects.title
"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
"select users.name, users.age,  sum(pledges.amount)
from pledges
inner join users 
on users.id = pledges.user_id
group by users.name
order by users.name "
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"select projects.title, sum(pledges.amount) - projects.funding_goal as amount
from pledges
join projects
on projects.id = pledges.project_id
group by projects.title having sum(pledges.amount) - projects.funding_goal >= 0
"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
"select users.name, sum(pledges.amount)
from pledges
inner join users 
on users.id = pledges.user_id
group by users.name
order by sum(pledges.amount)"
end

# Write your sql queries in this file in the appropriate method like the example below:
#
# users (id, name, age) 
# projects (id, title, category, funding_goal, start_date, end_date)  
# pledges (id, amount, user_id, project_id)
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.
# group by projects.category
# having projects.category 

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"select projects.category, pledges.amount
from pledges
join projects
on projects.id = pledges.project_id 
where projects.category = 'music'
"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
"select projects.category, sum(pledges.amount)
from pledges
join projects
on projects.id = pledges.project_id
where projects.category = 'books'"
end
