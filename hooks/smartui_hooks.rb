require 'rubygems'
require 'selenium-webdriver'
# Input capabilities

USERNAME = ENV["LT_USERNAME"] || "<USERNAME>"
ACCESS_KEY = ENV["LT_ACCESS_KEY"] || "<ACCESS_KEY>"

options = Selenium::WebDriver::Options.chrome
options.browser_version = "119.0"
options.platform_name = "Windows 10"
lt_options = {};
lt_options[:username] = "#{USERNAME}";
lt_options[:accessKey] = "#{ACCESS_KEY}";
lt_options[:project] = "Ruby SDK DOM";
lt_options[:sessionName] = "Ruby Test";
lt_options[:build] = "Ruby Job";
lt_options[:w3c] = true;
lt_options[:plugin] = "ruby-ruby";
lt_options[:'smartUI.project']="Ruby-Project"
lt_options[:selenium_version]="4.0.0"
options.add_option('LT:Options', lt_options);

driver = Selenium::WebDriver.for(:remote,
:url => "https://hub.lambdatest.com/wd/hub",
:capabilities => options)
begin

driver.navigate.to "https://www.lambdatest.com/visual-regression-testing"
config = {
  'screenshotName' => 'SmartUI-Home',
  'fullPage' => true
}
driver.execute_script("smartui.takeScreenshot", config)


end
print("Execution Successful\n")
driver.quit
