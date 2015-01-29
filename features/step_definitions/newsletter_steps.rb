Given(/^I am on the Experience home page$/) do
  visit "http://exp-beach2-preprod-app.usatoday.com/beach/" #go to the beaches experience site
end

When(/^the hompeage loads$/) do
  expect(page).to have_css('#experience-header') #check for the header
end

Then(/^Newsletter sign up is present on page$/) do
  expect(find('h3.exact-target-title')).to have_content('Newsletter sign up') #check for the Newsletter sign up section

end

When(/^the Email field is empty$/) do
  expect(page).to have_css('input.exact-target-input.exact-target-email.required') #find email field
end

Then(/^the field has default text "(.*?)"$/) do |email_default|
    expect(find('.exact-target-email')[:placeholder]).to match(email_default) #check for placeholder text
end

When(/^I type "(.*?)" in the email field$/) do |valid_email|
  within(".exact-target-input-wrapper") do
  fill_in 'Email Address', :with => valid_email
  end
end

#NOTE: There is no validation on invalid email formats or domains not supported by ExactTarget
When(/^I click sign up button$/) do
  within(".exact-target-input-wrapper") do #inside the newsletter input section
    find('.exact-target-submit').click  #click join now
  end
end

Then(/^"(.*?)" message displays$/) do |message|
  if message =='Thank you' #when expecting thank you message find it on page
    within('.exact-target-submitted') do  #newsletter section should have submitted section
      page.has_content?(message) &&  page.has_content?('We\'ll be in touch with you soon') #Thank you message displays
    end

  elseif
    within('.exact-target-confirmation') do  #otherwise expect error message
      page.has_content?(message)  #Error message displays
    end
  end

end
