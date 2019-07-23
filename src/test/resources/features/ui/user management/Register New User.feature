@ui @user @security @register
Feature: Register New User (UI)
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.


@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Email Address expecting an Error result
  Given Mark is a new customer
  When Mark navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Mark' into the First Name field
  And he or she enters 'Holcomb' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/03/1996' into the Date of Birth field
  And he or she enters '657-91-8811' into the Social Security Number field
  And he or she enters '' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Mark verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address with no at sign expecting an Error result
  Given Derrick is a new customer
  When Derrick navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Derrick' into the First Name field
  And he or she enters 'Stanley' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/13/1933' into the Date of Birth field
  And he or she enters '395-33-2206' into the Social Security Number field
  And he or she enters 'Derrick.Stanleydemo.io' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Derrick verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address without domain expecting an Error result
  Given Phoenix is a new customer
  When Phoenix navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Phoenix' into the First Name field
  And he or she enters 'Mercer' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/02/1961' into the Date of Birth field
  And he or she enters '156-57-4845' into the Social Security Number field
  And he or she enters 'Phoenix.Mercer' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Phoenix verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Confirm Password expecting an Error result
  Given Agustin is a new customer
  When Agustin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Agustin' into the First Name field
  And he or she enters 'Camacho' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/16/1938' into the Date of Birth field
  And he or she enters '645-12-2409' into the Social Security Number field
  And he or she enters 'Agustin.Camacho@demo.io' into the Email Address field
  And he or she enters 'sdbwVGaK038' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Agustin verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, non-matching Confirm Password expecting an Error result
  Given Zachary is a new customer
  When Zachary navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Zachary' into the First Name field
  And he or she enters 'Adkins' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/10/1968' into the Date of Birth field
  And he or she enters '485-26-4115' into the Social Security Number field
  And he or she enters 'Zachary.Adkins@demo.io' into the Email Address field
  And he or she enters 'TVJiPWiv82606' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Zachary verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Region expecting an Error result
  Given Jon is a new customer
  When Jon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jon' into the First Name field
  And he or she enters 'Ruiz' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/04/1933' into the Date of Birth field
  And he or she enters '180-57-3916' into the Social Security Number field
  And he or she enters 'Jon.Ruiz@demo.io' into the Email Address field
  And he or she enters 'oJwcuedXMBkuOKeZA4' into the registration Password field
  And he or she enters 'oJwcuedXMBkuOKeZA4' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'RES PADRE NAZARIO EDF 7 APT 55' into the registration Address field
  And he or she enters 'Greenville' into the registration Locality field
  And he or she enters '' into the registration Region field
  And he or she submits the Registration request
  Then Jon verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Postal Code expecting an Error result
  Given Tyler is a new customer
  When Tyler navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Tyler' into the First Name field
  And he or she enters 'Gray' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/06/1934' into the Date of Birth field
  And he or she enters '587-36-1970' into the Social Security Number field
  And he or she enters 'Tyler.Gray@demo.io' into the Email Address field
  And he or she enters 'MRiVUKVhcRkFgf02' into the registration Password field
  And he or she enters 'MRiVUKVhcRkFgf02' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '91-E ALTURAS SABANERAS' into the registration Address field
  And he or she enters 'Mobile' into the registration Locality field
  And he or she enters 'AL' into the registration Region field
  And he or she enters '' into the registration Postal Code field
  And he or she submits the Registration request
  Then Tyler verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Country expecting an Error result
  Given Terrence is a new customer
  When Terrence navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Terrence' into the First Name field
  And he or she enters 'Zimmerman' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/07/1937' into the Date of Birth field
  And he or she enters '189-13-7597' into the Social Security Number field
  And he or she enters 'Terrence.Zimmerman@demo.io' into the Email Address field
  And he or she enters 'nrWLJIxEjLHSEf0161' into the registration Password field
  And he or she enters 'nrWLJIxEjLHSEf0161' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC-01 BOX 8660' into the registration Address field
  And he or she enters 'Livonia' into the registration Locality field
  And he or she enters 'MI' into the registration Region field
  And he or she enters '48151' into the registration Postal Code field
  And he or she enters '' into the registration Country field
  And he or she submits the Registration request
  Then Terrence verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Home Phone expecting an Error result
  Given Walker is a new customer
  When Walker navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Walker' into the First Name field
  And he or she enters 'Burke' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/12/1976' into the Date of Birth field
  And he or she enters '677-10-7414' into the Social Security Number field
  And he or she enters 'Walker.Burke@demo.io' into the Email Address field
  And he or she enters 'zGLVkPfNmYDj70370' into the registration Password field
  And he or she enters 'zGLVkPfNmYDj70370' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC 01 BOX 4704' into the registration Address field
  And he or she enters 'Conetoe' into the registration Locality field
  And he or she enters 'NC' into the registration Region field
  And he or she enters '27819' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '' into the registration Home Phone field
  And he or she submits the Registration request
  Then Walker verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Home Phone expecting an Error result
  Given Danny is a new customer
  When Danny navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Danny' into the First Name field
  And he or she enters 'William' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/02/1924' into the Date of Birth field
  And he or she enters '613-70-0777' into the Social Security Number field
  And he or she enters 'Danny.William@demo.io' into the Email Address field
  And he or she enters 'OljBFSYsreFyXYNrRU7' into the registration Password field
  And he or she enters 'OljBFSYsreFyXYNrRU7' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BUZON 237' into the registration Address field
  And he or she enters 'Eagle' into the registration Locality field
  And he or she enters 'ID' into the registration Region field
  And he or she enters '83616' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '554599' into the registration Home Phone field
  And he or she submits the Registration request
  Then Danny verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Agree False expecting an Error result
  Given Salvatore is a new customer
  When Salvatore navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Salvatore' into the First Name field
  And he or she enters 'Tate' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/02/1958' into the Date of Birth field
  And he or she enters '907-63-9019' into the Social Security Number field
  And he or she enters 'Salvatore.Tate@demo.io' into the Email Address field
  And he or she enters 'tyQsUsdVSA88' into the registration Password field
  And he or she enters 'tyQsUsdVSA88' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALL BOX 2020 STE 100' into the registration Address field
  And he or she enters 'Letcher' into the registration Locality field
  And he or she enters 'SD' into the registration Region field
  And he or she enters '57359' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '7046169879' into the registration Home Phone field
  And he or she enters '7046169879' into the registration Mobile Phone field
  And he or she enters '7046169879' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Salvatore verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Work Phone, Agree False expecting an Error result
  Given Jonatan is a new customer
  When Jonatan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jonatan' into the First Name field
  And he or she enters 'Atkinson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/31/1951' into the Date of Birth field
  And he or she enters '018-50-7822' into the Social Security Number field
  And he or she enters 'Jonatan.Atkinson@demo.io' into the Email Address field
  And he or she enters 'KEpzOSNaJvcGNtySfr82' into the registration Password field
  And he or she enters 'KEpzOSNaJvcGNtySfr82' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALLE DAVID LOPEZ #95' into the registration Address field
  And he or she enters 'Ralph' into the registration Locality field
  And he or she enters 'MI' into the registration Region field
  And he or she enters '49877' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '9859799869' into the registration Home Phone field
  And he or she enters '9859799869' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Jonatan verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid Work Phone expecting an Error result
  Given Ignacio is a new customer
  When Ignacio navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Ignacio' into the First Name field
  And he or she enters 'Peterson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/31/1987' into the Date of Birth field
  And he or she enters '918-23-8402' into the Social Security Number field
  And he or she enters 'Ignacio.Peterson@demo.io' into the Email Address field
  And he or she enters 'bGHxxDoc5785' into the registration Password field
  And he or she enters 'bGHxxDoc5785' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'P O  BOX 7000 SUITE 027' into the registration Address field
  And he or she enters 'Marvin' into the registration Locality field
  And he or she enters 'SD' into the registration Region field
  And he or she enters '57251' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '8284704210' into the registration Home Phone field
  And he or she enters '8284704210' into the registration Mobile Phone field
  And he or she enters '78402655' into the registration Work Phone field
  And he or she submits the Registration request
  Then Ignacio verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, empty Work Phone expecting a Successful registration
  Given Duncan is a new customer
  When Duncan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Duncan' into the First Name field
  And he or she enters 'Davidson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/18/1990' into the Date of Birth field
  And he or she enters '642-93-9290' into the Social Security Number field
  And he or she enters 'Duncan.Davidson@demo.io' into the Email Address field
  And he or she enters 'SXsRXVzvU21954' into the registration Password field
  And he or she enters 'SXsRXVzvU21954' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CARR 174 KM 22.05' into the registration Address field
  And he or she enters 'Gladwin' into the registration Locality field
  And he or she enters 'MI' into the registration Region field
  And he or she enters '48624' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '5593414224' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Duncan verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Duncan.Davidson@demo.io
  And he or she enters 'SXsRXVzvU21954' into the login Password field
  And he or she submits the login request
  And he or she verifies he or she is at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, invalid Work Phone expecting an Error result
  Given Jayce is a new customer
  When Jayce navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jayce' into the First Name field
  And he or she enters 'Ayala' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/16/1926' into the Date of Birth field
  And he or she enters '429-92-7058' into the Social Security Number field
  And he or she enters 'Jayce.Ayala@demo.io' into the Email Address field
  And he or she enters 'AdCUkSXjqtbBQqpRxi296' into the registration Password field
  And he or she enters 'AdCUkSXjqtbBQqpRxi296' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BUZON 8383' into the registration Address field
  And he or she enters 'Peebles' into the registration Locality field
  And he or she enters 'OH' into the registration Region field
  And he or she enters '45660' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '7036101301' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '271080335' into the registration Work Phone field
  And he or she submits the Registration request
  Then Jayce verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Mobile Phone expecting an Error result
  Given Khalid is a new customer
  When Khalid navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Khalid' into the First Name field
  And he or she enters 'Thompson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/31/1978' into the Date of Birth field
  And he or she enters '808-41-8603' into the Social Security Number field
  And he or she enters 'Khalid.Thompson@demo.io' into the Email Address field
  And he or she enters 'ZjJbsDCIdJN703' into the registration Password field
  And he or she enters 'ZjJbsDCIdJN703' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'P O  BOX 3394' into the registration Address field
  And he or she enters 'New london' into the registration Locality field
  And he or she enters 'OH' into the registration Region field
  And he or she enters '44851' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '2469342577' into the registration Home Phone field
  And he or she enters '23298875' into the registration Mobile Phone field
  And he or she submits the Registration request
  Then Khalid verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Locality expecting an Error result
  Given Keshawn is a new customer
  When Keshawn navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Keshawn' into the First Name field
  And he or she enters 'Tate' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/08/1928' into the Date of Birth field
  And he or she enters '657-21-5705' into the Social Security Number field
  And he or she enters 'Keshawn.Tate@demo.io' into the Email Address field
  And he or she enters 'EFWZDmrZzuX07' into the registration Password field
  And he or she enters 'EFWZDmrZzuX07' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BOX 531' into the registration Address field
  And he or she enters '' into the registration Locality field
  And he or she submits the Registration request
  Then Keshawn verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Address expecting an Error result
  Given Amari is a new customer
  When Amari navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Amari' into the First Name field
  And he or she enters 'Gordon' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/12/1946' into the Date of Birth field
  And he or she enters '970-77-1603' into the Social Security Number field
  And he or she enters 'Amari.Gordon@demo.io' into the Email Address field
  And he or she enters 'HwocapFUXhNdtRtHD64916' into the registration Password field
  And he or she enters 'HwocapFUXhNdtRtHD64916' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '' into the registration Address field
  And he or she submits the Registration request
  Then Amari verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Password expecting an Error result
  Given Darin is a new customer
  When Darin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Darin' into the First Name field
  And he or she enters 'Baxter' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/30/1964' into the Date of Birth field
  And he or she enters '470-77-3941' into the Social Security Number field
  And he or she enters 'Darin.Baxter@demo.io' into the Email Address field
  And he or she enters '' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Darin verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password less than 8 characters expecting an Error result
  Given Logan is a new customer
  When Logan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Logan' into the First Name field
  And he or she enters 'Huber' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/14/1926' into the Date of Birth field
  And he or she enters '873-48-1492' into the Social Security Number field
  And he or she enters 'Logan.Huber@demo.io' into the Email Address field
  And he or she enters 'ZQanlqR46843' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Logan verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no lowercase expecting an Error result
  Given Travis is a new customer
  When Travis navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Travis' into the First Name field
  And he or she enters 'Gross' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/05/1996' into the Date of Birth field
  And he or she enters '289-68-0293' into the Social Security Number field
  And he or she enters 'Travis.Gross@demo.io' into the Email Address field
  And he or she enters 'TOKLBGEORFWOPXSZUOFK96878' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Travis verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no numeric expecting an Error result
  Given Antoine is a new customer
  When Antoine navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Antoine' into the First Name field
  And he or she enters 'Wilkerson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/30/1979' into the Date of Birth field
  And he or she enters '466-29-3379' into the Social Security Number field
  And he or she enters 'Antoine.Wilkerson@demo.io' into the Email Address field
  And he or she enters 'KVqUdAYVAzoj' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Antoine verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no upper expecting an Error result
  Given Deshaun is a new customer
  When Deshaun navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Deshaun' into the First Name field
  And he or she enters 'Marsh' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/14/1960' into the Date of Birth field
  And he or she enters '047-19-2368' into the Social Security Number field
  And he or she enters 'Deshaun.Marsh@demo.io' into the Email Address field
  And he or she enters 'usblpgqbu30876' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Deshaun verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered Email Address expecting an Error result
  Given Jaquez is a new customer
  When Jaquez navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jaquez' into the First Name field
  And he or she enters 'Sampson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/25/1947' into the Date of Birth field
  And he or she enters '648-56-4459' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'PLLOrCNgaglyOUppFpz5406' into the registration Password field
  And he or she enters 'PLLOrCNgaglyOUppFpz5406' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Jaquez verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered SSN expecting an Error result
  Given Omar is a new customer
  When Omar navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Omar' into the First Name field
  And he or she enters 'Santana' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/17/1940' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'Omar.Santana@demo.io' into the Email Address field
  And he or she enters 'DcUDfuOdBKCiheGH067' into the registration Password field
  And he or she enters 'DcUDfuOdBKCiheGH067' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Omar verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty DoB expecting an Error result
  Given Dwight is a new customer
  When Dwight navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dwight' into the First Name field
  And he or she enters 'Atkins' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Dwight verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid DoB expecting an Error result
  Given Drake is a new customer
  When Drake navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Drake' into the First Name field
  And he or she enters 'Sawyer' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '1946-12-01ofx' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Drake verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN less than 9 digits expecting an Error result
  Given Nicolas is a new customer
  When Nicolas navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Nicolas' into the First Name field
  And he or she enters 'Glenn' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '01/17/1996' into the Date of Birth field
  And he or she enters '4' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Nicolas verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN greater than 9 digits expecting an Error result
  Given Khalil is a new customer
  When Khalil navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Khalil' into the First Name field
  And he or she enters 'Lynch' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '06/26/1941' into the Date of Birth field
  And he or she enters '6621410207' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Khalil verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN with invalid characters expecting an Error result
  Given Nico is a new customer
  When Nico navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Nico' into the First Name field
  And he or she enters 'Dunn' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '01/03/1990' into the Date of Birth field
  And he or she enters '002$35$7074' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Nico verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty Mobile Phone expecting a Successful registration
  Given Jeff is a new customer
  When Jeff navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jeff' into the First Name field
  And he or she enters 'Lynn' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '02/06/1941' into the Date of Birth field
  And he or she enters '973-74-6038' into the Social Security Number field
  And he or she enters 'Jeff.Lynn@demo.io' into the Email Address field
  And he or she enters 'DEEgRPASJoYDQiXNbH6' into the registration Password field
  And he or she enters 'DEEgRPASJoYDQiXNbH6' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'P. O. BOX 3292' into the registration Address field
  And he or she enters 'Kerby' into the registration Locality field
  And he or she enters 'OR' into the registration Region field
  And he or she enters '97531' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '9797612806' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '9797612806' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Jeff verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Jeff.Lynn@demo.io
  And he or she enters 'DEEgRPASJoYDQiXNbH6' into the login Password field
  And he or she submits the login request
  And he or she verifies he or she is at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty DoB expecting an Error result
  Given Corbin is a new customer
  When Corbin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Corbin' into the First Name field
  And he or she enters 'Hester' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Corbin verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, invalid DoB expecting an Error result
  Given Kenneth is a new customer
  When Kenneth navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kenneth' into the First Name field
  And he or she enters 'Sanchez' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '1949-07-16qc' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Kenneth verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, Gender not selected expecting an Error result
  Given Immanuel is a new customer
  When Immanuel navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Immanuel' into the First Name field
  And he or she enters 'Fisher' into the Last Name field
  And he or she selects '' from the Gender radio button
  And he or she navigates to the Contact Details page
  Then Immanuel verifies he or she is presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, empty Last Name expecting an Error result
  Given Treyton is a new customer
  When Treyton navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Treyton' into the First Name field
  And he or she enters '' into the Last Name field
  And he or she navigates to the Contact Details page
  Then Treyton verifies he or she is presented with a Error Message indicating the field is required

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
  Given Elyssa is a new customer
  When Elyssa navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters 'Elyssa' into the First Name field
  And he or she enters 'Solomon' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/17/1944' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'EjiIFnPQYhv39532' into the registration Password field
  And he or she enters 'EjiIFnPQYhv39532' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Elyssa verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

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
  Given Tamara is a new customer
  When Tamara navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters 'Tamara' into the First Name field
  And he or she enters 'Tillman' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '09/22/1964' into the Date of Birth field
  And he or she enters '' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Tamara verifies he or she is presented with a Error Message indicating the field is required

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