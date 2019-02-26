Feature: Register New User
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, empty Email Address
  Given Judah is a new customer
  When Judah navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Judah' into the First Name field
  And he or she enters 'Robinson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/17/1957' into the Date of Birth field
  And he or she enters '061-01-6224' into the Social Security Number field
  And he or she enters '' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Judah verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, Email Address with no at sign
  Given Justyn is a new customer
  When Justyn navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Justyn' into the First Name field
  And he or she enters 'Marsh' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/19/1929' into the Date of Birth field
  And he or she enters '527-36-5871' into the Social Security Number field
  And he or she enters 'Justyn.Marshdemo.io' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Justyn verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, Email Address without domain
  Given Keanu is a new customer
  When Keanu navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Keanu' into the First Name field
  And he or she enters 'Dudley' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/22/1947' into the Date of Birth field
  And he or she enters '186-81-8629' into the Social Security Number field
  And he or she enters 'Keanu.Dudley' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Keanu verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, empty Confirm Password
  Given Kareem is a new customer
  When Kareem navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kareem' into the First Name field
  And he or she enters 'Bryant' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/05/1950' into the Date of Birth field
  And he or she enters '950-68-0884' into the Social Security Number field
  And he or she enters 'Kareem.Bryant@demo.io' into the Email Address field
  And he or she enters 'jBnRPeqgQsOd152' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Kareem verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, non-matching Confirm Password
  Given Izaiah is a new customer
  When Izaiah navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Izaiah' into the First Name field
  And he or she enters 'Gilbert' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/05/1967' into the Date of Birth field
  And he or she enters '900-53-6245' into the Social Security Number field
  And he or she enters 'Izaiah.Gilbert@demo.io' into the Email Address field
  And he or she enters 'wIxjQTlIVMQmIeDZFY6993' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Izaiah verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, empty Region
  Given Kenny is a new customer
  When Kenny navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kenny' into the First Name field
  And he or she enters 'Decker' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/29/1956' into the Date of Birth field
  And he or she enters '616-79-1043' into the Social Security Number field
  And he or she enters 'Kenny.Decker@demo.io' into the Email Address field
  And he or she enters 'kqOzEggFbmUAwy30' into the registration Password field
  And he or she enters 'kqOzEggFbmUAwy30' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC-01 BOX 3333' into the registration Address field
  And he or she enters 'Harsens island' into the registration Locality field
  And he or she enters '' into the registration Region field
  And he or she submits the Registration request
  Then Kenny verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, empty Postal Code
  Given Maxim is a new customer
  When Maxim navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Maxim' into the First Name field
  And he or she enters 'Browning' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/14/1936' into the Date of Birth field
  And he or she enters '707-80-0468' into the Social Security Number field
  And he or she enters 'Maxim.Browning@demo.io' into the Email Address field
  And he or she enters 'fepcjDZVRcYwG87' into the registration Password field
  And he or she enters 'fepcjDZVRcYwG87' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB VILLA SERAL F-16' into the registration Address field
  And he or she enters 'Grand rivers' into the registration Locality field
  And he or she enters 'KY' into the registration Region field
  And he or she enters '' into the registration Postal Code field
  And he or she submits the Registration request
  Then Maxim verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, empty Country, valid Postal Code
  Given Dion is a new customer
  When Dion navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dion' into the First Name field
  And he or she enters 'Murray' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/03/1935' into the Date of Birth field
  And he or she enters '053-88-5877' into the Social Security Number field
  And he or she enters 'Dion.Murray@demo.io' into the Email Address field
  And he or she enters 'LrzlcWEyFKGtpNazYMcN2157' into the registration Password field
  And he or she enters 'LrzlcWEyFKGtpNazYMcN2157' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB LAS JARDINES CALLE FLOR' into the registration Address field
  And he or she enters 'Oklahoma city' into the registration Locality field
  And he or she enters 'OK' into the registration Region field
  And he or she enters '73141' into the registration Postal Code field
  And he or she enters '' into the registration Country field
  And he or she submits the Registration request
  Then Dion verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, empty Home Phone
  Given Benjamin is a new customer
  When Benjamin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Benjamin' into the First Name field
  And he or she enters 'Rosales' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/04/1983' into the Date of Birth field
  And he or she enters '218-55-3968' into the Social Security Number field
  And he or she enters 'Benjamin.Rosales@demo.io' into the Email Address field
  And he or she enters 'QCzZQXByMznJkX08241' into the registration Password field
  And he or she enters 'QCzZQXByMznJkX08241' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BOX 971' into the registration Address field
  And he or she enters 'Paisley' into the registration Locality field
  And he or she enters 'FL' into the registration Region field
  And he or she enters '32767' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '' into the registration Home Phone field
  And he or she submits the Registration request
  Then Benjamin verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, Invalid Home Phone
  Given Kent is a new customer
  When Kent navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kent' into the First Name field
  And he or she enters 'Nolan' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/08/1945' into the Date of Birth field
  And he or she enters '860-55-8804' into the Social Security Number field
  And he or she enters 'Kent.Nolan@demo.io' into the Email Address field
  And he or she enters 'PZwrodVzSpwVjBFeR95428' into the registration Password field
  And he or she enters 'PZwrodVzSpwVjBFeR95428' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BDA TOMEI CALLE B #34' into the registration Address field
  And he or she enters 'Plano' into the registration Locality field
  And he or she enters 'TX' into the registration Region field
  And he or she enters '75094' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '2942268' into the registration Home Phone field
  And he or she submits the Registration request
  Then Kent verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, valid Wo...
  Given Salvador is a new customer
  When Salvador navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Salvador' into the First Name field
  And he or she enters 'Coffey' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/04/1924' into the Date of Birth field
  And he or she enters '650-61-0615' into the Social Security Number field
  And he or she enters 'Salvador.Coffey@demo.io' into the Email Address field
  And he or she enters 'vqnRaOFeHD76415' into the registration Password field
  And he or she enters 'vqnRaOFeHD76415' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB ALTA VISTA CALLE CIPRES 10' into the registration Address field
  And he or she enters 'Minneapolis' into the registration Locality field
  And he or she enters 'MN' into the registration Region field
  And he or she enters '55437' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '3863645429' into the registration Home Phone field
  And he or she enters '3863645429' into the registration Mobile Phone field
  And he or she enters '3863645429' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Salvador verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, empty Wo...
  Given Javier is a new customer
  When Javier navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Javier' into the First Name field
  And he or she enters 'Bass' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/16/1947' into the Date of Birth field
  And he or she enters '281-99-2219' into the Social Security Number field
  And he or she enters 'Javier.Bass@demo.io' into the Email Address field
  And he or she enters 'dGdnQchEQmaSNOoQMeuw169' into the registration Password field
  And he or she enters 'dGdnQchEQmaSNOoQMeuw169' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC-02 BOX 6299' into the registration Address field
  And he or she enters 'Groton' into the registration Locality field
  And he or she enters 'VT' into the registration Region field
  And he or she enters '50460' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '7644271493' into the registration Home Phone field
  And he or she enters '7644271493' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Javier verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, invalid ...
  Given Michael is a new customer
  When Michael navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Michael' into the First Name field
  And he or she enters 'Page' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/22/1930' into the Date of Birth field
  And he or she enters '334-53-5901' into the Social Security Number field
  And he or she enters 'Michael.Page@demo.io' into the Email Address field
  And he or she enters 'FJAHATIWmBFqbmJqLe47' into the registration Password field
  And he or she enters 'FJAHATIWmBFqbmJqLe47' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BOX 8651' into the registration Address field
  And he or she enters 'Glouster' into the registration Locality field
  And he or she enters 'OH' into the registration Region field
  And he or she enters '45732' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '5024313742' into the registration Home Phone field
  And he or she enters '5024313742' into the registration Mobile Phone field
  And he or she enters '8' into the registration Work Phone field
  And he or she submits the Registration request
  Then Michael verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, empty Wo...
  Given Dwayne is a new customer
  When Dwayne navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dwayne' into the First Name field
  And he or she enters 'Cabrera' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/21/1937' into the Date of Birth field
  And he or she enters '593-94-9603' into the Social Security Number field
  And he or she enters 'Dwayne.Cabrera@demo.io' into the Email Address field
  And he or she enters 'vdqjyoeqaNVdM6' into the registration Password field
  And he or she enters 'vdqjyoeqaNVdM6' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'ALTURAS DEL CAFETAL CALL SAME' into the registration Address field
  And he or she enters 'El paso' into the registration Locality field
  And he or she enters 'TX' into the registration Region field
  And he or she enters '88553' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '5148005165' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Dwayne verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, invalid ...
  Given Marquis is a new customer
  When Marquis navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Marquis' into the First Name field
  And he or she enters 'Calhoun' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/11/1941' into the Date of Birth field
  And he or she enters '505-23-9480' into the Social Security Number field
  And he or she enters 'Marquis.Calhoun@demo.io' into the Email Address field
  And he or she enters 'LbUIOGQdNWU60669' into the registration Password field
  And he or she enters 'LbUIOGQdNWU60669' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'ARBOUR LAKE 900 BRBOUR LAKE RD' into the registration Address field
  And he or she enters 'Lusby' into the registration Locality field
  And he or she enters 'MD' into the registration Region field
  And he or she enters '20657' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '3126489966' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '576475' into the registration Work Phone field
  And he or she submits the Registration request
  Then Marquis verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, Invalid Mobile Phone
  Given Garett is a new customer
  When Garett navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Garett' into the First Name field
  And he or she enters 'Olson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/08/1924' into the Date of Birth field
  And he or she enters '435-30-9190' into the Social Security Number field
  And he or she enters 'Garett.Olson@demo.io' into the Email Address field
  And he or she enters 'MhkUDkKuIYvwKGWla93' into the registration Password field
  And he or she enters 'MhkUDkKuIYvwKGWla93' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '1105 BAUDRICOURT' into the registration Address field
  And he or she enters 'Lenzburg' into the registration Locality field
  And he or she enters 'IL' into the registration Region field
  And he or she enters '62255' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '3309506861' into the registration Home Phone field
  And he or she enters '36170' into the registration Mobile Phone field
  And he or she submits the Registration request
  Then Garett verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, empty Locality
  Given Devan is a new customer
  When Devan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Devan' into the First Name field
  And he or she enters 'Pate' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '06/18/1976' into the Date of Birth field
  And he or she enters '112-92-0673' into the Social Security Number field
  And he or she enters 'Devan.Pate@demo.io' into the Email Address field
  And he or she enters 'kohxPnaAhxGcf735' into the registration Password field
  And he or she enters 'kohxPnaAhxGcf735' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC 91 BOX 8950' into the registration Address field
  And he or she enters '' into the registration Locality field
  And he or she submits the Registration request
  Then Devan verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, empty Address
  Given Alvaro is a new customer
  When Alvaro navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Alvaro' into the First Name field
  And he or she enters 'Porter' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/20/1989' into the Date of Birth field
  And he or she enters '400-27-1435' into the Social Security Number field
  And he or she enters 'Alvaro.Porter@demo.io' into the Email Address field
  And he or she enters 'pbJpBhupPLckbPtdqr1024' into the registration Password field
  And he or she enters 'pbJpBhupPLckbPtdqr1024' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '' into the registration Address field
  And he or she submits the Registration request
  Then Alvaro verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, empty Password
  Given Korey is a new customer
  When Korey navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Korey' into the First Name field
  And he or she enters 'Campbell' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/07/1991' into the Date of Birth field
  And he or she enters '436-40-9860' into the Social Security Number field
  And he or she enters 'Korey.Campbell@demo.io' into the Email Address field
  And he or she enters '' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Korey verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password less than 8 characters
  Given Jackson is a new customer
  When Jackson navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jackson' into the First Name field
  And he or she enters 'Harper' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/20/1982' into the Date of Birth field
  And he or she enters '269-61-0628' into the Social Security Number field
  And he or she enters 'Jackson.Harper@demo.io' into the Email Address field
  And he or she enters 'YBs84564' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Jackson verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no lowercase
  Given Ronald is a new customer
  When Ronald navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Ronald' into the First Name field
  And he or she enters 'Cherry' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/13/1943' into the Date of Birth field
  And he or she enters '493-77-2463' into the Social Security Number field
  And he or she enters 'Ronald.Cherry@demo.io' into the Email Address field
  And he or she enters 'TQENEGORM1251' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Ronald verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no numeric
  Given Gael is a new customer
  When Gael navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Gael' into the First Name field
  And he or she enters 'Shannon' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/23/1978' into the Date of Birth field
  And he or she enters '521-99-1361' into the Social Security Number field
  And he or she enters 'Gael.Shannon@demo.io' into the Email Address field
  And he or she enters 'lbCpPAyCRcfBNO' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Gael verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no upper
  Given Grant is a new customer
  When Grant navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Grant' into the First Name field
  And he or she enters 'Oneill' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/31/1945' into the Date of Birth field
  And he or she enters '185-70-5727' into the Social Security Number field
  And he or she enters 'Grant.Oneill@demo.io' into the Email Address field
  And he or she enters 'mffhsnufayxwpp82' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Grant verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, registered Email Address, valid Password, matching Confirm Password
  Given Austen is a new customer
  When Austen navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Austen' into the First Name field
  And he or she enters 'Goodwin' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/03/1976' into the Date of Birth field
  And he or she enters '769-68-8828' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'VpbvMdphUeTQ43' into the registration Password field
  And he or she enters 'VpbvMdphUeTQ43' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Austen verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, registered SSN, valid Email Address, valid Password, matching Confirm Password
  Given Ayden is a new customer
  When Ayden navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Ayden' into the First Name field
  And he or she enters 'Frederick' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '06/03/1982' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'Ayden.Frederick@demo.io' into the Email Address field
  And he or she enters 'dfqeeQccjWYmFtAkCfe50' into the registration Password field
  And he or she enters 'dfqeeQccjWYmFtAkCfe50' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Ayden verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, empty DoB
  Given Conrad is a new customer
  When Conrad navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Conrad' into the First Name field
  And he or she enters 'Hale' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Conrad verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, invalid DoB
  Given Gaven is a new customer
  When Gaven navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Gaven' into the First Name field
  And he or she enters 'Farrell' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '1939-11-27cp' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Gaven verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN less than 9 digits
  Given Gunner is a new customer
  When Gunner navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Gunner' into the First Name field
  And he or she enters 'Jensen' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '04/06/1952' into the Date of Birth field
  And he or she enters '0661' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Gunner verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN greater than 9 digits
  Given Simon is a new customer
  When Simon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Simon' into the First Name field
  And he or she enters 'Atkins' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '06/21/1956' into the Date of Birth field
  And he or she enters '574812703357962' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Simon verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN with invalid characters
  Given Vaughn is a new customer
  When Vaughn navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Vaughn' into the First Name field
  And he or she enters 'Benjamin' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '12/02/1950' into the Date of Birth field
  And he or she enters '866$39$3439' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Vaughn verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, valid ...
  Given Lawrence is a new customer
  When Lawrence navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Lawrence' into the First Name field
  And he or she enters 'Cross' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '02/28/1940' into the Date of Birth field
  And he or she enters '254-34-5161' into the Social Security Number field
  And he or she enters 'Lawrence.Cross@demo.io' into the Email Address field
  And he or she enters 'PRgVUjRvvmT062' into the registration Password field
  And he or she enters 'PRgVUjRvvmT062' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALLE CIPRES ARIZONA #196' into the registration Address field
  And he or she enters 'East stoneham' into the registration Locality field
  And he or she enters 'ME' into the registration Region field
  And he or she enters '42310' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '9104094164' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '9104094164' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Lawrence verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, empty DoB
  Given Omarion is a new customer
  When Omarion navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Omarion' into the First Name field
  And he or she enters 'Wilkerson' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Omarion verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, invalid DoB
  Given Griffin is a new customer
  When Griffin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Griffin' into the First Name field
  And he or she enters 'Klein' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '1938-06-25sm' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Griffin verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, no Gender selected
  Given Dennis is a new customer
  When Dennis navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dennis' into the First Name field
  And he or she enters 'Gonzalez' into the Last Name field
  And he or she selects '' from the Gender radio button
  And he or she navigates to the Contact Details page
  Then Dennis verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, empty Last Name
  Given Caden is a new customer
  When Caden navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Caden' into the First Name field
  And he or she enters '' into the Last Name field
  And he or she navigates to the Contact Details page
  Then Caden verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Ms., valid First Name, valid Last Name, male Gender, valid DoB, registered SSN, registered Email Address, valid Password, matching Confirm Password
  Given Cristina is a new customer
  When Cristina navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters 'Cristina' into the First Name field
  And he or she enters 'Hansen' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/06/1949' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'UBwsIUFom482' into the registration Password field
  And he or she enters 'UBwsIUFom482' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Cristina verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

Scenario: Register user with valid Title Ms., empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mrs., valid First Name, valid Last Name, female Gender, valid DoB, empty SSN
  Given Meaghan is a new customer
  When Meaghan navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters 'Meaghan' into the First Name field
  And he or she enters 'Newman' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '03/11/1976' into the Date of Birth field
  And he or she enters '' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Meaghan verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mrs., empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with no Title selected
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects '' from the Title radio button
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required
