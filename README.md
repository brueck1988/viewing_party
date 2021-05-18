## Update!

[Ryan Stemmle](https://github.com/r-stemmle) and [Alexander Brueck](https://github.com/brueck1988)
forked, cloned, and built this app out from May 10 - May 20, 2021.

This is the base repo for the [viewing party project](https://backend.turing.edu/module3/projects/viewing_party/) used for Turings BE MOD 3.

# Viewing Party

Plan a party today!

### About this Project

Viewing party is an application in which users can explore movie options and create a viewing party event for the user and friend's.

[Visit us online!](https://radiant-sierra-18770.herokuapp.com/)

### Our API endpoint

[The Movie Database API](https://developers.themoviedb.org/3/getting-started)

## Local Setup

1. Fork and Clone the repo
1. Install and Update gem packages: `bundle install` `bundle update`
1. Setup the database: `rails db:{create,migrate,seed}`
1. We are using Figaro to hide the `moviedb_api_key`
  * `bin/rails bundle exec figaro install` will create `config/application.yml`
1. Run: `bin/rails server`
1. Visit: `localhost:3000`

## Links to Related Gems

[figaro](https://github.com/laserlemon/figaro)  
[webmock](https://rubygems.org/gems/webmock)

## Versions

- Ruby 2.5.3
- Rails 5.2.5

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)
