# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end



# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
sql = <<-SQL 
SELECT title, SUM(pledges.amount)
FROM projects
INNER JOIN pledges
on projects.id = pledges.project_id
GROUP BY projects.title;
SQL
end
 
# Select hold everything we want to get back 
#from is going to be the first table we are retrieving info from 
#inner joing is going to be the second table we are getting information from 
## but the order of how you join tables does not matter as long as you keep order in the ON section 
## the ON is going to hold the foriegn key "what connects both tables" together. you do this with the users.id = pledged.user_id
def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
sql = <<-SQL
SELECT users.name, users.age, SUM(pledges.amount)
FROM pledges 
INNER JOIN users
on users.id = pledges.user_id
GROUP BY users.name;
SQL

end

# def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
#  "select projects.title, sum(pledges.amount) - projects.funding_goal as amount
#     from pledges
#     join projects
#     on projects.id = pledges.project_id
#     group by projects.title having sum(pledges.amount) - projects.funding_goal >= 0
#     "
#     end	
    

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
    sql = <<-SQL
SELECT projects.title, SUM(pledges.amount) - projects.funding_goal as amount
FROM projects
JOIN pledges
on projects.id = pledges.project_id
GROUP BY projects.title having sum(pledges.amount) - projects.funding_goal >= 0;
SQL

end

# as amount - is an aliace for tabels. it allows me to use my table named "pledges" and create an amount from that 

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
sql = <<-SQL
SELECT users.name, SUM(pledges.amount)
FROM pledges 
INNER JOIN users
on pledges.user_id = users.id
GROUP BY users.name
ORDER BY SUM(pledges.amount);
SQL
end

# the following uses WHERE to pull information from the column labeled "category" in the table 
# projects ,  and then uses the = to ask; if the column is = to 'music' then output that specific data 

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
sql = <<-SQL
SELECT projects.category, pledges.amount 
FROM projects 
INNER JOIN pledges
on projects.id = pledges.project_id
WHERE projects.category = "music";
SQL
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
sql = <<-SQL
SELECT projects.category, SUM(pledges.amount)
FROM projects
INNER JOIN pledges
on projects.id = pledges.project_id
WHERE projects.category = "books";

SQL
end
