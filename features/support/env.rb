require 'httparty'
require 'rspec'
require 'pry'

# Environment definitions
$env = ENV['ENV'] || 'TESTE'
ENVIRONMENT = (YAML.load_file('./config/environment.yml'))[$env]