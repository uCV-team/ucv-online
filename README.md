# PubliCV
PubliCV is the open source platform to help Jobseekers find their next Employer, and vice versa, _directly_ (with no intermediaries). See: https://publicv.org

The source code of the core service is released under the MIT license (see LICENSE and the [term of service](https://publicv.org/legal/terms) for more).

## Requirements

Make sure you have installed:

* Ruby 2.4.0
* PostgreSQL (10+)
* Yarn

For Rails version and gems see the Gemfile.

## Setup

### Database
This is pretty standard to RoR apps, but always nice to remember: just set up the `config/database.yml` file with your local database credentials. Sample already exists at `config/database.yml.example` for reference

## Installation

So far so good. Now that you are all set up, you can begin to install it.

### Ruby on Rails Application

Run the standard RoR app setup commands:

1. `bundle install`
2. `rake db:create`
3. `rake db:migrate`

# Contributing

PubliCV is an open source project and we encourage contributions.
