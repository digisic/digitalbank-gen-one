@ui @user @security @register
Feature: Register New User (UI)
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.


@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Email Address expecting an Error result
  Given Sidney is a new customer
  When Sidney navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Sidney' into the First Name field
  And he or she enters 'Frederick' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/09/1997' into the Date of Birth field
  And he or she enters '762-45-9129' into the Social Security Number field
  And he or she enters '' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Sidney verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address with no at sign expecting an Error result
  Given Zachariah is a new customer
  When Zachariah navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Zachariah' into the First Name field
  And he or she enters 'Gaines' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/25/1976' into the Date of Birth field
  And he or she enters '569-41-9694' into the Social Security Number field
  And he or she enters 'Zachariah.Gainesdemo.io' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Zachariah verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address without domain expecting an Error result
  Given Paxton is a new customer
  When Paxton navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Paxton' into the First Name field
  And he or she enters 'Morrison' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/10/1985' into the Date of Birth field
  And he or she enters '236-06-9006' into the Social Security Number field
  And he or she enters 'Paxton.Morrison' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Paxton verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Confirm Password expecting an Error result
  Given George is a new customer
  When George navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'George' into the First Name field
  And he or she enters 'Cash' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/20/1975' into the Date of Birth field
  And he or she enters '770-47-9042' into the Social Security Number field
  And he or she enters 'George.Cash@demo.io' into the Email Address field
  And he or she enters 'BVwuRETfUPtK41100' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then George verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, non-matching Confirm Password expecting an Error result
  Given Stanley is a new customer
  When Stanley navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Stanley' into the First Name field
  And he or she enters 'Frost' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/24/1949' into the Date of Birth field
  And he or she enters '005-56-6595' into the Social Security Number field
  And he or she enters 'Stanley.Frost@demo.io' into the Email Address field
  And he or she enters 'hyLUqRHTeZhspQn0' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Stanley verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Region expecting an Error result
  Given Toby is a new customer
  When Toby navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Toby' into the First Name field
  And he or she enters 'Gardner' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/21/1937' into the Date of Birth field
  And he or she enters '322-80-0729' into the Social Security Number field
  And he or she enters 'Toby.Gardner@demo.io' into the Email Address field
  And he or she enters 'tqQfCkMQDykW343' into the registration Password field
  And he or she enters 'tqQfCkMQDykW343' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BARRIO PUEBLO NUEVO' into the registration Address field
  And he or she enters 'Providence' into the registration Locality field
  And he or she enters '' into the registration Region field
  And he or she submits the Registration request
  Then Toby verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Postal Code expecting an Error result
  Given Irving is a new customer
  When Irving navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Irving' into the First Name field
  And he or she enters 'Peterson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '06/01/1940' into the Date of Birth field
  And he or she enters '418-79-4157' into the Social Security Number field
  And he or she enters 'Irving.Peterson@demo.io' into the Email Address field
  And he or she enters 'EsoaREbTSD71753' into the registration Password field
  And he or she enters 'EsoaREbTSD71753' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALLE COMERCIO ST. 51A' into the registration Address field
  And he or she enters 'Miami' into the registration Locality field
  And he or she enters 'FL' into the registration Region field
  And he or she enters '' into the registration Postal Code field
  And he or she submits the Registration request
  Then Irving verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Country expecting an Error result
  Given Colton is a new customer
  When Colton navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Colton' into the First Name field
  And he or she enters 'Mccray' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/06/1944' into the Date of Birth field
  And he or she enters '712-47-7186' into the Social Security Number field
  And he or she enters 'Colton.Mccray@demo.io' into the Email Address field
  And he or she enters 'xGzAqsOmENm12603' into the registration Password field
  And he or she enters 'xGzAqsOmENm12603' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'REPARTO FLAMBOYAN CALLE CIPRES' into the registration Address field
  And he or she enters 'Ewing' into the registration Locality field
  And he or she enters 'KY' into the registration Region field
  And he or she enters '41039' into the registration Postal Code field
  And he or she enters '' into the registration Country field
  And he or she submits the Registration request
  Then Colton verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Home Phone expecting an Error result
  Given Amarion is a new customer
  When Amarion navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Amarion' into the First Name field
  And he or she enters 'Reeves' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '06/15/1930' into the Date of Birth field
  And he or she enters '173-33-8396' into the Social Security Number field
  And he or she enters 'Amarion.Reeves@demo.io' into the Email Address field
  And he or she enters 'RIBsROtPZZPMw8761' into the registration Password field
  And he or she enters 'RIBsROtPZZPMw8761' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB STELLA A-65 CALLE LIRIO' into the registration Address field
  And he or she enters 'Hartford' into the registration Locality field
  And he or she enters 'MI' into the registration Region field
  And he or she enters '49057' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '' into the registration Home Phone field
  And he or she submits the Registration request
  Then Amarion verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Home Phone expecting an Error result
  Given Shamar is a new customer
  When Shamar navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Shamar' into the First Name field
  And he or she enters 'Pierce' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/20/1950' into the Date of Birth field
  And he or she enters '012-98-8471' into the Social Security Number field
  And he or she enters 'Shamar.Pierce@demo.io' into the Email Address field
  And he or she enters 'iTkynJGjmT40150' into the registration Password field
  And he or she enters 'iTkynJGjmT40150' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'APARTAMENTO 702' into the registration Address field
  And he or she enters 'Elkton' into the registration Locality field
  And he or she enters 'KY' into the registration Region field
  And he or she enters '42220' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '27' into the registration Home Phone field
  And he or she submits the Registration request
  Then Shamar verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Agree False expecting an Error result
  Given Garett is a new customer
  When Garett navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Garett' into the First Name field
  And he or she enters 'Reilly' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/25/1959' into the Date of Birth field
  And he or she enters '782-09-6304' into the Social Security Number field
  And he or she enters 'Garett.Reilly@demo.io' into the Email Address field
  And he or she enters 'VKHUQbTXz2816' into the registration Password field
  And he or she enters 'VKHUQbTXz2816' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '372 CALLE RIO GRANDE' into the registration Address field
  And he or she enters 'Meador' into the registration Locality field
  And he or she enters 'WV' into the registration Region field
  And he or she enters '25682' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '8434674478' into the registration Home Phone field
  And he or she enters '8434674478' into the registration Mobile Phone field
  And he or she enters '8434674478' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Garett verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Work Phone, Agree False expecting an Error result
  Given Tyrell is a new customer
  When Tyrell navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Tyrell' into the First Name field
  And he or she enters 'Guzman' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/06/1982' into the Date of Birth field
  And he or she enters '071-59-6768' into the Social Security Number field
  And he or she enters 'Tyrell.Guzman@demo.io' into the Email Address field
  And he or she enters 'PwwlYAAprzz1210' into the registration Password field
  And he or she enters 'PwwlYAAprzz1210' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'NO 410 380 SOMERSET ST WEST' into the registration Address field
  And he or she enters 'Elk grove' into the registration Locality field
  And he or she enters 'CA' into the registration Region field
  And he or she enters '95758' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '6514557323' into the registration Home Phone field
  And he or she enters '6514557323' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Tyrell verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid Work Phone expecting an Error result
  Given Andres is a new customer
  When Andres navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Andres' into the First Name field
  And he or she enters 'Sloan' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '06/08/1981' into the Date of Birth field
  And he or she enters '268-46-0135' into the Social Security Number field
  And he or she enters 'Andres.Sloan@demo.io' into the Email Address field
  And he or she enters 'PNwfMTzrGBMFlenbFt8' into the registration Password field
  And he or she enters 'PNwfMTzrGBMFlenbFt8' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC04 BOX 15421 BOX MIRABALES' into the registration Address field
  And he or she enters 'Fort ord' into the registration Locality field
  And he or she enters 'CA' into the registration Region field
  And he or she enters '93941' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '7088466587' into the registration Home Phone field
  And he or she enters '7088466587' into the registration Mobile Phone field
  And he or she enters '79' into the registration Work Phone field
  And he or she submits the Registration request
  Then Andres verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, empty Work Phone expecting a Successful registration
  Given Ronan is a new customer
  When Ronan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Ronan' into the First Name field
  And he or she enters 'Christensen' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/17/1946' into the Date of Birth field
  And he or she enters '350-14-6516' into the Social Security Number field
  And he or she enters 'Ronan.Christensen@demo.io' into the Email Address field
  And he or she enters 'pUkavEshLmhR255' into the registration Password field
  And he or she enters 'pUkavEshLmhR255' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC 01 BOX 3458' into the registration Address field
  And he or she enters 'Lagrange' into the registration Locality field
  And he or she enters 'ME' into the registration Region field
  And he or she enters '44530' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '6698741174' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Ronan verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Ronan.Christensen@demo.io
  And he or she enters 'pUkavEshLmhR255' into the login Password field
  And he or she submits the login request
  And he or she verifies he or she is at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, invalid Work Phone expecting an Error result
  Given Cael is a new customer
  When Cael navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Cael' into the First Name field
  And he or she enters 'Hobbs' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/29/2000' into the Date of Birth field
  And he or she enters '980-85-8966' into the Social Security Number field
  And he or she enters 'Cael.Hobbs@demo.io' into the Email Address field
  And he or she enters 'fkUQdViZQM03' into the registration Password field
  And he or she enters 'fkUQdViZQM03' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BB12 CALLE BB ALT VEGA BAJA' into the registration Address field
  And he or she enters 'Mission' into the registration Locality field
  And he or she enters 'TX' into the registration Region field
  And he or she enters '78572' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '4063297316' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '668773' into the registration Work Phone field
  And he or she submits the Registration request
  Then Cael verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Mobile Phone expecting an Error result
  Given Devyn is a new customer
  When Devyn navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Devyn' into the First Name field
  And he or she enters 'Hughes' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/13/1984' into the Date of Birth field
  And he or she enters '850-88-0067' into the Social Security Number field
  And he or she enters 'Devyn.Hughes@demo.io' into the Email Address field
  And he or she enters 'JansZRQm7483' into the registration Password field
  And he or she enters 'JansZRQm7483' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BOX 6269' into the registration Address field
  And he or she enters 'Minden' into the registration Locality field
  And he or she enters 'LA' into the registration Region field
  And he or she enters '71055' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '7182509840' into the registration Home Phone field
  And he or she enters '977' into the registration Mobile Phone field
  And he or she submits the Registration request
  Then Devyn verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Locality expecting an Error result
  Given Xavier is a new customer
  When Xavier navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Xavier' into the First Name field
  And he or she enters 'Bartlett' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/28/1961' into the Date of Birth field
  And he or she enters '509-74-4746' into the Social Security Number field
  And he or she enters 'Xavier.Bartlett@demo.io' into the Email Address field
  And he or she enters 'ZGsFMtRr110' into the registration Password field
  And he or she enters 'ZGsFMtRr110' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC-01 BOX 20520' into the registration Address field
  And he or she enters '' into the registration Locality field
  And he or she submits the Registration request
  Then Xavier verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Address expecting an Error result
  Given Cayden is a new customer
  When Cayden navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Cayden' into the First Name field
  And he or she enters 'Franklin' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/03/1952' into the Date of Birth field
  And he or she enters '614-29-7126' into the Social Security Number field
  And he or she enters 'Cayden.Franklin@demo.io' into the Email Address field
  And he or she enters 'vpvwUHCEFaPMAJAuyAC73428' into the registration Password field
  And he or she enters 'vpvwUHCEFaPMAJAuyAC73428' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '' into the registration Address field
  And he or she submits the Registration request
  Then Cayden verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Password expecting an Error result
  Given Joaquin is a new customer
  When Joaquin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Joaquin' into the First Name field
  And he or she enters 'Perkins' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/31/1951' into the Date of Birth field
  And he or she enters '643-72-3866' into the Social Security Number field
  And he or she enters 'Joaquin.Perkins@demo.io' into the Email Address field
  And he or she enters '' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Joaquin verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password less than 8 characters expecting an Error result
  Given Hunter is a new customer
  When Hunter navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Hunter' into the First Name field
  And he or she enters 'Roy' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/03/1975' into the Date of Birth field
  And he or she enters '781-12-1490' into the Social Security Number field
  And he or she enters 'Hunter.Roy@demo.io' into the Email Address field
  And he or she enters 'eRkbC094' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Hunter verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no lowercase expecting an Error result
  Given Nikhil is a new customer
  When Nikhil navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Nikhil' into the First Name field
  And he or she enters 'Le' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/21/1957' into the Date of Birth field
  And he or she enters '507-43-1617' into the Social Security Number field
  And he or she enters 'Nikhil.Le@demo.io' into the Email Address field
  And he or she enters 'TKXANHDUSNSAE2' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Nikhil verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no numeric expecting an Error result
  Given Matthew is a new customer
  When Matthew navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Matthew' into the First Name field
  And he or she enters 'Giles' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/22/1944' into the Date of Birth field
  And he or she enters '230-56-6197' into the Social Security Number field
  And he or she enters 'Matthew.Giles@demo.io' into the Email Address field
  And he or she enters 'XzOHytpRbEsmVqI' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Matthew verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no upper expecting an Error result
  Given Kolton is a new customer
  When Kolton navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kolton' into the First Name field
  And he or she enters 'Hogan' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/04/1968' into the Date of Birth field
  And he or she enters '858-17-3031' into the Social Security Number field
  And he or she enters 'Kolton.Hogan@demo.io' into the Email Address field
  And he or she enters 'jhtzqsyszpyjjgw0979' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Kolton verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered Email Address expecting an Error result
  Given Vernon is a new customer
  When Vernon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Vernon' into the First Name field
  And he or she enters 'Elliott' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/26/1969' into the Date of Birth field
  And he or she enters '551-61-4354' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'GJyvPBuaIpsnTPIdUB212' into the registration Password field
  And he or she enters 'GJyvPBuaIpsnTPIdUB212' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Vernon verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered SSN expecting an Error result
  Given Kirk is a new customer
  When Kirk navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kirk' into the First Name field
  And he or she enters 'Klein' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/23/1995' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'Kirk.Klein@demo.io' into the Email Address field
  And he or she enters 'cEfdXvmHvdXIhn2' into the registration Password field
  And he or she enters 'cEfdXvmHvdXIhn2' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Kirk verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty DoB expecting an Error result
  Given Fidel is a new customer
  When Fidel navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Fidel' into the First Name field
  And he or she enters 'Rush' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Fidel verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid DoB expecting an Error result
  Given Duncan is a new customer
  When Duncan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Duncan' into the First Name field
  And he or she enters 'Grimes' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '1946-05-12pc' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Duncan verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN less than 9 digits expecting an Error result
  Given Orlando is a new customer
  When Orlando navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Orlando' into the First Name field
  And he or she enters 'Hunt' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '05/12/1985' into the Date of Birth field
  And he or she enters '1' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Orlando verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN greater than 9 digits expecting an Error result
  Given Brendon is a new customer
  When Brendon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Brendon' into the First Name field
  And he or she enters 'Daugherty' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '03/25/1999' into the Date of Birth field
  And he or she enters '30887019050466' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Brendon verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN with invalid characters expecting an Error result
  Given Alberto is a new customer
  When Alberto navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Alberto' into the First Name field
  And he or she enters 'Huber' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '12/13/1993' into the Date of Birth field
  And he or she enters '023$56$0131' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Alberto verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty Mobile Phone expecting a Successful registration
  Given Shaun is a new customer
  When Shaun navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Shaun' into the First Name field
  And he or she enters 'Silva' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '12/01/1934' into the Date of Birth field
  And he or she enters '173-96-7174' into the Social Security Number field
  And he or she enters 'Shaun.Silva@demo.io' into the Email Address field
  And he or she enters 'iktzOFMhpOTHz8' into the registration Password field
  And he or she enters 'iktzOFMhpOTHz8' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC03 BO 31074' into the registration Address field
  And he or she enters 'Nelson' into the registration Locality field
  And he or she enters 'NE' into the registration Region field
  And he or she enters '68961' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '9363058085' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '9363058085' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Shaun verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Shaun.Silva@demo.io
  And he or she enters 'iktzOFMhpOTHz8' into the login Password field
  And he or she submits the login request
  And he or she verifies he or she is at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty DoB expecting an Error result
  Given Nathaniel is a new customer
  When Nathaniel navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Nathaniel' into the First Name field
  And he or she enters 'Mcfadden' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Nathaniel verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, invalid DoB expecting an Error result
  Given Korey is a new customer
  When Korey navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Korey' into the First Name field
  And he or she enters 'Vega' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '1943-08-18b' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Korey verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, Gender not selected expecting an Error result
  Given Guy is a new customer
  When Guy navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Guy' into the First Name field
  And he or she enters 'Bradshaw' into the Last Name field
  And he or she selects '' from the Gender radio button
  And he or she navigates to the Contact Details page
  Then Guy verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, empty Last Name expecting an Error result
  Given Timothy is a new customer
  When Timothy navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Timothy' into the First Name field
  And he or she enters '' into the Last Name field
  And he or she navigates to the Contact Details page
  Then Timothy verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, empty First Name expecting an Error result
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Ms.' Title, 'M' Gender, registered SSN, registered Email Address expecting an Error result
  Given Arely is a new customer
  When Arely navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters 'Arely' into the First Name field
  And he or she enters 'Logan' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '06/03/1969' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'tEktoAxkq6828' into the registration Password field
  And he or she enters 'tEktoAxkq6828' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Arely verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Ms.' Title, empty First Name expecting an Error result
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mrs.' Title, 'F' Gender, empty SSN expecting an Error result
  Given Susan is a new customer
  When Susan navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters 'Susan' into the First Name field
  And he or she enters 'Stuart' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '01/04/1988' into the Date of Birth field
  And he or she enters '' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Susan verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mrs.' Title, empty First Name expecting an Error result
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with no Title selected expecting an Error result
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects '' from the Title radio button
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required