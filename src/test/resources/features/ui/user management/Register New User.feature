@ui @user @security @register
Feature: Register New User (UI)
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.


@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Email Address expecting an Error result
  Given Darwin is a new customer
  When Darwin navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Darwin' into the First Name field
  And they enter 'Sweet' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '02/13/1962' into the Date of Birth field
  And they enter '053-85-3581' into the Social Security Number field
  And they enter '' into the Email Address field
  And they navigate to the Contact Details page
  Then Darwin verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address with no at sign expecting an Error result
  Given Timothy is a new customer
  When Timothy navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Timothy' into the First Name field
  And they enter 'Singleton' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/02/1929' into the Date of Birth field
  And they enter '884-52-8963' into the Social Security Number field
  And they enter 'Timothy9122gmail.com' into the Email Address field
  And they navigate to the Contact Details page
  Then Timothy verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address without domain expecting an Error result
  Given Kevon is a new customer
  When Kevon navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Kevon' into the First Name field
  And they enter 'Maldonado' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '10/06/1999' into the Date of Birth field
  And they enter '049-62-4002' into the Social Security Number field
  And they enter 'Kevon4060@' into the Email Address field
  And they navigate to the Contact Details page
  Then Kevon verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Confirm Password expecting an Error result
  Given Eli is a new customer
  When Eli navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Eli' into the First Name field
  And they enter 'Delaney' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '03/02/1947' into the Date of Birth field
  And they enter '289-84-0875' into the Social Security Number field
  And they enter 'Eli16516@gmail.com' into the Email Address field
  And they enter 'tECOWVTa311' into the registration Password field
  And they enter '' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Eli verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, non-matching Confirm Password expecting an Error result
  Given Stephan is a new customer
  When Stephan navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Stephan' into the First Name field
  And they enter 'Austin' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '02/17/1949' into the Date of Birth field
  And they enter '304-34-8410' into the Social Security Number field
  And they enter 'Stephan16569@gmail.com' into the Email Address field
  And they enter 'QrCIgHgksXKWoixkfTl0' into the registration Password field
  And they enter '' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Stephan verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Region expecting an Error result
  Given Reece is a new customer
  When Reece navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Reece' into the First Name field
  And they enter 'Odonnell' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '08/16/1985' into the Date of Birth field
  And they enter '973-07-8028' into the Social Security Number field
  And they enter 'Reece513209@gmail.com' into the Email Address field
  And they enter 'jGYUHfrrF2432' into the registration Password field
  And they enter 'jGYUHfrrF2432' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'UNIT 21 8304 11TH AVE SW' into the registration Address field
  And they enter 'Mosheim' into the registration Locality field
  And they enter '' into the registration Region field
  And they submit the Registration request
  Then Reece verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Postal Code expecting an Error result
  Given Lamar is a new customer
  When Lamar navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Lamar' into the First Name field
  And they enter 'Stephenson' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '01/18/1935' into the Date of Birth field
  And they enter '920-54-9299' into the Social Security Number field
  And they enter 'Lamar7327@gmail.com' into the Email Address field
  And they enter 'mRWMcBcvQCXDBpA918' into the registration Password field
  And they enter 'mRWMcBcvQCXDBpA918' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'BO CALZADA BUZON 84' into the registration Address field
  And they enter 'Auburn' into the registration Locality field
  And they enter 'NE' into the registration Region field
  And they enter '' into the registration Postal Code field
  And they submit the Registration request
  Then Lamar verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Country expecting an Error result
  Given Wilson is a new customer
  When Wilson navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Wilson' into the First Name field
  And they enter 'Wyatt' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/24/1964' into the Date of Birth field
  And they enter '690-54-1339' into the Social Security Number field
  And they enter 'Wilson5235@gmail.com' into the Email Address field
  And they enter 'TMHIGqMlNpk26963' into the registration Password field
  And they enter 'TMHIGqMlNpk26963' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter '10421 ROYAL OAK DRIVE' into the registration Address field
  And they enter 'Palmyra' into the registration Locality field
  And they enter 'PA' into the registration Region field
  And they enter '17078' into the registration Postal Code field
  And they enter '' into the registration Country field
  And they submit the Registration request
  Then Wilson verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Home Phone expecting an Error result
  Given Addison is a new customer
  When Addison navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Addison' into the First Name field
  And they enter 'Humphrey' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '08/07/1956' into the Date of Birth field
  And they enter '077-13-9593' into the Social Security Number field
  And they enter 'Addison5036@gmail.com' into the Email Address field
  And they enter 'bblECLove4' into the registration Password field
  And they enter 'bblECLove4' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HC 02 BOX 1551' into the registration Address field
  And they enter 'Marietta' into the registration Locality field
  And they enter 'GA' into the registration Region field
  And they enter '30060' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '' into the registration Home Phone field
  And they submit the Registration request
  Then Addison verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Home Phone expecting an Error result
  Given Jaylen is a new customer
  When Jaylen navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Jaylen' into the First Name field
  And they enter 'Hanson' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/08/1968' into the Date of Birth field
  And they enter '520-54-2869' into the Social Security Number field
  And they enter 'Jaylen69674@gmail.com' into the Email Address field
  And they enter 'lPSqrxMaISNtgVjpk08' into the registration Password field
  And they enter 'lPSqrxMaISNtgVjpk08' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'ATALAYA R-9 ALTURAS DE MAYAGUE' into the registration Address field
  And they enter 'Olmito' into the registration Locality field
  And they enter 'TX' into the registration Region field
  And they enter '78575' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '299463013' into the registration Home Phone field
  And they submit the Registration request
  Then Jaylen verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Agree False expecting an Error result
  Given Scott is a new customer
  When Scott navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Scott' into the First Name field
  And they enter 'Emerson' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/19/1950' into the Date of Birth field
  And they enter '170-11-3181' into the Social Security Number field
  And they enter 'Scott2769@gmail.com' into the Email Address field
  And they enter 'ZXBzjhUhHGVOrdn91' into the registration Password field
  And they enter 'ZXBzjhUhHGVOrdn91' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'URB SAN VICENTE C13 #276' into the registration Address field
  And they enter 'Jeffersonville' into the registration Locality field
  And they enter 'KY' into the registration Region field
  And they enter '40337' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '9046514952' into the registration Home Phone field
  And they enter '9046514952' into the registration Mobile Phone field
  And they enter '9046514952' into the registration Work Phone field
  And they select 'False' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Scott verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Work Phone, Agree False expecting an Error result
  Given Ray is a new customer
  When Ray navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Ray' into the First Name field
  And they enter 'Snow' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/06/1981' into the Date of Birth field
  And they enter '303-88-0429' into the Social Security Number field
  And they enter 'Ray359115@gmail.com' into the Email Address field
  And they enter 'qDsYNbuaIzJqnIO29752' into the registration Password field
  And they enter 'qDsYNbuaIzJqnIO29752' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'P.O BOX 2477' into the registration Address field
  And they enter 'Seattle' into the registration Locality field
  And they enter 'WA' into the registration Region field
  And they enter '98184' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '4781391155' into the registration Home Phone field
  And they enter '4781391155' into the registration Mobile Phone field
  And they enter '' into the registration Work Phone field
  And they select 'False' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Ray verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid Work Phone expecting an Error result
  Given Nicolas is a new customer
  When Nicolas navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Nicolas' into the First Name field
  And they enter 'Odom' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/08/1928' into the Date of Birth field
  And they enter '210-21-2863' into the Social Security Number field
  And they enter 'Nicolas4019@gmail.com' into the Email Address field
  And they enter 'MOMFVsyAry40' into the registration Password field
  And they enter 'MOMFVsyAry40' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'APT 312 2605 COTE VERTU' into the registration Address field
  And they enter 'Lonedell' into the registration Locality field
  And they enter 'MO' into the registration Region field
  And they enter '63060' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '8644643862' into the registration Home Phone field
  And they enter '8644643862' into the registration Mobile Phone field
  And they enter '5' into the registration Work Phone field
  And they submit the Registration request
  Then Nicolas verifies they are presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, empty Work Phone expecting a Successful registration
  Given Chance is a new customer
  When Chance navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Chance' into the First Name field
  And they enter 'Gregory' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/02/1983' into the Date of Birth field
  And they enter '633-55-7875' into the Social Security Number field
  And they enter 'Chance65870@gmail.com' into the Email Address field
  And they enter 'XLisTAoVRHjkczZkKJB34242' into the registration Password field
  And they enter 'XLisTAoVRHjkczZkKJB34242' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter '#13 ACACIA ST.' into the registration Address field
  And they enter 'Evadale' into the registration Locality field
  And they enter 'TX' into the registration Region field
  And they enter '77615' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '2312065087' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '' into the registration Work Phone field
  And they select 'True' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Chance verifies they are at the Login page
  And they verify they are presented with a Registration Success Message
  And they verify login Username contains Chance65870@gmail.com
  And they enter 'XLisTAoVRHjkczZkKJB34242' into the login Password field
  And they submit the login request
  And they verify they are at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, invalid Work Phone expecting an Error result
  Given Roy is a new customer
  When Roy navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Roy' into the First Name field
  And they enter 'Walter' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/25/1989' into the Date of Birth field
  And they enter '736-17-2288' into the Social Security Number field
  And they enter 'Roy5023@gmail.com' into the Email Address field
  And they enter 'IpnGqAtnXYWEnID6' into the registration Password field
  And they enter 'IpnGqAtnXYWEnID6' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'URB LOS JARDINES 68 CALLE HELE' into the registration Address field
  And they enter 'Kane' into the registration Locality field
  And they enter 'PA' into the registration Region field
  And they enter '16735' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '8076226513' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '84057' into the registration Work Phone field
  And they submit the Registration request
  Then Roy verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Mobile Phone expecting an Error result
  Given Dario is a new customer
  When Dario navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Dario' into the First Name field
  And they enter 'Kirby' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '12/20/1949' into the Date of Birth field
  And they enter '898-70-2177' into the Social Security Number field
  And they enter 'Dario20233@gmail.com' into the Email Address field
  And they enter 'XKEuISmtnjA6011' into the registration Password field
  And they enter 'XKEuISmtnjA6011' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'BO MAGINA CALLE PAPAYO BUZON' into the registration Address field
  And they enter 'Ferguson' into the registration Locality field
  And they enter 'NC' into the registration Region field
  And they enter '28624' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '2701553271' into the registration Home Phone field
  And they enter '5046' into the registration Mobile Phone field
  And they submit the Registration request
  Then Dario verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Locality expecting an Error result
  Given Phillip is a new customer
  When Phillip navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Phillip' into the First Name field
  And they enter 'Mosley' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/15/1974' into the Date of Birth field
  And they enter '970-76-8510' into the Social Security Number field
  And they enter 'Phillip6594@gmail.com' into the Email Address field
  And they enter 'LikgAVVzNaRZxWv4' into the registration Password field
  And they enter 'LikgAVVzNaRZxWv4' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter '10421 ROYAL OAK DRIVE' into the registration Address field
  And they enter '' into the registration Locality field
  And they submit the Registration request
  Then Phillip verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Address expecting an Error result
  Given Gustavo is a new customer
  When Gustavo navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Gustavo' into the First Name field
  And they enter 'Wood' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '07/31/1961' into the Date of Birth field
  And they enter '815-61-9530' into the Social Security Number field
  And they enter 'Gustavo68973@gmail.com' into the Email Address field
  And they enter 'vIavpOZe356' into the registration Password field
  And they enter 'vIavpOZe356' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter '' into the registration Address field
  And they submit the Registration request
  Then Gustavo verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Password expecting an Error result
  Given Jalen is a new customer
  When Jalen navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Jalen' into the First Name field
  And they enter 'Baker' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '03/17/1954' into the Date of Birth field
  And they enter '155-96-6677' into the Social Security Number field
  And they enter 'Jalen0579@gmail.com' into the Email Address field
  And they enter '' into the registration Password field
  And they navigate to the Contact Details page
  Then Jalen verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password less than 8 characters expecting an Error result
  Given Nicolas is a new customer
  When Nicolas navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Nicolas' into the First Name field
  And they enter 'Moran' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '08/09/1977' into the Date of Birth field
  And they enter '392-07-1430' into the Social Security Number field
  And they enter 'Nicolas2982@gmail.com' into the Email Address field
  And they enter 'PqKdZjB77' into the registration Password field
  And they navigate to the Contact Details page
  Then Nicolas verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no lowercase expecting an Error result
  Given Rogelio is a new customer
  When Rogelio navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Rogelio' into the First Name field
  And they enter 'Tate' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/04/1939' into the Date of Birth field
  And they enter '368-08-2134' into the Social Security Number field
  And they enter 'Rogelio7329@gmail.com' into the Email Address field
  And they enter 'GBWYBXMTXTEDZEFSDOLV8914' into the registration Password field
  And they navigate to the Contact Details page
  Then Rogelio verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no numeric expecting an Error result
  Given Amarion is a new customer
  When Amarion navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Amarion' into the First Name field
  And they enter 'Franks' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '05/02/1926' into the Date of Birth field
  And they enter '900-89-3261' into the Social Security Number field
  And they enter 'Amarion401765@gmail.com' into the Email Address field
  And they enter 'ghCIdCMTJpNhoMtik' into the registration Password field
  And they navigate to the Contact Details page
  Then Amarion verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no upper expecting an Error result
  Given Gilbert is a new customer
  When Gilbert navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Gilbert' into the First Name field
  And they enter 'Diaz' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/18/1948' into the Date of Birth field
  And they enter '823-37-3935' into the Social Security Number field
  And they enter 'Gilbert7139@gmail.com' into the Email Address field
  And they enter 'qxfqxhaexyteeelsdzbt8226' into the registration Password field
  And they navigate to the Contact Details page
  Then Gilbert verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative @registered
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered Email Address expecting an Error result
  Given Ahmad is a new customer
  When Ahmad navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Ahmad' into the First Name field
  And they enter 'Logan' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '01/01/1935' into the Date of Birth field
  And they enter '480-55-9216' into the Social Security Number field
  And they enter 'existing' into the Email Address field
  And they enter 'ZfRTzEYNfbTfrKWzfC759' into the registration Password field
  And they enter 'ZfRTzEYNfbTfrKWzfC759' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Ahmad verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative @registered
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered SSN expecting an Error result
  Given Dylon is a new customer
  When Dylon navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Dylon' into the First Name field
  And they enter 'Gillespie' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '07/30/1985' into the Date of Birth field
  And they enter 'existing' into the Social Security Number field
  And they enter 'Dylon71996@gmail.com' into the Email Address field
  And they enter 'UZhHnfMPsw053' into the registration Password field
  And they enter 'UZhHnfMPsw053' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Dylon verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty DoB expecting an Error result
  Given Brendon is a new customer
  When Brendon navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Brendon' into the First Name field
  And they enter 'Sellers' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Brendon verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid DoB expecting an Error result
  Given Sammy is a new customer
  When Sammy navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Sammy' into the First Name field
  And they enter 'Livingston' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '1948-06-25nry' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Sammy verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN less than 9 digits expecting an Error result
  Given Kale is a new customer
  When Kale navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Kale' into the First Name field
  And they enter 'Estes' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '06/18/1992' into the Date of Birth field
  And they enter '7215929' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Kale verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN greater than 9 digits expecting an Error result
  Given Estevan is a new customer
  When Estevan navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Estevan' into the First Name field
  And they enter 'Knapp' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '11/20/1933' into the Date of Birth field
  And they enter '4350359958' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Estevan verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN with invalid characters expecting an Error result
  Given Devin is a new customer
  When Devin navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Devin' into the First Name field
  And they enter 'Weaver' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '07/17/1987' into the Date of Birth field
  And they enter '464$43$3336' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Devin verifies they are presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty Mobile Phone expecting a Successful registration
  Given Kaiden is a new customer
  When Kaiden navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Kaiden' into the First Name field
  And they enter 'Yang' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '09/19/1983' into the Date of Birth field
  And they enter '831-18-6098' into the Social Security Number field
  And they enter 'Kaiden6910@gmail.com' into the Email Address field
  And they enter 'VImrCJsqDjnKrQL9' into the registration Password field
  And they enter 'VImrCJsqDjnKrQL9' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HC 33 BOX 3003' into the registration Address field
  And they enter 'Pascagoula' into the registration Locality field
  And they enter 'MS' into the registration Region field
  And they enter '39581' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '2898775330' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '2898775330' into the registration Work Phone field
  And they select 'True' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Kaiden verifies they are at the Login page
  And they verify they are presented with a Registration Success Message
  And they verify login Username contains Kaiden6910@gmail.com
  And they enter 'VImrCJsqDjnKrQL9' into the login Password field
  And they submit the login request
  And they verify they are at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty DoB expecting an Error result
  Given Earl is a new customer
  When Earl navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Earl' into the First Name field
  And they enter 'Riley' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Earl verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, invalid DoB expecting an Error result
  Given Kareem is a new customer
  When Kareem navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Kareem' into the First Name field
  And they enter 'Garner' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '1987-07-06p' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Kareem verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, Gender not selected expecting an Error result
  Given Derrick is a new customer
  When Derrick navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Derrick' into the First Name field
  And they enter 'Bird' into the Last Name field
  And they select '' from the Gender radio button
  And they navigate to the Contact Details page
  Then Derrick verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, empty Last Name expecting an Error result
  Given Travis is a new customer
  When Travis navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Travis' into the First Name field
  And they enter '' into the Last Name field
  And they navigate to the Contact Details page
  Then Travis verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, empty First Name expecting an Error result
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter '' into the First Name field
  And they navigate to the Contact Details page
  Then Kate verifies they are presented with a Error Message indicating the field is required

@negative @registered
Scenario: Register New User with 'Ms.' Title, 'M' Gender, registered SSN, registered Email Address expecting an Error result
  Given Ainsley is a new customer
  When Ainsley navigates to the Registration page
  And they select 'Ms.' from the Title radio button
  And they enter 'Ainsley' into the First Name field
  And they enter 'Ortiz' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '07/09/1991' into the Date of Birth field
  And they enter 'existing' into the Social Security Number field
  And they enter 'existing' into the Email Address field
  And they enter 'SVrTFbTlynDnSO489' into the registration Password field
  And they enter 'SVrTFbTlynDnSO489' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Ainsley verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Ms.' Title, empty First Name expecting an Error result
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And they select 'Ms.' from the Title radio button
  And they enter '' into the First Name field
  And they navigate to the Contact Details page
  Then Kate verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mrs.' Title, 'F' Gender, empty SSN expecting an Error result
  Given Emilee is a new customer
  When Emilee navigates to the Registration page
  And they select 'Mrs.' from the Title radio button
  And they enter 'Emilee' into the First Name field
  And they enter 'Kirkland' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '12/01/1929' into the Date of Birth field
  And they enter '' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Emilee verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mrs.' Title, empty First Name expecting an Error result
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And they select 'Mrs.' from the Title radio button
  And they enter '' into the First Name field
  And they navigate to the Contact Details page
  Then Kate verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with no Title selected expecting an Error result
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And they select '' from the Title radio button
  And they navigate to the Contact Details page
  Then Kate verifies they are presented with a Error Message indicating the field is required