# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version  3.3.0
* Rails 7.1.4

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


## Known issues to fix later
    
  * **signup form**. 
    
    If there is an error, the turbo system is not
    replacing the form, it appends it outside of body element.

    I use javascript to add event listeners on the signup input fields. On intial load everything works fine. But if
    the cancel button to go back to home page, and then come back to the signup page, the event listeners are no lognger
    attached to the input fields, and the javascript isn't executed.
