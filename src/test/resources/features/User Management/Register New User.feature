Feature: Register New User
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, empty Email Address
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Aliza' into the First Name field
  And I enter 'Burt' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '12/31/1947' into the Date of Birth field
  And I enter '829-58-0278' into the Social Security Number field
  And I enter '' into the Email Address field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, Email Address with no at sign
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Christa' into the First Name field
  And I enter 'Small' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '01/18/1948' into the Date of Birth field
  And I enter '289-05-7364' into the Social Security Number field
  And I enter 'Christa.Smalldemo.io' into the Email Address field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, Email Address without domain
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Hadley' into the First Name field
  And I enter 'Jordan' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '03/31/1961' into the Date of Birth field
  And I enter '532-88-1892' into the Social Security Number field
  And I enter 'Hadley.Jordan' into the Email Address field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, empty Confirm Password
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Ava' into the First Name field
  And I enter 'Mcconnell' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '04/29/1936' into the Date of Birth field
  And I enter '203-84-0003' into the Social Security Number field
  And I enter 'Ava.Mcconnell@demo.io' into the Email Address field
  And I enter 'lstjnMPjb68459' into the Password field
  And I enter '' into the Confirm Password field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, non-matching Confirm Password
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Cassandra' into the First Name field
  And I enter 'Carey' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '05/16/1999' into the Date of Birth field
  And I enter '029-24-3424' into the Social Security Number field
  And I enter 'Cassandra.Carey@demo.io' into the Email Address field
  And I enter 'iPPHMeiTNQJizWit16282' into the Password field
  And I enter '' into the Confirm Password field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, empty Region
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Kennedy' into the First Name field
  And I enter 'Mckay' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '06/09/1960' into the Date of Birth field
  And I enter '956-61-9193' into the Social Security Number field
  And I enter 'Kennedy.Mckay@demo.io' into the Email Address field
  And I enter 'HfaqpBvSXHJcqSw6171' into the Password field
  And I enter 'HfaqpBvSXHJcqSw6171' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter 'HC 2 BOX 6602' into the Address field
  And I enter 'Hooper' into the Locality field
  And I enter '' into the Region field
  And I click the Register button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, empty Postal Code
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Julia' into the First Name field
  And I enter 'Acosta' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '04/24/1961' into the Date of Birth field
  And I enter '725-11-0526' into the Social Security Number field
  And I enter 'Julia.Acosta@demo.io' into the Email Address field
  And I enter 'TcPLdpNfNYGwscpn536' into the Password field
  And I enter 'TcPLdpNfNYGwscpn536' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter 'VICTORIAN AT MCKENZIE 161 4000' into the Address field
  And I enter 'Riverside' into the Locality field
  And I enter 'CA' into the Region field
  And I enter '' into the Postal Code field
  And I click the Register button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, empty Country, valid Postal Code
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Desirae' into the First Name field
  And I enter 'Valentine' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '11/30/1961' into the Date of Birth field
  And I enter '984-04-3187' into the Social Security Number field
  And I enter 'Desirae.Valentine@demo.io' into the Email Address field
  And I enter 'EOoMrywZPqwZq30094' into the Password field
  And I enter 'EOoMrywZPqwZq30094' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter '102 700 MARTIN AVE' into the Address field
  And I enter 'Magness' into the Locality field
  And I enter 'AR' into the Region field
  And I enter '72553' into the Postal Code field
  And I enter '' into the Country field
  And I click the Register button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, empty Home Phone
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Zoie' into the First Name field
  And I enter 'Pickett' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '11/21/1997' into the Date of Birth field
  And I enter '140-43-9837' into the Social Security Number field
  And I enter 'Zoie.Pickett@demo.io' into the Email Address field
  And I enter 'lXqWNStTecDceTxSR31847' into the Password field
  And I enter 'lXqWNStTecDceTxSR31847' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter 'HC-01 BOX 3333' into the Address field
  And I enter 'Hardin' into the Locality field
  And I enter 'IL' into the Region field
  And I enter '62047' into the Postal Code field
  And I enter 'United States' into the Country field
  And I enter '' into the Home Phone field
  And I click the Register button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, Invalid Home Phone
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Lyric' into the First Name field
  And I enter 'Hood' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '02/20/1926' into the Date of Birth field
  And I enter '097-54-8291' into the Social Security Number field
  And I enter 'Lyric.Hood@demo.io' into the Email Address field
  And I enter 'djOPKbDnlQbrMXJgzsD178' into the Password field
  And I enter 'djOPKbDnlQbrMXJgzsD178' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter 'HC 1 BOX 12005' into the Address field
  And I enter 'Decatur' into the Locality field
  And I enter 'GA' into the Region field
  And I enter '30031' into the Postal Code field
  And I enter 'United States' into the Country field
  And I enter '80536' into the Home Phone field
  And I click the Register button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, valid Wo...
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Luisa' into the First Name field
  And I enter 'Hudson' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '04/17/1936' into the Date of Birth field
  And I enter '997-48-0273' into the Social Security Number field
  And I enter 'Luisa.Hudson@demo.io' into the Email Address field
  And I enter 'NeWDBFgzad3299' into the Password field
  And I enter 'NeWDBFgzad3299' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter 'HC-05 BOX 43225' into the Address field
  And I enter 'Sacramento' into the Locality field
  And I enter 'CA' into the Region field
  And I enter '94230' into the Postal Code field
  And I enter 'United States' into the Country field
  And I enter '2811722553' into the Home Phone field
  And I enter '2811722553' into the Mobile Phone field
  And I enter '2811722553' into the Work Phone field
  And I select 'False' from the Agree to Terms and Policy checkbox
  And I click the Register button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, empty Wo...
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Janice' into the First Name field
  And I enter 'Bradford' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '01/12/1965' into the Date of Birth field
  And I enter '843-21-8006' into the Social Security Number field
  And I enter 'Janice.Bradford@demo.io' into the Email Address field
  And I enter 'QFnudaXIZNEjM65' into the Password field
  And I enter 'QFnudaXIZNEjM65' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter 'URB ALTA VISTA CALLE CIPRES 10' into the Address field
  And I enter 'Leitchfield' into the Locality field
  And I enter 'KY' into the Region field
  And I enter '42754' into the Postal Code field
  And I enter 'United States' into the Country field
  And I enter '3112633402' into the Home Phone field
  And I enter '3112633402' into the Mobile Phone field
  And I enter '' into the Work Phone field
  And I select 'False' from the Agree to Terms and Policy checkbox
  And I click the Register button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, valid Mobile Phone, invalid ...
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Sophia' into the First Name field
  And I enter 'Bryan' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '09/22/1969' into the Date of Birth field
  And I enter '717-23-3359' into the Social Security Number field
  And I enter 'Sophia.Bryan@demo.io' into the Email Address field
  And I enter 'TOAQsqsYuazqilcqCoZ63727' into the Password field
  And I enter 'TOAQsqsYuazqilcqCoZ63727' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter 'HC 01 BOX 3628' into the Address field
  And I enter 'Madison' into the Locality field
  And I enter 'OH' into the Region field
  And I enter '44057' into the Postal Code field
  And I enter 'United States' into the Country field
  And I enter '3146685404' into the Home Phone field
  And I enter '3146685404' into the Mobile Phone field
  And I enter '825566' into the Work Phone field
  And I click the Register button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, empty Wo...
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Laila' into the First Name field
  And I enter 'Pugh' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '03/05/1976' into the Date of Birth field
  And I enter '821-13-8438' into the Social Security Number field
  And I enter 'Laila.Pugh@demo.io' into the Email Address field
  And I enter 'fgsgFRYS05' into the Password field
  And I enter 'fgsgFRYS05' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter 'HC03 APDO.9555' into the Address field
  And I enter 'Cross plains' into the Locality field
  And I enter 'IN' into the Region field
  And I enter '47017' into the Postal Code field
  And I enter 'United States' into the Country field
  And I enter '4014249771' into the Home Phone field
  And I enter '' into the Mobile Phone field
  And I enter '' into the Work Phone field
  And I select 'True' from the Agree to Terms and Policy checkbox
  And I click the Register button
  Then I verify I am at the Login page
  And I verify I am presented with a Registration Success Message

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, invalid ...
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Macy' into the First Name field
  And I enter 'Nichols' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '05/14/1954' into the Date of Birth field
  And I enter '942-78-7515' into the Social Security Number field
  And I enter 'Macy.Nichols@demo.io' into the Email Address field
  And I enter 'sUhsaTEq48931' into the Password field
  And I enter 'sUhsaTEq48931' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter '226 CERVANTES MANSIONES DE ESP' into the Address field
  And I enter 'Morris' into the Locality field
  And I enter 'MN' into the Region field
  And I enter '56267' into the Postal Code field
  And I enter 'United States' into the Country field
  And I enter '7321143472' into the Home Phone field
  And I enter '' into the Mobile Phone field
  And I enter '54660' into the Work Phone field
  And I click the Register button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, Invalid Mobile Phone
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Frances' into the First Name field
  And I enter 'Irwin' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '12/13/1978' into the Date of Birth field
  And I enter '226-49-5466' into the Social Security Number field
  And I enter 'Frances.Irwin@demo.io' into the Email Address field
  And I enter 'HYzUCCdpQmRGHgD81578' into the Password field
  And I enter 'HYzUCCdpQmRGHgD81578' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter 'HC 02 BUZON 18669' into the Address field
  And I enter 'New auburn' into the Locality field
  And I enter 'WI' into the Region field
  And I enter '54757' into the Postal Code field
  And I enter 'United States' into the Country field
  And I enter '5114943812' into the Home Phone field
  And I enter '760750' into the Mobile Phone field
  And I click the Register button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, empty Locality
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Halle' into the First Name field
  And I enter 'Allison' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '03/18/1991' into the Date of Birth field
  And I enter '789-16-7454' into the Social Security Number field
  And I enter 'Halle.Allison@demo.io' into the Email Address field
  And I enter 'xCpsHxdaBPSwK0533' into the Password field
  And I enter 'xCpsHxdaBPSwK0533' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter 'HC-01 BOX 2539' into the Address field
  And I enter '' into the Locality field
  And I click the Register button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, empty Address
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Allyssa' into the First Name field
  And I enter 'Spencer' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '03/27/1968' into the Date of Birth field
  And I enter '795-15-6113' into the Social Security Number field
  And I enter 'Allyssa.Spencer@demo.io' into the Email Address field
  And I enter 'aUhaaOtrx647' into the Password field
  And I enter 'aUhaaOtrx647' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter '' into the Address field
  And I click the Register button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, empty Password
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Ruth' into the First Name field
  And I enter 'Case' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '06/11/1969' into the Date of Birth field
  And I enter '728-73-9244' into the Social Security Number field
  And I enter 'Ruth.Case@demo.io' into the Email Address field
  And I enter '' into the Password field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password less than 8 characters
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Susan' into the First Name field
  And I enter 'Morales' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '09/16/1985' into the Date of Birth field
  And I enter '316-08-0089' into the Social Security Number field
  And I enter 'Susan.Morales@demo.io' into the Email Address field
  And I enter 'mEBvc25626' into the Password field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no lowercase
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Nayeli' into the First Name field
  And I enter 'White' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '01/10/1989' into the Date of Birth field
  And I enter '068-52-0512' into the Social Security Number field
  And I enter 'Nayeli.White@demo.io' into the Email Address field
  And I enter 'SEYMQIUWQOINDOTXVDZ8' into the Password field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no numeric
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Kristina' into the First Name field
  And I enter 'Keith' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '11/26/1933' into the Date of Birth field
  And I enter '675-44-7668' into the Social Security Number field
  And I enter 'Kristina.Keith@demo.io' into the Email Address field
  And I enter 'zlcuQqyMt' into the Password field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, valid Email Address, Password with no upper
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Jaylin' into the First Name field
  And I enter 'Herman' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '06/01/1950' into the Date of Birth field
  And I enter '574-70-8976' into the Social Security Number field
  And I enter 'Jaylin.Herman@demo.io' into the Email Address field
  And I enter 'qvrfuwonmehl7321' into the Password field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, valid SSN, registered Email Address, valid Password, matching Confirm Password
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Kassandra' into the First Name field
  And I enter 'Buck' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '06/30/1972' into the Date of Birth field
  And I enter '131-03-9772' into the Social Security Number field
  And I enter 'jsmith@demo.io' into the Email Address field
  And I enter 'ACWYeIdPYQ593' into the Password field
  And I enter 'ACWYeIdPYQ593' into the Confirm Password field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the input value entered matches an existing Registered User Account

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, valid DoB, registered SSN, valid Email Address, valid Password, matching Confirm Password
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Iyana' into the First Name field
  And I enter 'Daniels' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '04/07/1936' into the Date of Birth field
  And I enter '123-45-6789' into the Social Security Number field
  And I enter 'Iyana.Daniels@demo.io' into the Email Address field
  And I enter 'lUDsqTTFZSySJFx77629' into the Password field
  And I enter 'lUDsqTTFZSySJFx77629' into the Confirm Password field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the input value entered matches an existing Registered User Account

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, empty DoB
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Lily' into the First Name field
  And I enter 'Powell' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '' into the Date of Birth field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, male Gender, invalid DoB
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Emma' into the First Name field
  And I enter 'Garcia' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '1995-05-19x' into the Date of Birth field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN less than 9 digits
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Makaila' into the First Name field
  And I enter 'Mcmahon' into the Last Name field
  And I select 'F' from the Gender radio button
  And I enter '05/23/1986' into the Date of Birth field
  And I enter '9016460' into the Social Security Number field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN greater than 9 digits
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Lina' into the First Name field
  And I enter 'Howe' into the Last Name field
  And I select 'F' from the Gender radio button
  And I enter '05/26/1985' into the Date of Birth field
  And I enter '725031236686972' into the Social Security Number field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, SSN with invalid characters
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Karissa' into the First Name field
  And I enter 'Duncan' into the Last Name field
  And I select 'F' from the Gender radio button
  And I enter '02/03/1942' into the Date of Birth field
  And I enter '162$41$5952' into the Social Security Number field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, valid DoB, valid SSN, valid Email Address, valid Password, matching Confirm Password, valid Address, valid Locality, valid Region, valid Country, valid Postal Code, valid Home Phone, empty Mobile Phone, valid ...
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Shania' into the First Name field
  And I enter 'Lopez' into the Last Name field
  And I select 'F' from the Gender radio button
  And I enter '01/06/1937' into the Date of Birth field
  And I enter '141-54-1492' into the Social Security Number field
  And I enter 'Shania.Lopez@demo.io' into the Email Address field
  And I enter 'rWUglhQrEPx4677' into the Password field
  And I enter 'rWUglhQrEPx4677' into the Confirm Password field
  And I click the Next button
  And I verify I am at the Contact Details page
  And I enter 'HC 1 BOX 5003' into the Address field
  And I enter 'Port townsend' into the Locality field
  And I enter 'WA' into the Region field
  And I enter '98368' into the Postal Code field
  And I enter 'United States' into the Country field
  And I enter '8781758387' into the Home Phone field
  And I enter '' into the Mobile Phone field
  And I enter '8781758387' into the Work Phone field
  And I select 'True' from the Agree to Terms and Policy checkbox
  And I click the Register button
  Then I verify I am at the Login page
  And I verify I am presented with a Registration Success Message

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, empty DoB
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Sage' into the First Name field
  And I enter 'Weber' into the Last Name field
  And I select 'F' from the Gender radio button
  And I enter '' into the Date of Birth field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, female Gender, invalid DoB
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Baylee' into the First Name field
  And I enter 'Lindsay' into the Last Name field
  And I select 'F' from the Gender radio button
  And I enter '1934-11-27poo' into the Date of Birth field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating input value does not meet required format for the field

Scenario: Register user with valid Title Mr., valid First Name, valid Last Name, no Gender selected
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Marcella' into the First Name field
  And I enter 'Yang' into the Last Name field
  And I select '' from the Gender radio button
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., valid First Name, empty Last Name
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter 'Daphne' into the First Name field
  And I enter '' into the Last Name field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mr., empty First Name
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mr.' from the Title radio button
  And I enter '' into the First Name field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Ms., valid First Name, valid Last Name, male Gender, valid DoB, registered SSN, registered Email Address, valid Password, matching Confirm Password
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Ms.' from the Title radio button
  And I enter 'Brittney' into the First Name field
  And I enter 'Rogers' into the Last Name field
  And I select 'M' from the Gender radio button
  And I enter '09/26/1994' into the Date of Birth field
  And I enter '123-45-6789' into the Social Security Number field
  And I enter 'jsmith@demo.io' into the Email Address field
  And I enter 'nVNRnlJdHFuWdBEhDICW83473' into the Password field
  And I enter 'nVNRnlJdHFuWdBEhDICW83473' into the Confirm Password field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the input value entered matches an existing Registered User Account

Scenario: Register user with valid Title Ms., empty First Name
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Ms.' from the Title radio button
  And I enter '' into the First Name field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mrs., valid First Name, valid Last Name, female Gender, valid DoB, empty SSN
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mrs.' from the Title radio button
  And I enter 'Melinda' into the First Name field
  And I enter 'Wiley' into the Last Name field
  And I select 'F' from the Gender radio button
  And I enter '06/15/1962' into the Date of Birth field
  And I enter '' into the Social Security Number field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with valid Title Mrs., empty First Name
  Given I am a New Customer
  And I am at the Registration page
  When I select 'Mrs.' from the Title radio button
  And I enter '' into the First Name field
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the field is required

Scenario: Register user with no Title selected
  Given I am a New Customer
  And I am at the Registration page
  When I select '' from the Title radio button
  And I click the Next button
  Then I verify I am presented with a Error Message indicating the field is required
