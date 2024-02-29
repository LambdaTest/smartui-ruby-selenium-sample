require "selenium-webdriver"
require "lambdatest/selenium/driver"

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://www.pinterest.com/pin/16958936087791895/"

# Take a snapshot
Lambdatest::Selenium::Driver.smartui_snapshot(driver, "Screenshot Name")

driver.quit
