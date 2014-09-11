# Bookstore

The goal for this project is to flesh out a (mostly) pre-existing Rails-based JSON API and add some rich client-side functionality.

Some prelimiaries:

* Fork, clone and setup the project.
* Look over the data model and make sure you understand what's being stored.
* Look over the (non-Devise) routes, and try to determine what the corresponding
  controller actions _should_ do.

Some controller actions are not (fully) implemented, and you may need to change or implement them.

TODO for you:

Add views (HTML and/or JSON where appropriate) and implement some rich on-page interactions. I expect at least the following two -

1. Add a "write a review" button. When clicked, it adds a form with a text box and score to the page. When that form is submitted, it should be both saved to the database and added to the page, without having to do a page refresh.

2. Add a "recommend to a friend" button. When clicked, it prompts the user to select one of their friends and write a note. That friend should be able to see the message on another page (e.g. /recommendations). I'm thinking something like a Bootstrap modal here, but feel free to use anything that lets you get the right data.

This could be done with Angular or raw jQuery, as you prefer.

Some opportunities for further client side practice, if you've finished those and want to go further -

* Be able to friend / unfriend users without leaving the user index view
* Periodically check for new recommendations and display a message when new ones are recieved
* Make AJAX calls to Amazon to fetch actual book data / images from the client side
