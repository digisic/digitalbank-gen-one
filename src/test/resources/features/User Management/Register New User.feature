@ui, @user, @security, @register
Feature: Register New User
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.



Scenario: Register user with Mr. title, M gender, empty Email Address
  Given Adan is a new customer
  When Adan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Adan' into the First Name field
  And he or she enters 'Lott' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/29/1998' into the Date of Birth field
  And he or she enters '294-22-9905' into the Social Security Number field
  And he or she enters '' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Adan verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, Email Address with no at sign
  Given Mauricio is a new customer
  When Mauricio navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Mauricio' into the First Name field
  And he or she enters 'Washington' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/17/1938' into the Date of Birth field
  And he or she enters '395-58-3031' into the Social Security Number field
  And he or she enters 'Mauricio.Washingtondemo.io' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Mauricio verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, Email Address without domain
  Given Alvaro is a new customer
  When Alvaro navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Alvaro' into the First Name field
  And he or she enters 'Beach' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/25/1936' into the Date of Birth field
  And he or she enters '310-31-7083' into the Social Security Number field
  And he or she enters 'Alvaro.Beach' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Alvaro verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, empty Confirm Password
  Given Jamari is a new customer
  When Jamari navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jamari' into the First Name field
  And he or she enters 'Tyson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/22/1997' into the Date of Birth field
  And he or she enters '137-55-3341' into the Social Security Number field
  And he or she enters 'Jamari.Tyson@demo.io' into the Email Address field
  And he or she enters 'qcadLYdNojAubrMwvlh89663' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Jamari verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, non-matching Confirm Password
  Given Asa is a new customer
  When Asa navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Asa' into the First Name field
  And he or she enters 'Benson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/14/1993' into the Date of Birth field
  And he or she enters '682-94-5136' into the Social Security Number field
  And he or she enters 'Asa.Benson@demo.io' into the Email Address field
  And he or she enters 'rJQxNyJxvEslIvQZsfnC69669' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Asa verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, empty Region
  Given Haden is a new customer
  When Haden navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Haden' into the First Name field
  And he or she enters 'Barry' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/10/1941' into the Date of Birth field
  And he or she enters '750-29-7683' into the Social Security Number field
  And he or she enters 'Haden.Barry@demo.io' into the Email Address field
  And he or she enters 'MPyMFMFZEcWSF0930' into the registration Password field
  And he or she enters 'MPyMFMFZEcWSF0930' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC-02 BOX 3929' into the registration Address field
  And he or she enters 'Oklahoma city' into the registration Locality field
  And he or she enters '' into the registration Region field
  And he or she submits the Registration request
  Then Haden verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Postal Code
  Given Rogelio is a new customer
  When Rogelio navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Rogelio' into the First Name field
  And he or she enters 'Santos' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/29/1927' into the Date of Birth field
  And he or she enters '926-17-9079' into the Social Security Number field
  And he or she enters 'Rogelio.Santos@demo.io' into the Email Address field
  And he or she enters 'yPaLZQHWTWRPWySARbzN7' into the registration Password field
  And he or she enters 'yPaLZQHWTWRPWySARbzN7' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'K-4 CALLE 11 VEGA BAJA LKS' into the registration Address field
  And he or she enters 'Quincy' into the registration Locality field
  And he or she enters 'WA' into the registration Region field
  And he or she enters '' into the registration Postal Code field
  And he or she submits the Registration request
  Then Rogelio verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Country
  Given Casey is a new customer
  When Casey navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Casey' into the First Name field
  And he or she enters 'Rosa' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/04/2000' into the Date of Birth field
  And he or she enters '705-85-4521' into the Social Security Number field
  And he or she enters 'Casey.Rosa@demo.io' into the Email Address field
  And he or she enters 'NOromJmqPLZashKfwi36401' into the registration Password field
  And he or she enters 'NOromJmqPLZashKfwi36401' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'POBOX 64' into the registration Address field
  And he or she enters 'Keyesport' into the registration Locality field
  And he or she enters 'IL' into the registration Region field
  And he or she enters '62253' into the registration Postal Code field
  And he or she enters '' into the registration Country field
  And he or she submits the Registration request
  Then Casey verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Home Phone
  Given Lukas is a new customer
  When Lukas navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Lukas' into the First Name field
  And he or she enters 'Shaffer' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/25/1935' into the Date of Birth field
  And he or she enters '927-27-7949' into the Social Security Number field
  And he or she enters 'Lukas.Shaffer@demo.io' into the Email Address field
  And he or she enters 'dPYiYFPveopTs56' into the registration Password field
  And he or she enters 'dPYiYFPveopTs56' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'VILLAS DEL CAFETAL CALLE1 CASA' into the registration Address field
  And he or she enters 'Dallas' into the registration Locality field
  And he or she enters 'TX' into the registration Region field
  And he or she enters '75252' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '' into the registration Home Phone field
  And he or she submits the Registration request
  Then Lukas verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, Invalid Home Phone
  Given Zion is a new customer
  When Zion navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Zion' into the First Name field
  And he or she enters 'Berg' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/03/1948' into the Date of Birth field
  And he or she enters '095-90-0143' into the Social Security Number field
  And he or she enters 'Zion.Berg@demo.io' into the Email Address field
  And he or she enters 'pDouDjExFTBvvNcmx687' into the registration Password field
  And he or she enters 'pDouDjExFTBvvNcmx687' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC01 BOX 6150' into the registration Address field
  And he or she enters 'Naytahwaush' into the registration Locality field
  And he or she enters 'MN' into the registration Region field
  And he or she enters '56566' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '525' into the registration Home Phone field
  And he or she submits the Registration request
  Then Zion verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M genderAgree False
  Given Cruz is a new customer
  When Cruz navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Cruz' into the First Name field
  And he or she enters 'Hodge' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/31/1923' into the Date of Birth field
  And he or she enters '009-22-4069' into the Social Security Number field
  And he or she enters 'Cruz.Hodge@demo.io' into the Email Address field
  And he or she enters 'KULQFYNYPyDTYhEj455' into the registration Password field
  And he or she enters 'KULQFYNYPyDTYhEj455' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC 02 BOX 10343' into the registration Address field
  And he or she enters 'Hollywood' into the registration Locality field
  And he or she enters 'FL' into the registration Region field
  And he or she enters '33021' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '8667418351' into the registration Home Phone field
  And he or she enters '8667418351' into the registration Mobile Phone field
  And he or she enters '8667418351' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Cruz verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Work PhoneAgree False
  Given Nathen is a new customer
  When Nathen navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Nathen' into the First Name field
  And he or she enters 'Boyd' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/24/1959' into the Date of Birth field
  And he or she enters '517-54-0152' into the Social Security Number field
  And he or she enters 'Nathen.Boyd@demo.io' into the Email Address field
  And he or she enters 'MFgrZpoDDGPswFXM876' into the registration Password field
  And he or she enters 'MFgrZpoDDGPswFXM876' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALL BOX 2600' into the registration Address field
  And he or she enters 'Lacrosse' into the registration Locality field
  And he or she enters 'WA' into the registration Region field
  And he or she enters '99143' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '4014365806' into the registration Home Phone field
  And he or she enters '4014365806' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Nathen verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, invalid Work Phone
  Given Ali is a new customer
  When Ali navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Ali' into the First Name field
  And he or she enters 'Holden' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/29/1966' into the Date of Birth field
  And he or she enters '448-24-3498' into the Social Security Number field
  And he or she enters 'Ali.Holden@demo.io' into the Email Address field
  And he or she enters 'qARntyhCbqroetT25' into the registration Password field
  And he or she enters 'qARntyhCbqroetT25' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'APARTADO 182' into the registration Address field
  And he or she enters 'Seattle' into the registration Locality field
  And he or she enters 'WA' into the registration Region field
  And he or she enters '98199' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '5616695042' into the registration Home Phone field
  And he or she enters '5616695042' into the registration Mobile Phone field
  And he or she enters '39' into the registration Work Phone field
  And he or she submits the Registration request
  Then Ali verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, empty Mobile Phone, empty Work Phone
  Given Alexandre is a new customer
  When Alexandre navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Alexandre' into the First Name field
  And he or she enters 'Rogers' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/12/1952' into the Date of Birth field
  And he or she enters '330-15-8433' into the Social Security Number field
  And he or she enters 'Alexandre.Rogers@demo.io' into the Email Address field
  And he or she enters 'hAuEGKZzjlkfJynH1' into the registration Password field
  And he or she enters 'hAuEGKZzjlkfJynH1' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALLE 2 #235 PARCELAS NUEVAS T' into the registration Address field
  And he or she enters 'Middletown' into the registration Locality field
  And he or she enters 'IN' into the registration Region field
  And he or she enters '47356' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '2365706314' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Alexandre verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Alexandre.Rogers@demo.io
  And he or she enters 'hAuEGKZzjlkfJynH1' into the login Password field
  And he or she submits the login request
  And he or she verifies he or she is at the Home page


Scenario: Register user with Mr. title, M gender, empty Mobile Phone, invalid Work Phone
  Given Emmett is a new customer
  When Emmett navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Emmett' into the First Name field
  And he or she enters 'Walter' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/11/1950' into the Date of Birth field
  And he or she enters '599-18-8135' into the Social Security Number field
  And he or she enters 'Emmett.Walter@demo.io' into the Email Address field
  And he or she enters 'svshEbpV853' into the registration Password field
  And he or she enters 'svshEbpV853' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'JARD VIL ALBA NO 19' into the registration Address field
  And he or she enters 'Bluefield' into the registration Locality field
  And he or she enters 'VA' into the registration Region field
  And he or she enters '24605' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '4386474458' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '771' into the registration Work Phone field
  And he or she submits the Registration request
  Then Emmett verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, Invalid Mobile Phone
  Given Davon is a new customer
  When Davon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Davon' into the First Name field
  And he or she enters 'Hernandez' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/04/1932' into the Date of Birth field
  And he or she enters '326-08-8495' into the Social Security Number field
  And he or she enters 'Davon.Hernandez@demo.io' into the Email Address field
  And he or she enters 'vIxzdfFis5664' into the registration Password field
  And he or she enters 'vIxzdfFis5664' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '1035 CHEMIN ROYAL' into the registration Address field
  And he or she enters 'Kingsville' into the registration Locality field
  And he or she enters 'MO' into the registration Region field
  And he or she enters '64061' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '2501678045' into the registration Home Phone field
  And he or she enters '3258047' into the registration Mobile Phone field
  And he or she submits the Registration request
  Then Davon verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, empty Locality
  Given Marquez is a new customer
  When Marquez navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Marquez' into the First Name field
  And he or she enters 'Terry' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/12/1960' into the Date of Birth field
  And he or she enters '541-38-5398' into the Social Security Number field
  And he or she enters 'Marquez.Terry@demo.io' into the Email Address field
  And he or she enters 'GuDGJOFMyhoWwTIrOdtM694' into the registration Password field
  And he or she enters 'GuDGJOFMyhoWwTIrOdtM694' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC1 BOX 6536' into the registration Address field
  And he or she enters '' into the registration Locality field
  And he or she submits the Registration request
  Then Marquez verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Address
  Given Lance is a new customer
  When Lance navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Lance' into the First Name field
  And he or she enters 'Juarez' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/16/1986' into the Date of Birth field
  And he or she enters '833-06-0882' into the Social Security Number field
  And he or she enters 'Lance.Juarez@demo.io' into the Email Address field
  And he or she enters 'tjXeUneVYRyQMLEvJPRk3' into the registration Password field
  And he or she enters 'tjXeUneVYRyQMLEvJPRk3' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '' into the registration Address field
  And he or she submits the Registration request
  Then Lance verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Password
  Given Aden is a new customer
  When Aden navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Aden' into the First Name field
  And he or she enters 'House' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/12/1972' into the Date of Birth field
  And he or she enters '651-14-5982' into the Social Security Number field
  And he or she enters 'Aden.House@demo.io' into the Email Address field
  And he or she enters '' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Aden verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, Password less than 8 characters
  Given Kristian is a new customer
  When Kristian navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kristian' into the First Name field
  And he or she enters 'Hayes' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/22/1963' into the Date of Birth field
  And he or she enters '517-39-8196' into the Social Security Number field
  And he or she enters 'Kristian.Hayes@demo.io' into the Email Address field
  And he or she enters 's322' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Kristian verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, Password with no lowercase
  Given Grant is a new customer
  When Grant navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Grant' into the First Name field
  And he or she enters 'May' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/29/1948' into the Date of Birth field
  And he or she enters '874-22-0597' into the Social Security Number field
  And he or she enters 'Grant.May@demo.io' into the Email Address field
  And he or she enters 'NVJEOEUPA416' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Grant verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, Password with no numeric
  Given Eddie is a new customer
  When Eddie navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Eddie' into the First Name field
  And he or she enters 'Santiago' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/11/1960' into the Date of Birth field
  And he or she enters '080-96-7059' into the Social Security Number field
  And he or she enters 'Eddie.Santiago@demo.io' into the Email Address field
  And he or she enters 'icGotgYMjCA' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Eddie verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, Password with no upper
  Given Milton is a new customer
  When Milton navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Milton' into the First Name field
  And he or she enters 'Finley' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/16/1947' into the Date of Birth field
  And he or she enters '469-99-8623' into the Social Security Number field
  And he or she enters 'Milton.Finley@demo.io' into the Email Address field
  And he or she enters 'vnocuwnzsibsuaqxhodv777' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Milton verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, registered Email Address
  Given Dallas is a new customer
  When Dallas navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dallas' into the First Name field
  And he or she enters 'Massey' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/25/1935' into the Date of Birth field
  And he or she enters '709-24-3916' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'uMcuHGhbNTB16842' into the registration Password field
  And he or she enters 'uMcuHGhbNTB16842' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Dallas verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with Mr. title, M gender, registered SSN
  Given Ahmed is a new customer
  When Ahmed navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Ahmed' into the First Name field
  And he or she enters 'Mitchell' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/02/1945' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'Ahmed.Mitchell@demo.io' into the Email Address field
  And he or she enters 'cREmQbTCDO807' into the registration Password field
  And he or she enters 'cREmQbTCDO807' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Ahmed verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with Mr. title, M gender, empty DoB
  Given Maximilian is a new customer
  When Maximilian navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Maximilian' into the First Name field
  And he or she enters 'Fleming' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Maximilian verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, invalid DoB
  Given Stanley is a new customer
  When Stanley navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Stanley' into the First Name field
  And he or she enters 'Bowers' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '1924-05-10t' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Stanley verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, F gender, SSN less than 9 digits
  Given Darryl is a new customer
  When Darryl navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Darryl' into the First Name field
  And he or she enters 'Haynes' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '01/13/1924' into the Date of Birth field
  And he or she enters '5752122' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Darryl verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, F gender, SSN greater than 9 digits
  Given Maurice is a new customer
  When Maurice navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Maurice' into the First Name field
  And he or she enters 'Goodman' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '07/13/1925' into the Date of Birth field
  And he or she enters '56192066682275' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Maurice verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, F gender, SSN with invalid characters
  Given Sean is a new customer
  When Sean navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Sean' into the First Name field
  And he or she enters 'Oneill' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '02/07/1952' into the Date of Birth field
  And he or she enters '249$13$1491' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Sean verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, F gender, empty Mobile Phone
  Given Jamal is a new customer
  When Jamal navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jamal' into the First Name field
  And he or she enters 'Owens' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '05/04/1931' into the Date of Birth field
  And he or she enters '244-04-3694' into the Social Security Number field
  And he or she enters 'Jamal.Owens@demo.io' into the Email Address field
  And he or she enters 'CDCvvSzL7427' into the registration Password field
  And he or she enters 'CDCvvSzL7427' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'RES SABANA CALLE CHILE #E 6' into the registration Address field
  And he or she enters 'North myrtle beach' into the registration Locality field
  And he or she enters 'SC' into the registration Region field
  And he or she enters '29582' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '2469765369' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '2469765369' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Jamal verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Jamal.Owens@demo.io
  And he or she enters 'CDCvvSzL7427' into the login Password field
  And he or she submits the login request
  And he or she verifies he or she is at the Home page


Scenario: Register user with Mr. title, F gender, empty DoB
  Given Tyrone is a new customer
  When Tyrone navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Tyrone' into the First Name field
  And he or she enters 'Coffey' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Tyrone verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, F gender, invalid DoB
  Given Jovan is a new customer
  When Jovan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jovan' into the First Name field
  And he or she enters 'Gould' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '1982-08-23f' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Jovan verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, gender not selected
  Given Elvis is a new customer
  When Elvis navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Elvis' into the First Name field
  And he or she enters 'Hogan' into the Last Name field
  And he or she selects '' from the Gender radio button
  And he or she navigates to the Contact Details page
  Then Elvis verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, empty Last Name
  Given Kelton is a new customer
  When Kelton navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kelton' into the First Name field
  And he or she enters '' into the Last Name field
  And he or she navigates to the Contact Details page
  Then Kelton verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Ms. title, M gender, registered SSN, registered Email Address
  Given Cierra is a new customer
  When Cierra navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters 'Cierra' into the First Name field
  And he or she enters 'Salas' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/19/1997' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'WwdZkaYc82568' into the registration Password field
  And he or she enters 'WwdZkaYc82568' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Cierra verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with Ms. title, empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mrs. title, F gender, empty SSN
  Given Autumn is a new customer
  When Autumn navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters 'Autumn' into the First Name field
  And he or she enters 'Hensley' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '02/02/1968' into the Date of Birth field
  And he or she enters '' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Autumn verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mrs. title, empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with no title selected
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects '' from the Title radio button
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required