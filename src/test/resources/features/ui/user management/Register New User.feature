@ui @user @security @register
Feature: Register New User (UI)
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.


@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Email Address expecting an Error result
  Given Jacoby is a new customer
  When Jacoby navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Jacoby' into the First Name field
  And they enter 'Irwin' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '03/06/1926' into the Date of Birth field
  And they enter '895-64-8303' into the Social Security Number field
  And they enter '' into the Email Address field
  And they navigate to the Contact Details page
  Then Jacoby verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address with no at sign expecting an Error result
  Given Joel is a new customer
  When Joel navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Joel' into the First Name field
  And they enter 'Bruce' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/07/1982' into the Date of Birth field
  And they enter '101-16-7253' into the Social Security Number field
  And they enter 'Joel13025gmail.com' into the Email Address field
  And they navigate to the Contact Details page
  Then Joel verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address without domain expecting an Error result
  Given Ayden is a new customer
  When Ayden navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Ayden' into the First Name field
  And they enter 'Snow' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '05/06/1925' into the Date of Birth field
  And they enter '441-09-1873' into the Social Security Number field
  And they enter 'Ayden5988@' into the Email Address field
  And they navigate to the Contact Details page
  Then Ayden verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Confirm Password expecting an Error result
  Given Peter is a new customer
  When Peter navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Peter' into the First Name field
  And they enter 'Graham' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/21/1987' into the Date of Birth field
  And they enter '931-71-8903' into the Social Security Number field
  And they enter 'Peter6078@gmail.com' into the Email Address field
  And they enter 'fBiLwjIZbZ3' into the registration Password field
  And they enter '' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Peter verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, non-matching Confirm Password expecting an Error result
  Given Jarvis is a new customer
  When Jarvis navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Jarvis' into the First Name field
  And they enter 'Rivers' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/24/1997' into the Date of Birth field
  And they enter '860-70-6386' into the Social Security Number field
  And they enter 'Jarvis63393@gmail.com' into the Email Address field
  And they enter 'xNBOAperCryhsaygcKo56' into the registration Password field
  And they enter '' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Jarvis verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Region expecting an Error result
  Given Santino is a new customer
  When Santino navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Santino' into the First Name field
  And they enter 'Glenn' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/03/1982' into the Date of Birth field
  And they enter '998-61-8428' into the Social Security Number field
  And they enter 'Santino26281@gmail.com' into the Email Address field
  And they enter 'mNeHhTWNikcswT995' into the registration Password field
  And they enter 'mNeHhTWNikcswT995' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'URB ESTANCIAS DE TORTUQUERO CA' into the registration Address field
  And they enter 'Siloam springs' into the registration Locality field
  And they enter '' into the registration Region field
  And they submit the Registration request
  Then Santino verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Postal Code expecting an Error result
  Given Kylan is a new customer
  When Kylan navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Kylan' into the First Name field
  And they enter 'Mcclain' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '11/24/1989' into the Date of Birth field
  And they enter '101-97-7294' into the Social Security Number field
  And they enter 'Kylan427479@gmail.com' into the Email Address field
  And they enter 'gaDUBmVWOVj07187' into the registration Password field
  And they enter 'gaDUBmVWOVj07187' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'CALLE CONSEPCION VERA' into the registration Address field
  And they enter 'Long beach' into the registration Locality field
  And they enter 'CA' into the registration Region field
  And they enter '' into the registration Postal Code field
  And they submit the Registration request
  Then Kylan verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Country expecting an Error result
  Given Clayton is a new customer
  When Clayton navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Clayton' into the First Name field
  And they enter 'Moore' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '07/17/1992' into the Date of Birth field
  And they enter '395-17-9029' into the Social Security Number field
  And they enter 'Clayton37360@gmail.com' into the Email Address field
  And they enter 'jxAoqlEVFIloLKd4500' into the registration Password field
  And they enter 'jxAoqlEVFIloLKd4500' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'URB MIRADERO DELMAR #7 POB5103' into the registration Address field
  And they enter 'Karlstad' into the registration Locality field
  And they enter 'MN' into the registration Region field
  And they enter '56732' into the registration Postal Code field
  And they enter '' into the registration Country field
  And they submit the Registration request
  Then Clayton verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Home Phone expecting an Error result
  Given Ignacio is a new customer
  When Ignacio navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Ignacio' into the First Name field
  And they enter 'Mcdaniel' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '07/15/1962' into the Date of Birth field
  And they enter '592-49-8465' into the Social Security Number field
  And they enter 'Ignacio8102@gmail.com' into the Email Address field
  And they enter 'yiZAdGfHQyOECpQJNyMZ0532' into the registration Password field
  And they enter 'yiZAdGfHQyOECpQJNyMZ0532' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HC-01 BOX 2065' into the registration Address field
  And they enter 'Kerrville' into the registration Locality field
  And they enter 'TX' into the registration Region field
  And they enter '78029' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '' into the registration Home Phone field
  And they submit the Registration request
  Then Ignacio verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Home Phone expecting an Error result
  Given Charles is a new customer
  When Charles navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Charles' into the First Name field
  And they enter 'Salazar' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '07/21/1955' into the Date of Birth field
  And they enter '194-79-0445' into the Social Security Number field
  And they enter 'Charles07625@gmail.com' into the Email Address field
  And they enter 'ioohKcUtrThBOC8' into the registration Password field
  And they enter 'ioohKcUtrThBOC8' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HCS BOX 8548' into the registration Address field
  And they enter 'Greensboro' into the registration Locality field
  And they enter 'NC' into the registration Region field
  And they enter '27408' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '833898' into the registration Home Phone field
  And they submit the Registration request
  Then Charles verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Agree False expecting an Error result
  Given Skylar is a new customer
  When Skylar navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Skylar' into the First Name field
  And they enter 'Ashley' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '07/28/1935' into the Date of Birth field
  And they enter '832-73-7623' into the Social Security Number field
  And they enter 'Skylar41848@gmail.com' into the Email Address field
  And they enter 'NyUjlldxZvBTOXEfG7317' into the registration Password field
  And they enter 'NyUjlldxZvBTOXEfG7317' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'BO.LLANANDAS BUZON #33' into the registration Address field
  And they enter 'Portland' into the registration Locality field
  And they enter 'IN' into the registration Region field
  And they enter '47371' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '6052748963' into the registration Home Phone field
  And they enter '6052748963' into the registration Mobile Phone field
  And they enter '6052748963' into the registration Work Phone field
  And they select 'False' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Skylar verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Work Phone, Agree False expecting an Error result
  Given Francisco is a new customer
  When Francisco navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Francisco' into the First Name field
  And they enter 'Mayo' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '10/15/1961' into the Date of Birth field
  And they enter '214-93-3278' into the Social Security Number field
  And they enter 'Francisco71759@gmail.com' into the Email Address field
  And they enter 'FaJRCXZbeKBbBCg0' into the registration Password field
  And they enter 'FaJRCXZbeKBbBCg0' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'BOX 971' into the registration Address field
  And they enter 'Mc grath' into the registration Locality field
  And they enter 'AK' into the registration Region field
  And they enter '99627' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '9795956603' into the registration Home Phone field
  And they enter '9795956603' into the registration Mobile Phone field
  And they enter '' into the registration Work Phone field
  And they select 'False' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Francisco verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid Work Phone expecting an Error result
  Given Jaron is a new customer
  When Jaron navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Jaron' into the First Name field
  And they enter 'Matthews' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/29/1997' into the Date of Birth field
  And they enter '590-98-0540' into the Social Security Number field
  And they enter 'Jaron578766@gmail.com' into the Email Address field
  And they enter 'KzgUibokmkvc39259' into the registration Password field
  And they enter 'KzgUibokmkvc39259' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'P O  BOX 931' into the registration Address field
  And they enter 'Shafter' into the registration Locality field
  And they enter 'TX' into the registration Region field
  And they enter '79850' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '4241811677' into the registration Home Phone field
  And they enter '4241811677' into the registration Mobile Phone field
  And they enter '984317' into the registration Work Phone field
  And they submit the Registration request
  Then Jaron verifies they are presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, empty Work Phone expecting a Successful registration
  Given Josiah is a new customer
  When Josiah navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Josiah' into the First Name field
  And they enter 'Wong' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '08/12/1948' into the Date of Birth field
  And they enter '684-11-5546' into the Social Security Number field
  And they enter 'Josiah243133@gmail.com' into the Email Address field
  And they enter 'UARFoBPJjiksnfL23624' into the registration Password field
  And they enter 'UARFoBPJjiksnfL23624' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HC-01 BOX 11335' into the registration Address field
  And they enter 'Monango' into the registration Locality field
  And they enter 'ND' into the registration Region field
  And they enter '58471' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '6159277698' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '' into the registration Work Phone field
  And they select 'True' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Josiah verifies they are at the Login page
  And they verify they are presented with a Registration Success Message
  And they verify login Username contains Josiah243133@gmail.com
  And they enter 'UARFoBPJjiksnfL23624' into the login Password field
  And they submit the login request
  And they verify they are at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, invalid Work Phone expecting an Error result
  Given Warren is a new customer
  When Warren navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Warren' into the First Name field
  And they enter 'Knapp' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '12/02/1998' into the Date of Birth field
  And they enter '706-04-8161' into the Social Security Number field
  And they enter 'Warren0157@gmail.com' into the Email Address field
  And they enter 'MDAXItFtBK402' into the registration Password field
  And they enter 'MDAXItFtBK402' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HC 1 BOX 2366 BO CHUCHILLAS' into the registration Address field
  And they enter 'Chesapeake' into the registration Locality field
  And they enter 'VA' into the registration Region field
  And they enter '23322' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '6305707693' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '942419' into the registration Work Phone field
  And they submit the Registration request
  Then Warren verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Mobile Phone expecting an Error result
  Given Jaylon is a new customer
  When Jaylon navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Jaylon' into the First Name field
  And they enter 'Rutledge' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/30/1962' into the Date of Birth field
  And they enter '724-62-0849' into the Social Security Number field
  And they enter 'Jaylon0219@gmail.com' into the Email Address field
  And they enter 'bmIMczkwbRlyCHRST4670' into the registration Password field
  And they enter 'bmIMczkwbRlyCHRST4670' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'URB LOS VERSALLES 2049 CALLE L' into the registration Address field
  And they enter 'Ketchum' into the registration Locality field
  And they enter 'OK' into the registration Region field
  And they enter '74349' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '7342814027' into the registration Home Phone field
  And they enter '3969493' into the registration Mobile Phone field
  And they submit the Registration request
  Then Jaylon verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Locality expecting an Error result
  Given Dylan is a new customer
  When Dylan navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Dylan' into the First Name field
  And they enter 'Murphy' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '12/17/1981' into the Date of Birth field
  And they enter '567-85-2604' into the Social Security Number field
  And they enter 'Dylan404992@gmail.com' into the Email Address field
  And they enter 'yoRLRuMkFxNH40' into the registration Password field
  And they enter 'yoRLRuMkFxNH40' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'MANSIONES DE MONTE RREY CALLE' into the registration Address field
  And they enter '' into the registration Locality field
  And they submit the Registration request
  Then Dylan verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Address expecting an Error result
  Given Braiden is a new customer
  When Braiden navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Braiden' into the First Name field
  And they enter 'Justice' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '07/25/1964' into the Date of Birth field
  And they enter '966-75-2501' into the Social Security Number field
  And they enter 'Braiden73122@gmail.com' into the Email Address field
  And they enter 'VPXAkCwJLIOZmIupRCdX610' into the registration Password field
  And they enter 'VPXAkCwJLIOZmIupRCdX610' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter '' into the registration Address field
  And they submit the Registration request
  Then Braiden verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Password expecting an Error result
  Given Ralph is a new customer
  When Ralph navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Ralph' into the First Name field
  And they enter 'Farley' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/30/1937' into the Date of Birth field
  And they enter '606-02-0566' into the Social Security Number field
  And they enter 'Ralph450680@gmail.com' into the Email Address field
  And they enter '' into the registration Password field
  And they navigate to the Contact Details page
  Then Ralph verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password less than 8 characters expecting an Error result
  Given Grant is a new customer
  When Grant navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Grant' into the First Name field
  And they enter 'Vega' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '01/13/1969' into the Date of Birth field
  And they enter '921-38-9894' into the Social Security Number field
  And they enter 'Grant2159@gmail.com' into the Email Address field
  And they enter 'SpxJlI81' into the registration Password field
  And they navigate to the Contact Details page
  Then Grant verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no lowercase expecting an Error result
  Given Barrett is a new customer
  When Barrett navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Barrett' into the First Name field
  And they enter 'Burke' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/01/1943' into the Date of Birth field
  And they enter '824-58-0787' into the Social Security Number field
  And they enter 'Barrett659343@gmail.com' into the Email Address field
  And they enter 'ZAEYIGFOXJRMKQ17153' into the registration Password field
  And they navigate to the Contact Details page
  Then Barrett verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no numeric expecting an Error result
  Given Gonzalo is a new customer
  When Gonzalo navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Gonzalo' into the First Name field
  And they enter 'Bartlett' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '02/03/1978' into the Date of Birth field
  And they enter '043-59-8186' into the Social Security Number field
  And they enter 'Gonzalo45487@gmail.com' into the Email Address field
  And they enter 'BSFiicIMo' into the registration Password field
  And they navigate to the Contact Details page
  Then Gonzalo verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no upper expecting an Error result
  Given Donavan is a new customer
  When Donavan navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Donavan' into the First Name field
  And they enter 'Sanford' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/29/1936' into the Date of Birth field
  And they enter '039-62-3905' into the Social Security Number field
  And they enter 'Donavan77285@gmail.com' into the Email Address field
  And they enter 'ivvjidqvfpaylw43' into the registration Password field
  And they navigate to the Contact Details page
  Then Donavan verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered Email Address expecting an Error result
  Given Elliot is a new customer
  When Elliot navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Elliot' into the First Name field
  And they enter 'Cook' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '07/17/1949' into the Date of Birth field
  And they enter '548-21-8616' into the Social Security Number field
  And they enter 'jsmith@demo.io' into the Email Address field
  And they enter 'pITHpNDDtQlTV11974' into the registration Password field
  And they enter 'pITHpNDDtQlTV11974' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Elliot verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered SSN expecting an Error result
  Given Mohammed is a new customer
  When Mohammed navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Mohammed' into the First Name field
  And they enter 'Farmer' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '08/31/1988' into the Date of Birth field
  And they enter '123-45-6789' into the Social Security Number field
  And they enter 'Mohammed7663@gmail.com' into the Email Address field
  And they enter 'tsbkyhHTeksYnm92161' into the registration Password field
  And they enter 'tsbkyhHTeksYnm92161' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Mohammed verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty DoB expecting an Error result
  Given Omarion is a new customer
  When Omarion navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Omarion' into the First Name field
  And they enter 'Stuart' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Omarion verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid DoB expecting an Error result
  Given Lincoln is a new customer
  When Lincoln navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Lincoln' into the First Name field
  And they enter 'Page' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '1997-09-14p' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Lincoln verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN less than 9 digits expecting an Error result
  Given Raymond is a new customer
  When Raymond navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Raymond' into the First Name field
  And they enter 'Newman' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '04/14/1973' into the Date of Birth field
  And they enter '60040498' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Raymond verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN greater than 9 digits expecting an Error result
  Given Coby is a new customer
  When Coby navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Coby' into the First Name field
  And they enter 'Bates' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '12/17/1991' into the Date of Birth field
  And they enter '003703637223' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Coby verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN with invalid characters expecting an Error result
  Given Caleb is a new customer
  When Caleb navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Caleb' into the First Name field
  And they enter 'Sykes' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '07/02/1931' into the Date of Birth field
  And they enter '142$55$3388' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Caleb verifies they are presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty Mobile Phone expecting a Successful registration
  Given Randall is a new customer
  When Randall navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Randall' into the First Name field
  And they enter 'Hodges' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '01/14/1941' into the Date of Birth field
  And they enter '468-43-4508' into the Social Security Number field
  And they enter 'Randall8793@gmail.com' into the Email Address field
  And they enter 'yGHCmKcagkZUMqS25' into the registration Password field
  And they enter 'yGHCmKcagkZUMqS25' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HC-02 BOX 31225' into the registration Address field
  And they enter 'Lawndale' into the registration Locality field
  And they enter 'CA' into the registration Region field
  And they enter '90260' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '7193269803' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '7193269803' into the registration Work Phone field
  And they select 'True' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Randall verifies they are at the Login page
  And they verify they are presented with a Registration Success Message
  And they verify login Username contains Randall8793@gmail.com
  And they enter 'yGHCmKcagkZUMqS25' into the login Password field
  And they submit the login request
  And they verify they are at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty DoB expecting an Error result
  Given Draven is a new customer
  When Draven navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Draven' into the First Name field
  And they enter 'Murphy' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Draven verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, invalid DoB expecting an Error result
  Given Travis is a new customer
  When Travis navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Travis' into the First Name field
  And they enter 'Sweeney' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '1962-02-12xah' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Travis verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, Gender not selected expecting an Error result
  Given Davion is a new customer
  When Davion navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Davion' into the First Name field
  And they enter 'Banks' into the Last Name field
  And they select '' from the Gender radio button
  And they navigate to the Contact Details page
  Then Davion verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, empty Last Name expecting an Error result
  Given Perry is a new customer
  When Perry navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Perry' into the First Name field
  And they enter '' into the Last Name field
  And they navigate to the Contact Details page
  Then Perry verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, empty First Name expecting an Error result
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter '' into the First Name field
  And they navigate to the Contact Details page
  Then Kate verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Ms.' Title, 'M' Gender, registered SSN, registered Email Address expecting an Error result
  Given Joy is a new customer
  When Joy navigates to the Registration page
  And they select 'Ms.' from the Title radio button
  And they enter 'Joy' into the First Name field
  And they enter 'Gibson' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/29/1937' into the Date of Birth field
  And they enter '123-45-6789' into the Social Security Number field
  And they enter 'jsmith@demo.io' into the Email Address field
  And they enter 'QyuBUCcRHYyMMGdcUn30306' into the registration Password field
  And they enter 'QyuBUCcRHYyMMGdcUn30306' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Joy verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

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
  Given Celine is a new customer
  When Celine navigates to the Registration page
  And they select 'Mrs.' from the Title radio button
  And they enter 'Celine' into the First Name field
  And they enter 'Norris' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '04/17/1930' into the Date of Birth field
  And they enter '' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Celine verifies they are presented with a Error Message indicating the field is required

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