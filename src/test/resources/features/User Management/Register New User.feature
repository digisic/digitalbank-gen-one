Feature: Register New User
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, empty Email Address
  Given Abram is a new customer
  When Abram navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Abram' into the First Name field
  And he or she enters 'Carson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/09/1942' into the Date of Birth field
  And he or she enters '488-92-1475' into the Social Security Number field
  And he or she enters '' into the Email Address field
  And he or she clicks the Next button
  Then Abram verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, Email Address with no at sign
  Given Bradyn is a new customer
  When Bradyn navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Bradyn' into the First Name field
  And he or she enters 'Austin' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/20/1944' into the Date of Birth field
  And he or she enters '929-71-0710' into the Social Security Number field
  And he or she enters 'Bradyn.Austindemo.io' into the Email Address field
  And he or she clicks the Next button
  Then Bradyn verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, Email Address without domain
  Given Ruben is a new customer
  When Ruben navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Ruben' into the First Name field
  And he or she enters 'Page' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/16/1933' into the Date of Birth field
  And he or she enters '696-67-6356' into the Social Security Number field
  And he or she enters 'Ruben.Page' into the Email Address field
  And he or she clicks the Next button
  Then Ruben verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, empty Confirm Password
  Given Hunter is a new customer
  When Hunter navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Hunter' into the First Name field
  And he or she enters 'Santana' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/28/1996' into the Date of Birth field
  And he or she enters '886-62-7642' into the Social Security Number field
  And he or she enters 'Hunter.Santana@demo.io' into the Email Address field
  And he or she enters 'JyWJCCzBdtmEKDgv9' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she clicks the Next button
  Then Hunter verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, non-matching Confirm Password
  Given Colten is a new customer
  When Colten navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Colten' into the First Name field
  And he or she enters 'Olsen' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/19/1950' into the Date of Birth field
  And he or she enters '118-26-6484' into the Social Security Number field
  And he or she enters 'Colten.Olsen@demo.io' into the Email Address field
  And he or she enters 'wYgDXaObNGOwBZ4674' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she clicks the Next button
  Then Colten verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, empty Region
  Given Eddie is a new customer
  When Eddie navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Eddie' into the First Name field
  And he or she enters 'Bryan' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/30/1964' into the Date of Birth field
  And he or she enters '800-44-4012' into the Social Security Number field
  And he or she enters 'Eddie.Bryan@demo.io' into the Email Address field
  And he or she enters 'QrwpOwgizsBhLS21' into the registration Password field
  And he or she enters 'QrwpOwgizsBhLS21' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BSMT' into the registration Address field
  And he or she enters 'Circle' into the registration Locality field
  And he or she enters '' into the registration Region field
  And he or she clicks the Register button
  Then Eddie verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, empty Postal Code
  Given Irving is a new customer
  When Irving navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Irving' into the First Name field
  And he or she enters 'Calhoun' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/04/1983' into the Date of Birth field
  And he or she enters '275-90-5649' into the Social Security Number field
  And he or she enters 'Irving.Calhoun@demo.io' into the Email Address field
  And he or she enters 'ulrBEsiEA039' into the registration Password field
  And he or she enters 'ulrBEsiEA039' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters '10785 MANCROFT STREET N8P1R3' into the registration Address field
  And he or she enters 'New haven' into the registration Locality field
  And he or she enters 'KY' into the registration Region field
  And he or she enters '' into the registration Postal Code field
  And he or she clicks the Register button
  Then Irving verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, empty Country, valid Postal Code
  Given Landen is a new customer
  When Landen navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Landen' into the First Name field
  And he or she enters 'Little' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/27/1924' into the Date of Birth field
  And he or she enters '868-33-1230' into the Social Security Number field
  And he or she enters 'Landen.Little@demo.io' into the Email Address field
  And he or she enters 'stoSwtvTNPR71' into the registration Password field
  And he or she enters 'stoSwtvTNPR71' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALLE ABRAHAM LINCOLN 19 BO EL' into the registration Address field
  And he or she enters 'Des moines' into the registration Locality field
  And he or she enters 'IA' into the registration Region field
  And he or she enters '50359' into the registration Postal Code field
  And he or she enters '' into the registration Country field
  And he or she clicks the Register button
  Then Landen verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, empty Home Phone
  Given Abdullah is a new customer
  When Abdullah navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Abdullah' into the First Name field
  And he or she enters 'Noel' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/24/1998' into the Date of Birth field
  And he or she enters '678-77-7826' into the Social Security Number field
  And he or she enters 'Abdullah.Noel@demo.io' into the Email Address field
  And he or she enters 'NmxlxZfsNKLXoS7' into the registration Password field
  And he or she enters 'NmxlxZfsNKLXoS7' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALLE ACOSTA 59' into the registration Address field
  And he or she enters 'Muscatine' into the registration Locality field
  And he or she enters 'IA' into the registration Region field
  And he or she enters '52761' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '' into the registration Home Phone field
  And he or she clicks the Register button
  Then Abdullah verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, Invalid Home Phone
  Given Eric is a new customer
  When Eric navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Eric' into the First Name field
  And he or she enters 'Castaneda' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/30/1949' into the Date of Birth field
  And he or she enters '264-48-3274' into the Social Security Number field
  And he or she enters 'Eric.Castaneda@demo.io' into the Email Address field
  And he or she enters 'NzhKAvDfUM603' into the registration Password field
  And he or she enters 'NzhKAvDfUM603' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'C O ROMAN QUINONES' into the registration Address field
  And he or she enters 'Kansas city' into the registration Locality field
  And he or she enters 'MO' into the registration Region field
  And he or she enters '64116' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '4' into the registration Home Phone field
  And he or she clicks the Register button
  Then Eric verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, valid Wo...
  Given Leonel is a new customer
  When Leonel navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Leonel' into the First Name field
  And he or she enters 'Bullock' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/18/1982' into the Date of Birth field
  And he or she enters '252-43-2296' into the Social Security Number field
  And he or she enters 'Leonel.Bullock@demo.io' into the Email Address field
  And he or she enters 'tkXDwPkzuQgbickaofj96861' into the registration Password field
  And he or she enters 'tkXDwPkzuQgbickaofj96861' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC 04 BOX 13922' into the registration Address field
  And he or she enters 'Roy' into the registration Locality field
  And he or she enters 'UT' into the registration Region field
  And he or she enters '84067' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '7585531535' into the registration Home Phone field
  And he or she enters '7585531535' into the registration Moble Phone field
  And he or she enters '7585531535' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she clicks the Register button
  Then Leonel verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, empty Wo...
  Given Jaren is a new customer
  When Jaren navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jaren' into the First Name field
  And he or she enters 'Caldwell' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/20/1933' into the Date of Birth field
  And he or she enters '742-73-5952' into the Social Security Number field
  And he or she enters 'Jaren.Caldwell@demo.io' into the Email Address field
  And he or she enters 'TOhvadyCZCauaz26122' into the registration Password field
  And he or she enters 'TOhvadyCZCauaz26122' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'COM DAVID MENDEZ CARR 102 KM 4' into the registration Address field
  And he or she enters 'Norfolk' into the registration Locality field
  And he or she enters 'MA' into the registration Region field
  And he or she enters '20560' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '7027998121' into the registration Home Phone field
  And he or she enters '7027998121' into the registration Moble Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she clicks the Register button
  Then Jaren verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, invalid ...
  Given Marlon is a new customer
  When Marlon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Marlon' into the First Name field
  And he or she enters 'Allison' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/24/1977' into the Date of Birth field
  And he or she enters '118-35-6301' into the Social Security Number field
  And he or she enters 'Marlon.Allison@demo.io' into the Email Address field
  And he or she enters 'tqBNZYLWz39358' into the registration Password field
  And he or she enters 'tqBNZYLWz39358' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'P. O. BOX 1408' into the registration Address field
  And he or she enters 'Hackensack' into the registration Locality field
  And he or she enters 'MN' into the registration Region field
  And he or she enters '56452' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '3146685404' into the registration Home Phone field
  And he or she enters '3146685404' into the registration Moble Phone field
  And he or she enters '30333749' into the registration Work Phone field
  And he or she clicks the Register button
  Then Marlon verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, empty Wo...
  Given Jack is a new customer
  When Jack navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jack' into the First Name field
  And he or she enters 'Cortez' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/14/2001' into the Date of Birth field
  And he or she enters '827-05-5912' into the Social Security Number field
  And he or she enters 'Jack.Cortez@demo.io' into the Email Address field
  And he or she enters 'iDFeqnjhehTdrxcVh5' into the registration Password field
  And he or she enters 'iDFeqnjhehTdrxcVh5' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'EST DEL RIO #11 C YAGUEZ' into the registration Address field
  And he or she enters 'New kensington' into the registration Locality field
  And he or she enters 'PA' into the registration Region field
  And he or she enters '15068' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '8106606790' into the registration Home Phone field
  And he or she enters '' into the registration Moble Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she clicks the Register button
  Then Jack verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, invalid ...
  Given Raymundo is a new customer
  When Raymundo navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Raymundo' into the First Name field
  And he or she enters 'Moran' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/31/1956' into the Date of Birth field
  And he or she enters '699-04-4261' into the Social Security Number field
  And he or she enters 'Raymundo.Moran@demo.io' into the Email Address field
  And he or she enters 'REYbjZTvlEbQfIjHyRxc52' into the registration Password field
  And he or she enters 'REYbjZTvlEbQfIjHyRxc52' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC-2BOX 7134 BARRIA SAN JOSE' into the registration Address field
  And he or she enters 'Marietta' into the registration Locality field
  And he or she enters 'OK' into the registration Region field
  And he or she enters '73448' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '5627302075' into the registration Home Phone field
  And he or she enters '' into the registration Moble Phone field
  And he or she enters '54497' into the registration Work Phone field
  And he or she clicks the Register button
  Then Raymundo verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, Invalid Mobile Phone
  Given Nico is a new customer
  When Nico navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Nico' into the First Name field
  And he or she enters 'Robinson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/19/1944' into the Date of Birth field
  And he or she enters '974-62-2606' into the Social Security Number field
  And he or she enters 'Nico.Robinson@demo.io' into the Email Address field
  And he or she enters 'OzIlzhZek39' into the registration Password field
  And he or she enters 'OzIlzhZek39' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC 1 BOX 4117' into the registration Address field
  And he or she enters 'Dickinson' into the registration Locality field
  And he or she enters 'TX' into the registration Region field
  And he or she enters '77539' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '9143294006' into the registration Home Phone field
  And he or she enters '77342' into the registration Moble Phone field
  And he or she clicks the Register button
  Then Nico verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, empty Locality
  Given Mustafa is a new customer
  When Mustafa navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Mustafa' into the First Name field
  And he or she enters 'Grimes' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/27/1932' into the Date of Birth field
  And he or she enters '175-02-8344' into the Social Security Number field
  And he or she enters 'Mustafa.Grimes@demo.io' into the Email Address field
  And he or she enters 'ytmxwVqpfFndH03043' into the registration Password field
  And he or she enters 'ytmxwVqpfFndH03043' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB VISTA DEL RIO II BOX 3952' into the registration Address field
  And he or she enters '' into the registration Locality field
  And he or she clicks the Register button
  Then Mustafa verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, empty Address
  Given Everett is a new customer
  When Everett navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Everett' into the First Name field
  And he or she enters 'Hensley' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/14/1988' into the Date of Birth field
  And he or she enters '126-33-8006' into the Social Security Number field
  And he or she enters 'Everett.Hensley@demo.io' into the Email Address field
  And he or she enters 'qzlqNAiB03866' into the registration Password field
  And he or she enters 'qzlqNAiB03866' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters '' into the registration Address field
  And he or she clicks the Register button
  Then Everett verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, empty Password
  Given Zain is a new customer
  When Zain navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Zain' into the First Name field
  And he or she enters 'Franklin' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/28/1935' into the Date of Birth field
  And he or she enters '104-29-5131' into the Social Security Number field
  And he or she enters 'Zain.Franklin@demo.io' into the Email Address field
  And he or she enters '' into the registration Password field
  And he or she clicks the Next button
  Then Zain verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password less than 8 characters
  Given Terry is a new customer
  When Terry navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Terry' into the First Name field
  And he or she enters 'Pruitt' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/16/1948' into the Date of Birth field
  And he or she enters '749-50-4771' into the Social Security Number field
  And he or she enters 'Terry.Pruitt@demo.io' into the Email Address field
  And he or she enters 'yp84492' into the registration Password field
  And he or she clicks the Next button
  Then Terry verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no lowercase
  Given Joe is a new customer
  When Joe navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Joe' into the First Name field
  And he or she enters 'Heath' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/08/1978' into the Date of Birth field
  And he or she enters '854-70-3235' into the Social Security Number field
  And he or she enters 'Joe.Heath@demo.io' into the Email Address field
  And he or she enters 'EFBWEOJXORKOMXZZZAF88769' into the registration Password field
  And he or she clicks the Next button
  Then Joe verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no numeric
  Given Colton is a new customer
  When Colton navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Colton' into the First Name field
  And he or she enters 'Rogers' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/04/1990' into the Date of Birth field
  And he or she enters '861-92-0099' into the Social Security Number field
  And he or she enters 'Colton.Rogers@demo.io' into the Email Address field
  And he or she enters 'bpOlLCeuCtSLyJFOG' into the registration Password field
  And he or she clicks the Next button
  Then Colton verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no upper
  Given Dimitri is a new customer
  When Dimitri navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dimitri' into the First Name field
  And he or she enters 'Bowman' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/24/2000' into the Date of Birth field
  And he or she enters '840-58-9983' into the Social Security Number field
  And he or she enters 'Dimitri.Bowman@demo.io' into the Email Address field
  And he or she enters 'rtvwjeiydbaxwlh851' into the registration Password field
  And he or she clicks the Next button
  Then Dimitri verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, registered Email Address, valid Password, matching Confirm Password
  Given Raymundo is a new customer
  When Raymundo navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Raymundo' into the First Name field
  And he or she enters 'Potts' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/09/1980' into the Date of Birth field
  And he or she enters '814-98-5963' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'HkjsdQKkzxLO5' into the registration Password field
  And he or she enters 'HkjsdQKkzxLO5' into the registration Confirm Password field
  And he or she clicks the Next button
  Then Raymundo verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, registered SSN, valid Email Address, valid Password, matching Confirm Password
  Given Trevin is a new customer
  When Trevin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Trevin' into the First Name field
  And he or she enters 'Drake' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/14/1965' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'Trevin.Drake@demo.io' into the Email Address field
  And he or she enters 'yeGibgRqdgSIebyDR691' into the registration Password field
  And he or she enters 'yeGibgRqdgSIebyDR691' into the registration Confirm Password field
  And he or she clicks the Next button
  Then Trevin verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, empty DoB
  Given Alonso is a new customer
  When Alonso navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Alonso' into the First Name field
  And he or she enters 'Stafford' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she clicks the Next button
  Then Alonso verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, invalid DoB
  Given Landon is a new customer
  When Landon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Landon' into the First Name field
  And he or she enters 'Melendez' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '1996-03-13agl' into the Date of Birth field
  And he or she clicks the Next button
  Then Landon verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN less than 9 digits
  Given Luc is a new customer
  When Luc navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Luc' into the First Name field
  And he or she enters 'Church' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '12/17/1933' into the Date of Birth field
  And he or she enters '5152939' into the Social Security Number field
  And he or she clicks the Next button
  Then Luc verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN greater than 9 digits
  Given Thomas is a new customer
  When Thomas navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Thomas' into the First Name field
  And he or she enters 'Stevenson' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '06/14/1948' into the Date of Birth field
  And he or she enters '170463269062' into the Social Security Number field
  And he or she clicks the Next button
  Then Thomas verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN with invalid characters
  Given Oscar is a new customer
  When Oscar navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Oscar' into the First Name field
  And he or she enters 'Harrison' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '08/05/1963' into the Date of Birth field
  And he or she enters '849$80$7463' into the Social Security Number field
  And he or she clicks the Next button
  Then Oscar verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, valid ...
  Given Dario is a new customer
  When Dario navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dario' into the First Name field
  And he or she enters 'Gill' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '05/15/1923' into the Date of Birth field
  And he or she enters '593-18-4319' into the Social Security Number field
  And he or she enters 'Dario.Gill@demo.io' into the Email Address field
  And he or she enters 'WZGjQKrbrHqtmLgVwOgZ620' into the registration Password field
  And he or she enters 'WZGjQKrbrHqtmLgVwOgZ620' into the registration Confirm Password field
  And he or she clicks the Next button
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CANTERA 48-1' into the registration Address field
  And he or she enters 'Menlo' into the registration Locality field
  And he or she enters 'WA' into the registration Region field
  And he or she enters '98561' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '8441236428' into the registration Home Phone field
  And he or she enters '' into the registration Moble Phone field
  And he or she enters '8441236428' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she clicks the Register button
  Then Dario verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, empty DoB
  Given Brennan is a new customer
  When Brennan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Brennan' into the First Name field
  And he or she enters 'Hays' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she clicks the Next button
  Then Brennan verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, invalid DoB
  Given Alan is a new customer
  When Alan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Alan' into the First Name field
  And he or she enters 'Schwartz' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '1956-10-21p' into the Date of Birth field
  And he or she clicks the Next button
  Then Alan verifies he or she is presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, no Gender selected
  Given Jaquan is a new customer
  When Jaquan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jaquan' into the First Name field
  And he or she enters 'Gardner' into the Last Name field
  And he or she selects '' from the Gender radio button
  And he or she clicks the Next button
  Then Jaquan verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, empty Last Name
  Given Leon is a new customer
  When Leon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Leon' into the First Name field
  And he or she enters '' into the Last Name field
  And he or she clicks the Next button
  Then Leon verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she clicks the Next button
  Then Kate verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Ms., valid First Name, valid Last Name, male Gender, valid DoB, registered SSN, registered Email Address, valid Password, matching Confirm Password
  Given Miah is a new customer
  When Miah navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters 'Miah' into the First Name field
  And he or she enters 'Reyes' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/27/1929' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'yHbBXxrRTKsq96' into the registration Password field
  And he or she enters 'yHbBXxrRTKsq96' into the registration Confirm Password field
  And he or she clicks the Next button
  Then Miah verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account

Scenario: Register user with valid Title Ms., empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she clicks the Next button
  Then Kate verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mrs., valid First Name, valid Last Name, female Gender, valid DoB, empty SSN
  Given Rose is a new customer
  When Rose navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters 'Rose' into the First Name field
  And he or she enters 'Chase' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '10/14/1954' into the Date of Birth field
  And he or she enters '' into the Social Security Number field
  And he or she clicks the Next button
  Then Rose verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mrs., empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she clicks the Next button
  Then Kate verifies he or she is presented with a Error Message indicating the field is required

Scenario: Register user with no Title selected
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects '' from the Title radio button
  And he or she clicks the Next button
  Then Kate verifies he or she is presented with a Error Message indicating the field is required
