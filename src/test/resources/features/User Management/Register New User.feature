@ui, @user, @registration
Feature: Register New User
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.



Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, empty Email Address
  Given Manuel is a new customer
  When Manuel navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Manuel' into the First Name field
  And he or she enters 'Odonnell' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/08/1929' into the Date of Birth field
  And he or she enters '348-19-2713' into the Social Security Number field
  And he or she enters '' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Manuel verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, Email Address with no at sign
  Given Domenic is a new customer
  When Domenic navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Domenic' into the First Name field
  And he or she enters 'Hudson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/08/1999' into the Date of Birth field
  And he or she enters '954-33-8930' into the Social Security Number field
  And he or she enters 'Domenic.Hudsondemo.io' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Domenic verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, Email Address without domain
  Given Kyree is a new customer
  When Kyree navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kyree' into the First Name field
  And he or she enters 'Schroeder' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/02/1944' into the Date of Birth field
  And he or she enters '618-23-9981' into the Social Security Number field
  And he or she enters 'Kyree.Schroeder' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Kyree verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, empty Confirm Password
  Given Haden is a new customer
  When Haden navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Haden' into the First Name field
  And he or she enters 'Pollard' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/24/1964' into the Date of Birth field
  And he or she enters '048-61-4108' into the Social Security Number field
  And he or she enters 'Haden.Pollard@demo.io' into the Email Address field
  And he or she enters 'gzbsWZXPz928' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Haden verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, non-matching Confirm Password
  Given Kellen is a new customer
  When Kellen navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kellen' into the First Name field
  And he or she enters 'Callahan' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/07/1941' into the Date of Birth field
  And he or she enters '288-88-9801' into the Social Security Number field
  And he or she enters 'Kellen.Callahan@demo.io' into the Email Address field
  And he or she enters 'YxghuZyvmoKCaBOtf90' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Kellen verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, empty Region
  Given Maximilian is a new customer
  When Maximilian navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Maximilian' into the First Name field
  And he or she enters 'Cochran' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/30/1990' into the Date of Birth field
  And he or she enters '558-85-1643' into the Social Security Number field
  And he or she enters 'Maximilian.Cochran@demo.io' into the Email Address field
  And he or she enters 'pRKTGrYeSHScvFixch040' into the registration Password field
  And he or she enters 'pRKTGrYeSHScvFixch040' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BO MANI CALLE LA VIA #9' into the registration Address field
  And he or she enters 'Cumberland' into the registration Locality field
  And he or she enters '' into the registration Region field
  And he or she submits the Registration request
  Then Maximilian verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, empty Postal Code
  Given Danny is a new customer
  When Danny navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Danny' into the First Name field
  And he or she enters 'Walter' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/27/1994' into the Date of Birth field
  And he or she enters '482-98-0169' into the Social Security Number field
  And he or she enters 'Danny.Walter@demo.io' into the Email Address field
  And he or she enters 'gYsDNGmOilSVJonu358' into the registration Password field
  And he or she enters 'gYsDNGmOilSVJonu358' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'ESTANCIAS DEL RIO TANAMA' into the registration Address field
  And he or she enters 'Laguna beach' into the registration Locality field
  And he or she enters 'CA' into the registration Region field
  And he or she enters '' into the registration Postal Code field
  And he or she submits the Registration request
  Then Danny verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, empty Country, valid Postal Code
  Given Oswaldo is a new customer
  When Oswaldo navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Oswaldo' into the First Name field
  And he or she enters 'Burris' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/04/1995' into the Date of Birth field
  And he or she enters '735-74-6922' into the Social Security Number field
  And he or she enters 'Oswaldo.Burris@demo.io' into the Email Address field
  And he or she enters 'jCnMglQewHCqvuuGWndI75' into the registration Password field
  And he or she enters 'jCnMglQewHCqvuuGWndI75' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC02 BOX 8380' into the registration Address field
  And he or she enters 'Pittsview' into the registration Locality field
  And he or she enters 'AL' into the registration Region field
  And he or she enters '36871' into the registration Postal Code field
  And he or she enters '' into the registration Country field
  And he or she submits the Registration request
  Then Oswaldo verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, empty Home Phone
  Given Dawson is a new customer
  When Dawson navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dawson' into the First Name field
  And he or she enters 'Bell' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/09/1971' into the Date of Birth field
  And he or she enters '604-47-3643' into the Social Security Number field
  And he or she enters 'Dawson.Bell@demo.io' into the Email Address field
  And he or she enters 'pTheuRYqYXdzu85' into the registration Password field
  And he or she enters 'pTheuRYqYXdzu85' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB SAGRADO CORAZON' into the registration Address field
  And he or she enters 'Giddings' into the registration Locality field
  And he or she enters 'TX' into the registration Region field
  And he or she enters '78942' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '' into the registration Home Phone field
  And he or she submits the Registration request
  Then Dawson verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, Invalid Home Phone
  Given Sam is a new customer
  When Sam navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Sam' into the First Name field
  And he or she enters 'Ferguson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/04/1991' into the Date of Birth field
  And he or she enters '028-93-5850' into the Social Security Number field
  And he or she enters 'Sam.Ferguson@demo.io' into the Email Address field
  And he or she enters 'bXGpZeuVaAHBoNp99' into the registration Password field
  And he or she enters 'bXGpZeuVaAHBoNp99' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'DIEGO COLON 207 URB 5TO' into the registration Address field
  And he or she enters 'Islamorada' into the registration Locality field
  And he or she enters 'FL' into the registration Region field
  And he or she enters '33036' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '105' into the registration Home Phone field
  And he or she submits the Registration request
  Then Sam verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, valid Wo...
  Given Kole is a new customer
  When Kole navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kole' into the First Name field
  And he or she enters 'House' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/13/1959' into the Date of Birth field
  And he or she enters '506-97-1582' into the Social Security Number field
  And he or she enters 'Kole.House@demo.io' into the Email Address field
  And he or she enters 'qdxPAYki380' into the registration Password field
  And he or she enters 'qdxPAYki380' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'P  O  BOX 3594' into the registration Address field
  And he or she enters 'Power' into the registration Locality field
  And he or she enters 'MT' into the registration Region field
  And he or she enters '59468' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '4123282955' into the registration Home Phone field
  And he or she enters '4123282955' into the registration Mobile Phone field
  And he or she enters '4123282955' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Kole verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, empty Wo...
  Given Maverick is a new customer
  When Maverick navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Maverick' into the First Name field
  And he or she enters 'Goodwin' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/29/1959' into the Date of Birth field
  And he or she enters '942-04-7119' into the Social Security Number field
  And he or she enters 'Maverick.Goodwin@demo.io' into the Email Address field
  And he or she enters 'kqqYxMDzNYWWzbb68' into the registration Password field
  And he or she enters 'kqqYxMDzNYWWzbb68' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'SHERBROOKE HEIGHTS 1434 SHERBR' into the registration Address field
  And he or she enters 'Mount holly springs' into the registration Locality field
  And he or she enters 'PA' into the registration Region field
  And he or she enters '17065' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '6143842642' into the registration Home Phone field
  And he or she enters '6143842642' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Maverick verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, invalid ...
  Given Brennen is a new customer
  When Brennen navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Brennen' into the First Name field
  And he or she enters 'Bentley' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/22/1926' into the Date of Birth field
  And he or she enters '932-32-5229' into the Social Security Number field
  And he or she enters 'Brennen.Bentley@demo.io' into the Email Address field
  And he or she enters 'aVWwGwknd1905' into the registration Password field
  And he or she enters 'aVWwGwknd1905' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALLE ARAMANA 1036 URB MONTERR' into the registration Address field
  And he or she enters 'Altamonte springs' into the registration Locality field
  And he or she enters 'FL' into the registration Region field
  And he or she enters '32714' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '8191529021' into the registration Home Phone field
  And he or she enters '8191529021' into the registration Mobile Phone field
  And he or she enters '16226014' into the registration Work Phone field
  And he or she submits the Registration request
  Then Brennen verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, empty Wo...
  Given Garret is a new customer
  When Garret navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Garret' into the First Name field
  And he or she enters 'Shepherd' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/09/1923' into the Date of Birth field
  And he or she enters '310-53-7630' into the Social Security Number field
  And he or she enters 'Garret.Shepherd@demo.io' into the Email Address field
  And he or she enters 'XtQSGGeXAbW215' into the registration Password field
  And he or she enters 'XtQSGGeXAbW215' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB LOS PINOS 14' into the registration Address field
  And he or she enters 'Masontown' into the registration Locality field
  And he or she enters 'PA' into the registration Region field
  And he or she enters '15461' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '3516987777' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Garret verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Garret.Shepherd@demo.io
  And he or she enters 'XtQSGGeXAbW215' into the login Password field
  And he or she submits the login request


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, invalid ...
  Given Caleb is a new customer
  When Caleb navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Caleb' into the First Name field
  And he or she enters 'Sheppard' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '06/04/1939' into the Date of Birth field
  And he or she enters '841-49-1035' into the Social Security Number field
  And he or she enters 'Caleb.Sheppard@demo.io' into the Email Address field
  And he or she enters 'jgOpUEdbsCfMLVjRzo757' into the registration Password field
  And he or she enters 'jgOpUEdbsCfMLVjRzo757' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BA PALOMAS CALLE A #20' into the registration Address field
  And he or she enters 'Louisville' into the registration Locality field
  And he or she enters 'KY' into the registration Region field
  And he or she enters '40299' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '8986466359' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '806465524' into the registration Work Phone field
  And he or she submits the Registration request
  Then Caleb verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, Invalid Mobile Phone
  Given Marquise is a new customer
  When Marquise navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Marquise' into the First Name field
  And he or she enters 'Irwin' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/04/1923' into the Date of Birth field
  And he or she enters '901-50-0114' into the Social Security Number field
  And he or she enters 'Marquise.Irwin@demo.io' into the Email Address field
  And he or she enters 'IhujLgiusOTkhPg6' into the registration Password field
  And he or she enters 'IhujLgiusOTkhPg6' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'VIA VIRGINIA SCALA A' into the registration Address field
  And he or she enters 'Mc grath' into the registration Locality field
  And he or she enters 'MN' into the registration Region field
  And he or she enters '56350' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '7247321179' into the registration Home Phone field
  And he or she enters '44' into the registration Mobile Phone field
  And he or she submits the Registration request
  Then Marquise verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, empty Locality
  Given Brent is a new customer
  When Brent navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Brent' into the First Name field
  And he or she enters 'Willis' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/30/1971' into the Date of Birth field
  And he or she enters '937-32-3484' into the Social Security Number field
  And he or she enters 'Brent.Willis@demo.io' into the Email Address field
  And he or she enters 'prDIekJYSWYuCaYUvCwA82' into the registration Password field
  And he or she enters 'prDIekJYSWYuCaYUvCwA82' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB VILLA GRILLASEA E PUJALAS' into the registration Address field
  And he or she enters '' into the registration Locality field
  And he or she submits the Registration request
  Then Brent verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, empty Address
  Given Carter is a new customer
  When Carter navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Carter' into the First Name field
  And he or she enters 'Shannon' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/10/1945' into the Date of Birth field
  And he or she enters '635-52-3126' into the Social Security Number field
  And he or she enters 'Carter.Shannon@demo.io' into the Email Address field
  And he or she enters 'nWDggzEdHOM54883' into the registration Password field
  And he or she enters 'nWDggzEdHOM54883' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '' into the registration Address field
  And he or she submits the Registration request
  Then Carter verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, empty Password
  Given Branden is a new customer
  When Branden navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Branden' into the First Name field
  And he or she enters 'Lawrence' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/27/1935' into the Date of Birth field
  And he or she enters '626-67-2767' into the Social Security Number field
  And he or she enters 'Branden.Lawrence@demo.io' into the Email Address field
  And he or she enters '' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Branden verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password less than 8 characters
  Given Landen is a new customer
  When Landen navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Landen' into the First Name field
  And he or she enters 'Mercado' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/07/1998' into the Date of Birth field
  And he or she enters '496-59-7051' into the Social Security Number field
  And he or she enters 'Landen.Mercado@demo.io' into the Email Address field
  And he or she enters 'HINxcd54581' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Landen verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no lowercase
  Given Jabari is a new customer
  When Jabari navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jabari' into the First Name field
  And he or she enters 'Pace' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/12/1982' into the Date of Birth field
  And he or she enters '964-62-2067' into the Social Security Number field
  And he or she enters 'Jabari.Pace@demo.io' into the Email Address field
  And he or she enters 'QPMQPYWCUB6' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Jabari verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no numeric
  Given Donte is a new customer
  When Donte navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Donte' into the First Name field
  And he or she enters 'Burris' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/21/1924' into the Date of Birth field
  And he or she enters '965-75-7510' into the Social Security Number field
  And he or she enters 'Donte.Burris@demo.io' into the Email Address field
  And he or she enters 'uWEkhSdlyjUhpUMr' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Donte verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no upper
  Given Noe is a new customer
  When Noe navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Noe' into the First Name field
  And he or she enters 'Chaney' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/16/1971' into the Date of Birth field
  And he or she enters '415-28-1009' into the Social Security Number field
  And he or she enters 'Noe.Chaney@demo.io' into the Email Address field
  And he or she enters 'cweahauikiikrld3504' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Noe verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, registered Email Address, valid Password, matching Confirm Password
  Given Talon is a new customer
  When Talon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Talon' into the First Name field
  And he or she enters 'Farmer' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/29/1991' into the Date of Birth field
  And he or she enters '939-56-3162' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'YWbJMEZNcWtuzNSNT861' into the registration Password field
  And he or she enters 'YWbJMEZNcWtuzNSNT861' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Talon verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, registered SSN, valid Email Address, valid Password, matching Confirm Password
  Given Dontae is a new customer
  When Dontae navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dontae' into the First Name field
  And he or she enters 'Carroll' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/28/1993' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'Dontae.Carroll@demo.io' into the Email Address field
  And he or she enters 'mqTnUKTBW5353' into the registration Password field
  And he or she enters 'mqTnUKTBW5353' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Dontae verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, empty DoB
  Given Jordon is a new customer
  When Jordon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jordon' into the First Name field
  And he or she enters 'Park' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Jordon verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, invalid DoB
  Given Tylor is a new customer
  When Tylor navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Tylor' into the First Name field
  And he or she enters 'Houston' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '1955-04-19m' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Tylor verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN less than 9 digits
  Given Emerson is a new customer
  When Emerson navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Emerson' into the First Name field
  And he or she enters 'Collins' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '03/18/1956' into the Date of Birth field
  And he or she enters '168371' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Emerson verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN greater than 9 digits
  Given Alessandro is a new customer
  When Alessandro navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Alessandro' into the First Name field
  And he or she enters 'Davenport' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '01/26/1968' into the Date of Birth field
  And he or she enters '81505205293' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Alessandro verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN with invalid characters
  Given Chandler is a new customer
  When Chandler navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Chandler' into the First Name field
  And he or she enters 'Lane' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '11/21/1964' into the Date of Birth field
  And he or she enters '770$39$5321' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Chandler verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, valid ...
  Given Francis is a new customer
  When Francis navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Francis' into the First Name field
  And he or she enters 'Mathews' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '12/14/1972' into the Date of Birth field
  And he or she enters '792-73-0467' into the Social Security Number field
  And he or she enters 'Francis.Mathews@demo.io' into the Email Address field
  And he or she enters 'huDElUbyOxQPoWOE664' into the registration Password field
  And he or she enters 'huDElUbyOxQPoWOE664' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC 03 BOX 13545' into the registration Address field
  And he or she enters 'Gove' into the registration Locality field
  And he or she enters 'KS' into the registration Region field
  And he or she enters '67736' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '7633642482' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '7633642482' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Francis verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Francis.Mathews@demo.io
  And he or she enters 'huDElUbyOxQPoWOE664' into the login Password field
  And he or she submits the login request


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, empty DoB
  Given Corbin is a new customer
  When Corbin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Corbin' into the First Name field
  And he or she enters 'Fields' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Corbin verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, invalid DoB
  Given Deangelo is a new customer
  When Deangelo navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Deangelo' into the First Name field
  And he or she enters 'Stone' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '1953-07-20xp' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Deangelo verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, no Gender selected
  Given Tyson is a new customer
  When Tyson navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Tyson' into the First Name field
  And he or she enters 'Solis' into the Last Name field
  And he or she selects '' from the Gender radio button
  And he or she navigates to the Contact Details page
  Then Tyson verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, empty Last Name
  Given Kadin is a new customer
  When Kadin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kadin' into the First Name field
  And he or she enters '' into the Last Name field
  And he or she navigates to the Contact Details page
  Then Kadin verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Ms., valid First Name, valid Last Name, male Gender, valid DoB, registered SSN, registered Email Address, valid Password, matching Confirm Password
  Given Isis is a new customer
  When Isis navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters 'Isis' into the First Name field
  And he or she enters 'Gibson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/20/1941' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'HgoDJbMYcULxOXihvcL5339' into the registration Password field
  And he or she enters 'HgoDJbMYcULxOXihvcL5339' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Isis verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with valid Title Ms., empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mrs., valid First Name, valid Last Name, female Gender, valid DoB, empty SSN
  Given Marie is a new customer
  When Marie navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters 'Marie' into the First Name field
  And he or she enters 'Burns' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '02/27/1998' into the Date of Birth field
  And he or she enters '' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Marie verifies he or she is presented with a Error Message indicating the field is required


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