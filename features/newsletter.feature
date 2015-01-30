@ignore @newsletter @acceptance
Feature: Newsletter Signup
Newsletter Sign up field displays
Email address and sign up fields
Error on missing email address
Confirmation on successful submission


Background:
  Given I am on the Experience home page
  When The hompeage loads
  Then Newsletter sign up is present on page

Scenario: Email field has default text when empty
  When The Email field is empty
  Then The field has default text "Email Address"

Scenario: Error message displays when joining without email
  When I click sign up button
  Then "Please fill in all required fields." message displays

Scenario: Confirmation displays when joining with valid email
  When I type "mom0909a@gmail.com" in the email field
  And I click sign up button
  Then "Thank You" message displays
