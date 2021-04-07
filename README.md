# Rails-Engine

**Project Description** You are working for a company developing an E-Commerce Application. Your team is working in a service-oriented architecture, meaning the front and back ends of this application are separate and communicate via APIs. Your job is to expose the data that powers the site through an API that the front end will consume.

This project was one of the solo projects I worked on during [Mod3](https://backend.turing.io/module3/projects/rails_engine/) at Turing School of Software and Design's [Back-End Program](https://backend.turing.io/).

## Database Schema

TBD

## Getting Started

Please follow these instructions to get a copy of the project up and running on
your local machine for development and testing purposes.

### Installing

1. Fork and clone this repo

    `git clone git@github.com:<your_account>/rails-engine.git`

2. Install gem packages: , creating and seeding database instructions:

    `bundle install`

3. Download project [data]( https://raw.githubusercontent.com/turingschool/backend-curriculum-site/gh-pages/module3/projects/rails_engine/rails-engine-development.pgdump)

4. Create and seed database:

    `rake db:{drop,create,migrate,seed}`

5. Start rails server:

    `rails s`

## Testing

* Run tests on your local:

    `bundle exec rspec`

## Built With

* Ruby on Rails
* RSpec
* FactoryBot
* Faker
* Capybara
* Rubocop
* Simplecov

## Versions

* Ruby 2.5.3
* Rails 5.2.5
