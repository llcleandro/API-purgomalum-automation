# Peformance Tests using API Rest PurgoMalum

This Tests, using the BDD framework Cucumber + HTTParty to provide documentation to automated tests.

## Dependencies

* Ruby 2.5.5
* cucumber
* httparty
* pry
* rspec
* PurgoMalum

## Installation Instructions

### Project Installation

* unzip the project
* access the path and execute $ bundle install
** is necessary environment RUBY installed in machine

## Suport Tools

* from Windows use: https://rubyinstaller.org/
* from MAC use: https://bddsemcomplicacao.blogspot.com/2019/07/criando-um-projeto-no-mac-os-do-zero.html
* from Linux use: https://bddsemcomplicacao.blogspot.com/2019/09/criando-um-projeto-no-linux-ubuntu-do.html

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

## PurgoMalum

* PurgoMalum is a simple, free, RESTful web service for filtering and removing content of profanity, obscenity and other unwanted text. PurgoMalum's interface accepts several parameters for customization and can return results in plain text, XML and JSON. 
* See more in http://www.purgomalum.com/