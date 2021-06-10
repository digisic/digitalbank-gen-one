@ui @search
Feature: ATM Location Search (UI)
  As an authenitcated user
  I want to search for local ATM locations
  so I can find a convenient ATM near me


@negative
Scenario: ATM Location Search with Invalid Zip Code
  Given Pentheus is logged into the application with Pentheus6237@gmail.com
  When Pentheus navigates to the Search page
  And they enter '680083148655' into the Zip Code field
  Then Pentheus verifies they are presented with a validation error message

@negative
Scenario: ATM Location Search with Empty Zip Code
  Given Dominica is logged into the application with Dominica96840@gmail.com
  When Dominica navigates to the Search page
  And they enter '' into the Zip Code field
  Then Dominica verifies they are presented with a validation error message

@positive
Scenario: ATM Location Search with Valid Zip Code with Results
  Given Menoeceus is logged into the application with Menoeceus52173@gmail.com
  When Menoeceus navigates to the Search page
  And they enter '11749' into the Zip Code field
  Then Menoeceus verifies they are presented with a list of results

@positive
Scenario: ATM Location Search with Valid Zip Code without Results
  Given Umair is logged into the application with Umair20840@gmail.com
  When Umair navigates to the Search page
  And they enter '12345' into the Zip Code field
  Then Umair verifies they are presented with a message indicating zero results