@api @search
Feature: ATM Location Search (API)
  As an authenitcated user
  I want to search for local ATM locations
  so I can find a convenient ATM near me


@negative
Scenario: ATM Location Search with Invalid Zip Code
  Given Bethesda is authenticated into the API with email Bethesda3198@gmail.com
  When Bethesda populates the Search request with zipcode equal to '359910760'
  And they submit the Search request
  Then Bethesda verifies the return code is '500'
  And they verify they are presented with a validation error message

@negative
Scenario: ATM Location Search with Empty Zip Code
  Given Padmini is authenticated into the API with email Padmini1466@gmail.com
  When Padmini populates the Search request with zipcode equal to ''
  And they submit the Search request
  Then Padmini verifies the return code is '500'
  And they verify they are presented with a validation error message

@positive
Scenario: ATM Location Search with Valid Zip Code with Results
  Given Junior is authenticated into the API with email Junior310859@gmail.com
  When Junior populates the Search request with zipcode equal to '11749'
  And they submit the Search request
  Then Junior verifies the return code is '200'
  And they verify they are presented with a list of results

@positive
Scenario: ATM Location Search with Valid Zip Code without Results
  Given Mwasaa is authenticated into the API with email Mwasaa56904@gmail.com
  When Mwasaa populates the Search request with zipcode equal to '12345'
  And they submit the Search request
  Then Mwasaa verifies the return code is '200'
  And they verify they are presented with a empty list