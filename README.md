# App Documentation

## Table Of Contents
<!--ts-->
* [Introduction](#introduction)
  * [Overview](#overview)
* [Getting the Application](#getting-the-application)
  * [Clone](#clone)
* [Get Started](#get-started)
  * [System Requirements](#system-requirements)
  * [Rails Installation](#rails-installation)
  * [Gems](#gems)
  * [Install the Required Gems](#install-the-required-gems)
  * [Database Setup](#database-setup)
  * [Server](#server)
* [Testing](#testing)
<!--te-->

## **Introduction**
### **Overview**
A web application where users can share their stories and ideas with a global audience, while also providing the capability for users to provide feedback directly to the author through their blog.

### Features
- Sign up
- Log in
- CRUD Blog Posts
- User Access Restriction
- Feedback sent through email

## **Getting the Application**
### **Clone**
```bash
git clone https://github.com/jmndz/blog.git
```

## **Get Started**
### **System Requirements**
Before generating your application, you will need:
- Ruby (v3.2.2)
- Ruby on Rails (v7.1.2)
- PostgreSQL

### **Rails Installation**
I recommend using the guide provided by GoRails:
- [Mac](https://gorails.com/setup/macos/13-ventura)
- [Ubuntu](https://gorails.com/setup/ubuntu/22.04)
- [Windows](https://gorails.com/setup/windows/10)

### **Gems**
Here are the gems used by the application:
- [Devise](http://github.com/plataformatec/devise) for authentication and user management
- [Bootstrap](https://github.com/twbs/bootstrap-rubygem#bootstrap-ruby-gem--) for CSS and JavaScript
- [Requestjs-Rails](https://github.com/rails/requestjs-rails#requestjs-for-rails) for processing HTTP requests

### **Install the Required Gems**
Run the `bundle install` command to install the required gems on your computer:
```bash
bundle install
```

### Database Setup
If you’ve cloned the repo, prepare the database and populate it with data by running the following command:
```bash
rails db:setup         # does db:create, db:schema:load, db:seed
```
Use `rails db:reset` if you want to empty and reseed the database.

### Server
To run the server, execute the following command:
```bash
rails s
```
To see the application in action, open a browser window and navigate to http://localhost:3000/.

You should see the sign in page.

## Testing
Rspec for testing models and controllers.

To run unit tests:
```bash
bundle exec rspec
```
