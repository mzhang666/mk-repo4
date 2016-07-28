#encoding: utf-8

Given /^I open Redfin$/ do 
  $driver.navigate.to "https://www.redfin.com/"
end

When /^I log in using username \"(.*)\" and password \"(.*)\"$/ do | username, password |
  signInLable = $driver.find_element(:link, 'Sign In')
  signInLable.click()
  usernametext = $driver.find_element(:name, 'emailInput')
  usernametext.send_keys username
  passwordtext = $driver.find_element(:name, 'passwordInput')
  passwordtext.send_keys password 
  loginbutton = $driver.find_element(:css, "Button.primary.submitButton.v3")
  loginbutton.click()  
end

When /^I search using address \"(.*)\"$/ do | address |
  addressInputBox = $driver.find_element(:name, 'searchInputBox')
  addressInputBox.send_keys address
  searchBtn = $driver.find_element(:css, ".inline-block.SearchButton.clickable.float-right")
  searchBtn.click()
  first_window = $driver.window_handle
  all_windows = $driver.window_handles
  new_window = all_windows.select { |this_window| this_window != first_window }
  $driver.switch_to.window(new_window)
  address = $driver.find_element(:css,".item-title.block")
  address.click()
end

Then /^Property should show up \"(.*)\"$/ do | inputAddress |
  streetAddress = $driver.find_element(:class,"street-address")
  title = streetAddress[:title].strip
  bool = inputAddress.start_with?(title)
  expect(bool).to be true
end

