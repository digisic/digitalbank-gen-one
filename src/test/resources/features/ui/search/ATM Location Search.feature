@ui @search
Feature: ATM Location Search (UI)
  As an authenitcated user
  I want to search for local ATM locations
  so I can find a convenient ATM near me


@negative
Scenario: ATM Location Search with Invalid Zip Code
  Given Bethesda is logged into the application with Bethesda3198@gmail.com
  When Bethesda navigates to the Search page
  And they enter '359910760' into the Zip Code field
  Then Bethesda verifies they are presented with a validation error message

@negative
Scenario: ATM Location Search with Empty Zip Code
  Given Padmini is logged into the application with Padmini1466@gmail.com
  When Padmini navigates to the Search page
  And they enter '' into the Zip Code field
  Then Padmini verifies they are presented with a validation error message

@positive
Scenario: ATM Location Search with Valid Zip Code with Results
  Given Junior is logged into the application with Junior310859@gmail.com
  When Junior navigates to the Search page
  And they enter '11749' into the Zip Code field
  Then Junior verifies they are presented with a list of results

@positive
Scenario: ATM Location Search with Valid Zip Code without Results
  Given Mwasaa is logged into the application with Mwasaa56904@gmail.com
  When Mwasaa navigates to the Search page
  And they enter '12345' into the Zip Code field
  Then Mwasaa verifies they are presented with a message indicating zero results