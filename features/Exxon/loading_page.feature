@exxon
Feature: As a User
  I want to be able to view the example Exxon page
  With header, content and footer
  And the correct HTTP responses

  Background: Arriving in the Exxon page
    Given I am on the Exxon example page

  Scenario: Navigating to the log in / sign up page with the correct responses
    Then I should arrive to the exxon example page
    And I should get the 'sign in' responses
    And I should get the 'css' responses
    And I should get the 'js' responses
    And I should get the 'fonts' responses
    And I should get the 'image' responses