When('I load google.com') do
  $driver = Selenium::WebDriver.for :chrome
  $driver.get 'http://google.com'
end

Then('the page contains {string}') do |string|
  $driver.page_source.should include string
end

Then('does not contain {string} or {string}') do |string, string2|
  $driver.page_source.should_not include string
  $driver.page_source.should_not include string2
end
