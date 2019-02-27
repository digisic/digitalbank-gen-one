@ui, @user, @registration
Feature: Register New User
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.



Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, empty Email Address
  Given Douglas is a new customer
  When Douglas navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Douglas' into the First Name field
  And he or she enters 'Mathews' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/03/1980' into the Date of Birth field
  And he or she enters '255-75-3954' into the Social Security Number field
  And he or she enters '' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Douglas verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, Email Address with no at sign
  Given Myles is a new customer
  When Myles navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Myles' into the First Name field
  And he or she enters 'Chen' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/06/1976' into the Date of Birth field
  And he or she enters '578-30-9696' into the Social Security Number field
  And he or she enters 'Myles.Chendemo.io' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Myles verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, Email Address without domain
  Given Savion is a new customer
  When Savion navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Savion' into the First Name field
  And he or she enters 'Payne' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/31/1981' into the Date of Birth field
  And he or she enters '434-49-6750' into the Social Security Number field
  And he or she enters 'Savion.Payne' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Savion verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, empty Confirm Password
  Given Elvis is a new customer
  When Elvis navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Elvis' into the First Name field
  And he or she enters 'Gilmore' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '06/10/1942' into the Date of Birth field
  And he or she enters '874-71-2987' into the Social Security Number field
  And he or she enters 'Elvis.Gilmore@demo.io' into the Email Address field
  And he or she enters 'gUZtXbZqV8952' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Elvis verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, non-matching Confirm Password
  Given Sammy is a new customer
  When Sammy navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Sammy' into the First Name field
  And he or she enters 'Barnes' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/12/1969' into the Date of Birth field
  And he or she enters '125-23-1690' into the Social Security Number field
  And he or she enters 'Sammy.Barnes@demo.io' into the Email Address field
  And he or she enters 'ISyYRpukN185' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Sammy verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, empty Region
  Given Darin is a new customer
  When Darin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Darin' into the First Name field
  And he or she enters 'Aguilar' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/29/1945' into the Date of Birth field
  And he or she enters '665-32-6697' into the Social Security Number field
  And he or she enters 'Darin.Aguilar@demo.io' into the Email Address field
  And he or she enters 'ZGrEWqmadkbaU9' into the registration Password field
  And he or she enters 'ZGrEWqmadkbaU9' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB LAS VEGAS F-10' into the registration Address field
  And he or she enters 'Lewisberry' into the registration Locality field
  And he or she enters '' into the registration Region field
  And he or she submits the Registration request
  Then Darin verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, empty Postal Code
  Given Alexandro is a new customer
  When Alexandro navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Alexandro' into the First Name field
  And he or she enters 'Bass' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/27/1973' into the Date of Birth field
  And he or she enters '113-95-1973' into the Social Security Number field
  And he or she enters 'Alexandro.Bass@demo.io' into the Email Address field
  And he or she enters 'rjJlvxzlD446' into the registration Password field
  And he or she enters 'rjJlvxzlD446' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '102 EST DE IMBORY' into the registration Address field
  And he or she enters 'Rockwood' into the registration Locality field
  And he or she enters 'ME' into the registration Region field
  And he or she enters '' into the registration Postal Code field
  And he or she submits the Registration request
  Then Alexandro verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, empty Country, valid Postal Code
  Given Jaiden is a new customer
  When Jaiden navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jaiden' into the First Name field
  And he or she enters 'Summers' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/30/1961' into the Date of Birth field
  And he or she enters '029-49-0453' into the Social Security Number field
  And he or she enters 'Jaiden.Summers@demo.io' into the Email Address field
  And he or she enters 'ngcIBXjPHrIcf19978' into the registration Password field
  And he or she enters 'ngcIBXjPHrIcf19978' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'AVE ESTACION #219' into the registration Address field
  And he or she enters 'Milldale' into the registration Locality field
  And he or she enters 'CT' into the registration Region field
  And he or she enters '64670' into the registration Postal Code field
  And he or she enters '' into the registration Country field
  And he or she submits the Registration request
  Then Jaiden verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, empty Home Phone
  Given Maximo is a new customer
  When Maximo navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Maximo' into the First Name field
  And he or she enters 'Daugherty' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/09/1933' into the Date of Birth field
  And he or she enters '257-19-8792' into the Social Security Number field
  And he or she enters 'Maximo.Daugherty@demo.io' into the Email Address field
  And he or she enters 'mIVUIxuPyb25893' into the registration Password field
  And he or she enters 'mIVUIxuPyb25893' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'VILLAS DEL NORTE' into the registration Address field
  And he or she enters 'Houston' into the registration Locality field
  And he or she enters 'TX' into the registration Region field
  And he or she enters '77053' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '' into the registration Home Phone field
  And he or she submits the Registration request
  Then Maximo verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, Invalid Home Phone
  Given Dante is a new customer
  When Dante navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dante' into the First Name field
  And he or she enters 'Hensley' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/31/1964' into the Date of Birth field
  And he or she enters '221-98-6747' into the Social Security Number field
  And he or she enters 'Dante.Hensley@demo.io' into the Email Address field
  And he or she enters 'VFsWXSwwbXnkE6656' into the registration Password field
  And he or she enters 'VFsWXSwwbXnkE6656' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'NBR 108 60 GOLDBECK LN' into the registration Address field
  And he or she enters 'Bradner' into the registration Locality field
  And he or she enters 'OH' into the registration Region field
  And he or she enters '43406' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '5' into the registration Home Phone field
  And he or she submits the Registration request
  Then Dante verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, valid Wo...
  Given Alvin is a new customer
  When Alvin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Alvin' into the First Name field
  And he or she enters 'Marks' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '06/07/1938' into the Date of Birth field
  And he or she enters '108-62-8530' into the Social Security Number field
  And he or she enters 'Alvin.Marks@demo.io' into the Email Address field
  And he or she enters 'dwPkXMifvtPcnWHBlM861' into the registration Password field
  And he or she enters 'dwPkXMifvtPcnWHBlM861' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '112 LAKEVIEW ROAD' into the registration Address field
  And he or she enters 'Cedar rapids' into the registration Locality field
  And he or she enters 'IA' into the registration Region field
  And he or she enters '52409' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '2839222427' into the registration Home Phone field
  And he or she enters '2839222427' into the registration Mobile Phone field
  And he or she enters '2839222427' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Alvin verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, empty Wo...
  Given Houston is a new customer
  When Houston navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Houston' into the First Name field
  And he or she enters 'Clements' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/14/1971' into the Date of Birth field
  And he or she enters '542-52-3863' into the Social Security Number field
  And he or she enters 'Houston.Clements@demo.io' into the Email Address field
  And he or she enters 'sIlkUqdMAlKtvnMq19930' into the registration Password field
  And he or she enters 'sIlkUqdMAlKtvnMq19930' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CARR 109 KM27.1' into the registration Address field
  And he or she enters 'Los angeles' into the registration Locality field
  And he or she enters 'CA' into the registration Region field
  And he or she enters '90003' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '6478176039' into the registration Home Phone field
  And he or she enters '6478176039' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Houston verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, invalid ...
  Given Lamont is a new customer
  When Lamont navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Lamont' into the First Name field
  And he or she enters 'Hopper' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/11/1935' into the Date of Birth field
  And he or she enters '715-21-8124' into the Social Security Number field
  And he or she enters 'Lamont.Hopper@demo.io' into the Email Address field
  And he or she enters 'VjaEuDyddrx01138' into the registration Password field
  And he or she enters 'VjaEuDyddrx01138' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALLE PINO CASA D-10 URB LOS' into the registration Address field
  And he or she enters 'Orleans' into the registration Locality field
  And he or she enters 'IN' into the registration Region field
  And he or she enters '47452' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '4344044583' into the registration Home Phone field
  And he or she enters '4344044583' into the registration Mobile Phone field
  And he or she enters '17689' into the registration Work Phone field
  And he or she submits the Registration request
  Then Lamont verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, empty Wo...
  Given Devyn is a new customer
  When Devyn navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Devyn' into the First Name field
  And he or she enters 'Lancaster' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/21/1987' into the Date of Birth field
  And he or she enters '049-17-0094' into the Social Security Number field
  And he or she enters 'Devyn.Lancaster@demo.io' into the Email Address field
  And he or she enters 'IwQFWTUNiqTFKBKhhayH49693' into the registration Password field
  And he or she enters 'IwQFWTUNiqTFKBKhhayH49693' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB LAKS PALMAS B 10' into the registration Address field
  And he or she enters 'Madison' into the registration Locality field
  And he or she enters 'AL' into the registration Region field
  And he or she enters '35756' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '7013927041' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Devyn verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Devyn.Lancaster@demo.io
  And he or she enters 'IwQFWTUNiqTFKBKhhayH49693' into the login Password field
  And he or she submits the Login request


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, invalid ...
  Given Devyn is a new customer
  When Devyn navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Devyn' into the First Name field
  And he or she enters 'Leach' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/05/1926' into the Date of Birth field
  And he or she enters '097-94-8437' into the Social Security Number field
  And he or she enters 'Devyn.Leach@demo.io' into the Email Address field
  And he or she enters 'eVFLppnrqnQI498' into the registration Password field
  And he or she enters 'eVFLppnrqnQI498' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB. JARDINES DE VEGA BAJA' into the registration Address field
  And he or she enters 'Millville' into the registration Locality field
  And he or she enters 'PA' into the registration Region field
  And he or she enters '17846' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '9795956603' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '948' into the registration Work Phone field
  And he or she submits the Registration request
  Then Devyn verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, Invalid Mobile Phone
  Given Trace is a new customer
  When Trace navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Trace' into the First Name field
  And he or she enters 'Tillman' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/18/1950' into the Date of Birth field
  And he or she enters '032-84-7621' into the Social Security Number field
  And he or she enters 'Trace.Tillman@demo.io' into the Email Address field
  And he or she enters 'xQUOZUqFwOoQVP5' into the registration Password field
  And he or she enters 'xQUOZUqFwOoQVP5' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BOX 65' into the registration Address field
  And he or she enters 'Chambersburg' into the registration Locality field
  And he or she enters 'PA' into the registration Region field
  And he or she enters '17201' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '3078035211' into the registration Home Phone field
  And he or she enters '68' into the registration Mobile Phone field
  And he or she submits the Registration request
  Then Trace verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, empty Locality
  Given Duncan is a new customer
  When Duncan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Duncan' into the First Name field
  And he or she enters 'David' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/05/1986' into the Date of Birth field
  And he or she enters '277-31-4620' into the Social Security Number field
  And he or she enters 'Duncan.David@demo.io' into the Email Address field
  And he or she enters 'TMJhnUzW04' into the registration Password field
  And he or she enters 'TMJhnUzW04' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALLE GABRIEL CARDONA' into the registration Address field
  And he or she enters '' into the registration Locality field
  And he or she submits the Registration request
  Then Duncan verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, empty Address
  Given Miguel is a new customer
  When Miguel navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Miguel' into the First Name field
  And he or she enters 'Mcclure' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/30/1954' into the Date of Birth field
  And he or she enters '816-42-6170' into the Social Security Number field
  And he or she enters 'Miguel.Mcclure@demo.io' into the Email Address field
  And he or she enters 'CNTGeRFbFHVtiRLwQ683' into the registration Password field
  And he or she enters 'CNTGeRFbFHVtiRLwQ683' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '' into the registration Address field
  And he or she submits the Registration request
  Then Miguel verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, empty Password
  Given Zain is a new customer
  When Zain navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Zain' into the First Name field
  And he or she enters 'Haynes' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/01/1985' into the Date of Birth field
  And he or she enters '261-75-9160' into the Social Security Number field
  And he or she enters 'Zain.Haynes@demo.io' into the Email Address field
  And he or she enters '' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Zain verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password less than 8 characters
  Given Jaiden is a new customer
  When Jaiden navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jaiden' into the First Name field
  And he or she enters 'Moss' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '12/31/1970' into the Date of Birth field
  And he or she enters '208-33-7208' into the Social Security Number field
  And he or she enters 'Jaiden.Moss@demo.io' into the Email Address field
  And he or she enters 'NmlEE331' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Jaiden verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no lowercase
  Given Axel is a new customer
  When Axel navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Axel' into the First Name field
  And he or she enters 'White' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/26/1968' into the Date of Birth field
  And he or she enters '289-32-3097' into the Social Security Number field
  And he or she enters 'Axel.White@demo.io' into the Email Address field
  And he or she enters 'PAWDFCDUVUNPNKC21' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Axel verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no numeric
  Given Bo is a new customer
  When Bo navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Bo' into the First Name field
  And he or she enters 'Diaz' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/28/1990' into the Date of Birth field
  And he or she enters '045-33-0626' into the Social Security Number field
  And he or she enters 'Bo.Diaz@demo.io' into the Email Address field
  And he or she enters 'raDZxmeZxKE' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Bo verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no upper
  Given Leonel is a new customer
  When Leonel navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Leonel' into the First Name field
  And he or she enters 'Lawson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/14/1959' into the Date of Birth field
  And he or she enters '299-99-8016' into the Social Security Number field
  And he or she enters 'Leonel.Lawson@demo.io' into the Email Address field
  And he or she enters 'mxbqgynegs201' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Leonel verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, registered Email Address, valid Password, matching Confirm Password
  Given Jaren is a new customer
  When Jaren navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jaren' into the First Name field
  And he or she enters 'Lancaster' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '11/01/1997' into the Date of Birth field
  And he or she enters '414-74-5218' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'UvkVBkuL37' into the registration Password field
  And he or she enters 'UvkVBkuL37' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Jaren verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, registered SSN, valid Email Address, valid Password, matching Confirm Password
  Given Junior is a new customer
  When Junior navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Junior' into the First Name field
  And he or she enters 'Hatfield' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/24/1923' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'Junior.Hatfield@demo.io' into the Email Address field
  And he or she enters 'AmAAWtBWOolX2' into the registration Password field
  And he or she enters 'AmAAWtBWOolX2' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Junior verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, empty DoB
  Given Abdiel is a new customer
  When Abdiel navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Abdiel' into the First Name field
  And he or she enters 'Walsh' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Abdiel verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, invalid DoB
  Given Vincent is a new customer
  When Vincent navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Vincent' into the First Name field
  And he or she enters 'Hardy' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '1992-11-02w' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Vincent verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN less than 9 digits
  Given Ulises is a new customer
  When Ulises navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Ulises' into the First Name field
  And he or she enters 'Cross' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '02/14/1976' into the Date of Birth field
  And he or she enters '9' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Ulises verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN greater than 9 digits
  Given Brice is a new customer
  When Brice navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Brice' into the First Name field
  And he or she enters 'Wolf' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '05/06/1924' into the Date of Birth field
  And he or she enters '5956802847' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Brice verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN with invalid characters
  Given Thomas is a new customer
  When Thomas navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Thomas' into the First Name field
  And he or she enters 'Mcmillan' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '11/05/1932' into the Date of Birth field
  And he or she enters '967$75$6136' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Thomas verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, valid ...
  Given Camden is a new customer
  When Camden navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Camden' into the First Name field
  And he or she enters 'Branch' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '07/17/1977' into the Date of Birth field
  And he or she enters '814-49-5842' into the Social Security Number field
  And he or she enters 'Camden.Branch@demo.io' into the Email Address field
  And he or she enters 'StDEQIdOssEnpbQ5' into the registration Password field
  And he or she enters 'StDEQIdOssEnpbQ5' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'PARCELAS IMBERY 51' into the registration Address field
  And he or she enters 'Ojo sarco' into the registration Locality field
  And he or she enters 'NM' into the registration Region field
  And he or she enters '87550' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '8113219187' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '8113219187' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Camden verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Camden.Branch@demo.io
  And he or she enters 'StDEQIdOssEnpbQ5' into the login Password field
  And he or she submits the Login request


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, empty DoB
  Given Tristan is a new customer
  When Tristan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Tristan' into the First Name field
  And he or she enters 'Mcfarland' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Tristan verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, invalid DoB
  Given Giancarlo is a new customer
  When Giancarlo navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Giancarlo' into the First Name field
  And he or she enters 'Morris' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '1997-10-08uv' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Giancarlo verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, no Gender selected
  Given Alexandre is a new customer
  When Alexandre navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Alexandre' into the First Name field
  And he or she enters 'Mcdowell' into the Last Name field
  And he or she selects '' from the Gender radio button
  And he or she navigates to the Contact Details page
  Then Alexandre verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., valid First Name, empty Last Name
  Given Keenan is a new customer
  When Keenan navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Keenan' into the First Name field
  And he or she enters '' into the Last Name field
  And he or she navigates to the Contact Details page
  Then Keenan verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mr., empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Ms., valid First Name, valid Last Name, male Gender, valid DoB, registered SSN, registered Email Address, valid Password, matching Confirm Password
  Given Adrianna is a new customer
  When Adrianna navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters 'Adrianna' into the First Name field
  And he or she enters 'Mcintyre' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/20/1940' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'rfaAgzTOtIPzEv29247' into the registration Password field
  And he or she enters 'rfaAgzTOtIPzEv29247' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Adrianna verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with valid Title Ms., empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with valid Title Mrs., valid First Name, valid Last Name, female Gender, valid DoB, empty SSN
  Given Abbigail is a new customer
  When Abbigail navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters 'Abbigail' into the First Name field
  And he or she enters 'Carey' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '11/28/1955' into the Date of Birth field
  And he or she enters '' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Abbigail verifies he or she is presented with a Error Message indicating the field is required


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