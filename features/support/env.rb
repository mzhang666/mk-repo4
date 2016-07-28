require 'rspec/expectations'
require 'selenium-webdriver'
World(RSpec::Matchers)

$driver = Selenium::WebDriver.for :firefox
