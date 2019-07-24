# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
    sql = <<-SQL
        SELECT projects.title, SUM(pledges.amount) FROM projects JOIN pledges ON pledges.project_id = projects.id GROUP BY projects.title;
    SQL

end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
    "SELECT users.name, users.age, SUM(pledges.amount) FROM users JOIN pledges ON pledges.user_id = users.id GROUP BY users.name;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
    sql = <<-SQL
        SELECT projects.title, (SUM(pledges.amount) - projects.funding_goal) 
        FROM projects 
        JOIN pledges 
        ON pledges.project_id = projects.id 
        GROUP BY projects.title 
        HAVING projects.funding_goal <= SUM(pledges.amount);
    SQL
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
    sql = <<-SQL
        SELECT users.name, SUM(pledges.amount)
        FROM users
        JOIN pledges
        ON pledges.user_id = users.id
        GROUP BY users.name
        ORDER BY SUM(pledges.amount);
    SQL
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
    sql = <<-SQL
        SELECT projects.category, pledges.amount FROM projects JOIN pledges ON pledges.project_id = projects.id WHERE projects.category = "music";
    SQL
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
    sql = <<-SQL
        SELECT projects.category, SUM(pledges.amount) FROM projects JOIN pledges ON pledges.project_id = projects.id WHERE projects.category = "books"
    SQL
end
