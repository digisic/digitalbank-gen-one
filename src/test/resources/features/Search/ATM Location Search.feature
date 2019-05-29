@ui, @search
Feature: ATM Location Search
  As a logged in user
  I want to search for local ATM locations
  so I can find a convenient ATM near me


@negative
Scenario: ATM Location Search with Invalid Zip Code
  Given Josh is logged into the application
  When Josh navigates to the Search page
  And he or she enters '23455677' into the Zip Code field
  Then Josh verifies he or she is presented with a validation error message

@negative
Scenario: ATM Location Search with Empty Zip Code
  Given Josh is logged into the application
  When Josh navigates to the Search page
  And he or she enters '' into the Zip Code field
  Then Josh verifies he or she is presented with a validation error message

@positive
Scenario: ATM Location Search with Valid Zip Code with Results
  Given Josh is logged into the application
  When Josh navigates to the Search page
  And he or she enters '11749' into the Zip Code field
  Then Josh verifies he or she is presented with a list of results

@positive
Scenario: ATM Location Search with Valid Zip Code without Results
  Given Josh is logged into the application
  When Josh navigates to the Search page
  And he or she enters '12345' into the Zip Code field
  Then Josh verifies he or she is presented with a message indicating zero results