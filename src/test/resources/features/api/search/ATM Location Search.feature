@api @search
Feature: ATM Location Search (API)
  As an authenitcated user
  I want to search for local ATM locations
  so I can find a convenient ATM near me


@negative
Scenario: ATM Location Search with Invalid Zip Code
  Given Josh is authenticated into the API
  When Josh populates the Search request with zipcode equal to '23455677'
  And he or she submits the Search request
  Then Josh verifies the return code is '500'
  And he or she verifies he or she is presented with a validation error message

@negative
Scenario: ATM Location Search with Empty Zip Code
  Given Josh is authenticated into the API
  When Josh populates the Search request with zipcode equal to ''
  And he or she submits the Search request
  Then Josh verifies the return code is '500'
  And he or she verifies he or she is presented with a validation error message

@positive
Scenario: ATM Location Search with Valid Zip Code with Results
  Given Josh is authenticated into the API
  When Josh populates the Search request with zipcode equal to '11749'
  And he or she submits the Search request
  Then Josh verifies the return code is '200'
  And he or she verifies he or she is presented with a list of results

@positive
Scenario: ATM Location Search with Valid Zip Code without Results
  Given Josh is authenticated into the API
  When Josh populates the Search request with zipcode equal to '12345'
  And he or she submits the Search request
  Then Josh verifies the return code is '200'
  And he or she verifies he or she is presented with a empty list