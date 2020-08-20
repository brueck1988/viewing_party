# Viewing Party

[![Build Status](https://travis-ci.org/backburnerstudios/viewing_party.svg?branch=main)](https://travis-ci.org/backburnerstudios/viewing_party)

This application is a means to explore movies and create viewing parties for you and friends.

The application utilizes [Google OAuth](https://developers.google.com/identity/protocols/oauth2) 
for [Calendar API access](https://developers.google.com/calendar) to save these events. We also 
use the [Movie DB API](https://developers.themoviedb.org/3/getting-started/introduction) for movie data.

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)

## Learning Goals of the Project

- Consume JSON APIs that require authentication
- Build an application that authenticates using OAuth
- Implement a self-referential relationship in ActiveRecord
- Utilize Continuous Integration using Travis CI
- Organize and refactor code to be more maintainable
- Apply RuboCop’s style guide for code quality
- Deploy to Heroku

#### Extension / Exploration Goals (1 extension is required)

- Send email from a Rails application
- Use ActionCable for chat functionality
- Implement front-end JavaScript for more dynamic pages
- Extend movie exploration by consuming additional API endpoints
- Deploy with another hosting provider

## Project Board and Hosting

- Project Board: https://github.com/backburnerstudios/viewing_party/projects/1
- Live site: https://movie-screening.herokuapp.com/

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{dropcreate,migrate,seed}`
4. Run all tests: `rspec`


## Tech Stack Versions

- Ruby 2.5.3
- Rails 5.2.4.3


