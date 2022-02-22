# YouCV
## One website for each job seeker

YouCV is the open source platform to help Job seekers find their next Employer, and vice versa, _directly_. The core idea is to simplify the job seekeing / recruitment processes by cutting the middlemen out. See: https://ucv.online

**"YouCV: one website for each job seeker"** is now a pledge [published](https://pledgeviewer.eu/pledge/initiative/659) on the **Digital Skills and Jobs Coalition** of the **European Commission**.

The source code of the core service is released under the MIT license (see the [LICENSE](https://github.com/uCV-team/ucv/blob/main/LICENSE) file and the [terms of service](https://ucv.online/legal/terms) for more).

## Trademarks policy

"YouCV", "ucv", and the uCV logo are registered trademarks of Corsidia & Bluebash. You may not use these trademarks in a commercial setting to infer that your product or service is endorsed or associated with YouCV without permission. You may use these marks to refer to YouCV in a way where it's clear that you're simply referring to the project, not claiming endorsement or association.

You can request permission by emailing info@ucv.online.

## Requirements

Make sure you have installed:

* Ruby 2.4.0
* PostgreSQL (13+)
* Yarn (1.22.4)
* Node (12.16.2)

For Rails version and gems see the Gemfile.

## Setup

### Database
This is pretty standard to RoR apps, but always nice to remember: just set up the `config/database.yml` file with your local database credentials. Sample already exists at `config/database.yml.example` for reference

## Installation

So far so good. Now that you are all set up, you can begin to install it.

### Ruby on Rails Application

Run the standard RoR app setup commands:

1. `bundle install`
2. `bundle exec rake db:structure:load`

# Contributing

YouCV is an open source project and we encourage contributions. [Read the wiki](https://github.com/uCV-team/ucv/wiki) to get started.
