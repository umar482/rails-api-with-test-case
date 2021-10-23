# README

To run this app on your local machine (mac/ubuntu/ any other Linux based):

make sure you got the ruby version installed see (.ruby-version file)

run: bundle install

run: rails db:setup

run: rails s

For test case

run: bundle exec rspec
Now go to Postman and import this API for testing
https://www.getpostman.com/collections/2f9618d02d45f1357ca4

  POST http://localhost:3000/api/v1/auth
  POST http://localhost:3000/api/v1/sign_in
  POST http://localhost:3000/api/v1/reservations
  PUT http://localhost:3000/api/v1/reservations/{:id}
  PUT http://localhost:3000/api/v1/status


Steps Need to follow
  1 Create a user using API or us seed user
  2 Sign in the user with sign in using email and password
  3 Get client, access-token, uid from the header of successful sign in request
  4 Set these three into environment variable on postman ref(https://learning.postman.com/docs/sending-requests/variables/)
  5 Now you can go to the postman and run "Create reservation" API with the right data(make sure to set the header in an environment variable or manually)
    Make sure pass vehicle id that exists in the database, I have created 10 vehicle, you can use 1--10 for vechile_id
  6 If you going to update reservation, make sure pass right user id who created reservation.

Assumptions
   On reservation form, I assume that form will get available vehicle model and vehicle make from our database using API
   When someone fills the form for reservation, they will select vehicle modal using select box and that select box will return vehicle id and on submit form vehicle id will be passed
   I have created a table of "make" by assuming that in this fast-moving world we can't make it enum as there is a possibility that we need to add more make in the upcoming month using our admin panel
   I did not use any API as we have to only give API endpoint for creating, but when we need to work on advance we can use  active_model_serializers, jsonapi-rb or blueprinter and even can make our custom validator for each action upon need
   I have made code generic which will make any model basic API without writing any code in the controller
   I did not limit the resource routes as I have to implement completed rest endpoint
