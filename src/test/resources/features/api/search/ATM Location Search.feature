@api @search
Feature: ATM Location Search (API)
  As an authenitcated user
  I want to search for local ATM locations
  so I can find a convenient ATM near me


@negative
Scenario: ATM Location Search with Invalid Zip Code
  Given Amina is authenticated into the API with email Amina0648@gmail.com
  When Amina populates the Search request with zipcode equal to '976539926568759'
  And they submit the Search request
  Then Amina verifies the return code is '500'
  And they verify they are presented with a validation error message

@negative
Scenario: ATM Location Search with Empty Zip Code
  Given Hailee is authenticated into the API with email Hailee6019@gmail.com
  When Hailee populates the Search request with zipcode equal to ''
  And they submit the Search request
  Then Hailee verifies the return code is '500'
  And they verify they are presented with a validation error message

@positive
Scenario: ATM Location Search with Valid Zip Code with Results
  Given Niara is authenticated into the API with email Niara750178@gmail.com
  When Niara populates the Search request with zipcode equal to '11749'
  And they submit the Search request
  Then Niara verifies the return code is '200'
  And they verify they are presented with a list of results

@positive
Scenario: ATM Location Search with Valid Zip Code without Results
  Given Adhik is authenticated into the API with email Adhik9162@gmail.com
  When Adhik populates the Search request with zipcode equal to '12345'
  And they submit the Search request
  Then Adhik verifies the return code is '200'
  And they verify they are presented with a empty list