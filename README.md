# README

This is a blogging app with the following features:

* Rails 6

* User authentication built from scratch(without gems)

* Authorizations built without use of outside gems

* Users signup and login using sessions

* Enabled admin users with permissions

* Gravatar

* One to Many Associations & Many to Many Associations

* Mini Tests for models, etc., rails test test/models/category_test  or whatever test you want to run rails test to run all tests

* Many to Many associations using select forms

* COMMENTS feature

* LIVE CHAT feature using Action Cable. The communication is handled by Javascript wrappers for web sockets on both ends


I, [2021-03-24T12:40:21.011188 #4]  INFO -- : Migrating to RemoveComments (20210322152643)
== 20210322152643 RemoveComments: migrating ===================================
-- drop_table(:comments)

HEROKU ERROR:
Migration 20210322152643_RemoveComments causing errors in heroku.  StandardError: An error has occurred, this and all later migrations canceled:
PG::UndefinedTable: ERROR:  table "comments" does not exist
Tried fixing by changing migration as follows:

    def change
      drop_table :comments
    end
    TO:
    def change
      drop_table(:comments, if_exists: true)
    end
