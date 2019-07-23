# Flow for Tests API Purgomalum

This Tests use the BDD framework is based in Ruby + Cucumber + HTTParty.

## Dependencies

* Ruby 2.5.5
* cucumber
* httparty
* pry
* rspec

## Installation Instructions

### Project Installation

* unzip the project
* access the path and execute $ bundle install
** is necessary environment RUBY installed in machine

## Suport Tools

* from Windows use: https://rubyinstaller.org/
* from MAC or LINUX use: https://bddsemcomplicacao.blogspot.com/2019/07/criando-um-projeto-no-mac-os-do-zero.html

## Run Tests

### Run All Tests
type: $API-purgomalum-automation>cucumber features\*

### Run Sucess Tests
type: $API-purgomalum-automation>cucumber features\specs\purgomalum.feature --tag @success

### Run Tests with error message
type: $API-purgomalum-automation>cucumber features\specs\purgomalum.feature --tag @errorMessage

### Rum Error Test (forced error)
type: $API-purgomalum-automation>cucumber features\specs\purgomalum.feature --tag @error

## View Report
Report is generated in $API-purgomalum-automation\reports in html format
- $API-purgomalum-automation\reports\execution_report.html