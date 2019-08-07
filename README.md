# Peformance Tests using API Rest PurgoMalum

This sample use JMeter.

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

## PurgoMalum

* PurgoMalum is a simple, free, RESTful web service for filtering and removing content of profanity, obscenity and other unwanted text. PurgoMalum's interface accepts several parameters for customization and can return results in plain text, XML and JSON. 
* See more in http://www.purgomalum.com/