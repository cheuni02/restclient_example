@bbc
Feature: As a User
  I want to be able to navigate to the Log in / Sign Up page from the BBC homepage

  Background: Arriving in the BBC homepage
    Given I am on the BBC homepage

  Scenario: Navigating to the log in / sign up page with the correct responses
    When I click on the Sign in button on the top of the page
    Then I should arrive to the sign in page
    And I should get the 'sign in' responses
    And I should get the 'css' responses
    And I should get the 'js' responses
