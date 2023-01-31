# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contact

c1_fname = "Tim"
c1 = Contact.find_by({"first_name" => c1_fname})

c2_fname = "Craig"
c2 = Contact.find_by({"first_name" => c2_fname})

sp1_fname = "Brian"
sp1 = Salesperson.find_by({"first_name" => sp1_fname})

a = Activity.new
a.salesperson_id = sp1.id
a.contact_id = c1.id
a.notes = "Meet #{c1.first_name}."
a.save

a = Activity.new
a.salesperson_id = sp1.id
a.contact_id = c2.id
a.notes = "Meet #{c2.first_name}."
a.save

a = Activity.new
a.salesperson_id = sp1.id
a.contact_id = c1.id
a.notes = "Met #{c1.first_name} for the second time."
a.save

#puts Activity.all.inspect

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

puts "Activities between #{sp1.first_name} and #{c1.first_name} #{c1.last_name}:"

activities = Activity.where({"salesperson_id"=>sp1.id, "contact_id"=>c1})

for a in activities
    puts "- #{a["notes"]}"
end

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
