# Completed step definitions for basic features: AddMovie, ViewDetails, EditMovie



 When /^I have added a movie with title "(.*?)" and rating "(.*?)"$/ do |title, rating|
  visit new_movie_path
  fill_in 'Title', :with => title
  select rating, :from => 'Rating'
  click_button 'Save Changes'
 end

 Then /^I should see a movie list entry with title "(.*?)" and rating "(.*?)"$/ do |title, rating|
   result=false
   all("tr").each do |tr|
     if tr.has_content?(title) && tr.has_content?(rating)
       result = true
       break
     end
   end
  expect(result).to be_truthy
 end

 Then /^(?:|I )should see "([^\"]*)"$/ do |text|
    expect(page).to have_content(text)
 end


When(/^I am on Vanpools homepage$/) do
  visit root_path
end

And(/^I click "(.*?)"$/) do |arg|
  click_button arg
end

Then('I should be redirected to {string}') do |string|
  expect(page).to have_current_path(string)
end