# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.

p1 = Salesperson.new
#p1["first_name"] = "Bob"
p1.first_name = "Ben"
p1.last_name = "Block"
p1.email = "a@a.com"
p1.save

p2 = Salesperson.new
p2.first_name = "Brian"
p2.last_name = "Eng"
p2.email = "b@b.com"
p2.save

#puts p1.inspect, p2.inspect

# 3. write code to display how many salespeople rows are in the database

# ---------------------------------
# Salespeople: 2

puts "Salespeople: #{Salesperson.all.count}"

# 4. modify/update column data for a row in the salespeople table.

a = Salesperson.find_by({"first_name" => "Ben", "last_name" => "Block"})
a.email = "benjamin.block@kellogg.northwestern.edu"
a.save
puts a.inspect

# CHALLENGE:
# 5. write code to display each salesperson's full name

# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng

puts "------------"
puts "Salespeople: #{Salesperson.all.count}"

#puts Salesperson.where({}).inspect

# Name this to be more readable. Also Salesperson.all can be replaced with Salesperson.where({}) as a proxy for SELECT * with no WHERE clause.
all_salespeople = Salesperson.all
puts all_salespeople.inspect

for person in all_salespeople do
    first_name = person["first_name"]
    last_name = person["last_name"]
    email = person["email"]

    puts " #{first_name} #{last_name} #{email}" 
    #puts "#{person["first_name"]} #{person["last_name"]}"
end
