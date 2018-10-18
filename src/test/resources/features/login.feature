Feature: User Authentication

Scenario: User can login to application

Given use is at Login page
When user enters valid username
And user enters valid password
And user clicks Submit button
Then user is taken to home page