# My-Auth App

## Introduction

This is a app that I'm using to learn Ruby on Rails.  
My intent with this app is to build a base app to use in future projects. Some 
buttons are in Portuguese (pt-BR). I want to translate all the messages, but this 
is still not working

## What does it has?

Im using a very basic configuration that can allow the app to be flexible
for future projects. I'm using some premisses and tools as follow:

+ **User model**: This app has only one model (not quite right) that is called User.
This model has no additional attributes, just the ones created by Devise.

+ **User pages**: That is only a home page for the user - nothing on it - and a 
settings page where the user is able to change his password.

+ **[HAML] [1]**: I'm using HAML (HTML Abrstraction Markup Language) for the views. 
I think HAML is awesome and it has increased my productivity!

+ **[Twitter Boostrap] [4]**: I'm using raw Twitter Bootstrap for styling. I didn't 
make any modifications to the original. 

+ **[Devise] [2]**: I'm using it for the authentication process. The configuration
I'm using is very basic, it requires User to be logged to access all pages but
the home page of the app.

+ **[CanCan] [3]**: I'm using CanCan for the authorization process. Also very basic
configuration. It only allows the User to see his pages and allows User to update
their information.

+ **[RailsAdmin] [5]**: I'm using RailsAdmin for the management of all resources. 
It has pre-built views and methods and saved me a lot of time. I chosed Rails Admin 
because Piggybak is built on top of it

+ **[Piggybak] [8]**: I chose Piggybak before read some comments on StackOverflow. 
Not sure yet if it is the best option. I prefer it over Spree because I wanted 
something cleaner. One downside of it is the lack of documentation and that it's 
not ready for bootstrap!

+ **[morris.js] [6]**: This was the best solution to generate simple charts that I 
found. I'm using it currently for the ActiveAdmin session, because that is no need 
of it in this app.

**RDocs**  
The Rdocs are [here] [7]

## Help Me

As I said before, I'm new to this framework and this app is very succectible to 
security flaws, once I made use of lots of gems to do the hard work for me.  
That said, please send me suggestions on how to improve my app and my coding style.  
  
Many thanks!

[1]: haml.info/ "HAML"
[2]: https://github.com/plataformatec/devise "Devise"
[3]: https://github.com/ryanb/cancan "CanCan"
[4]: twitter.github.com/bootstrap/ "Bootstrap"
[5]: https://github.com/sferik/rails_admin "RailsAdmin"
[6]: http://www.oesmith.co.uk/morris.js "morris.js"
[7]: http://rubydoc.info/github/viniciusspader/my-auth/master/frames "Rdocs"
[8]: http://www.piggybak.org/ "Piggybak"