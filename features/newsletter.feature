Feature: Newsletter Signup
Newsletter Sign up field displays
Email address and sign up fields
Error on invalid format or missing email address
Confirmation on successful submission


Background:
  Given I am on the Experience home page
  When the hompeage loads
  Then Newsletter sign up is present on page

@newsletter @acceptance
Scenario: Email field has default text when empty
  When the Email field is empty
  Then the field has default text "Email Address"

@newsletter @acceptance
Scenario: error message displays when joining without email
  When I click sign up button
  Then "Please fill in all required fields." message displays

@newsletter @acceptance
Scenario: confirmation displays when joining with valid email
  When I type "mom0909a@gmail.com" in the email field
  And I click sign up button
  Then "Thank You" message displays
