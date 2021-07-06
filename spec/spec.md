Specifications for the Sinatra Assessment

Specs:

 X Use Sinatra to build the app
    I have used Sinatra to build my app.

 X Use ActiveRecord for storing information in a database
    I have used ActiveRecord to store information in my database.

 X Include more than one model class (e.g. User, Post, Category)
    I have two model classes, User and Items.

 X Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    My User has_many Items.

 X Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Items belong_to a User.

 X Include user accounts with unique login attribute (username or email)
    User accounts are identified by their email.

 X Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Users can add items, access ones they've created, modify existing items and delete them.

 X Ensure that users can't modify content created by other users
    There is logic in the ItemsController routes to verify that the current user is the owner of the item being accessed.

 X Include user input validations
    It is not possible to create a user or item if the fields are empty.

 BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
 
 Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm:

 X You have a large number of small Git commits
    I am committing very frequently.

 X Your commit messages are meaningful
    They describe the change made in 50 characters or less.

 X You made the changes in a commit that relate to the commit message
    My commits are small and targeted.

 X You don't include changes in a commit that aren't related to the commit message
    My commits are labeled in a way that says what they do.