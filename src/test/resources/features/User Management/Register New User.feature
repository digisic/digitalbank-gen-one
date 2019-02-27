@ui, @user, @registration
Feature: Register New User
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.



Scenario: Register user with Mr. title, M gender, empty Email Address
  Given Allen is a new customer
  When Allen navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Allen' into the First Name field
  And he or she enters 'Pearson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/07/1972' into the Date of Birth field
  And he or she enters '247-81-8873' into the Social Security Number field
  And he or she enters '' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Allen verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, Email Address with no at sign
  Given Roy is a new customer
  When Roy navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Roy' into the First Name field
  And he or she enters 'Anthony' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/04/1980' into the Date of Birth field
  And he or she enters '315-66-7286' into the Social Security Number field
  And he or she enters 'Roy.Anthonydemo.io' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Roy verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, Email Address without domain
  Given Dillon is a new customer
  When Dillon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dillon' into the First Name field
  And he or she enters 'Short' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/11/1972' into the Date of Birth field
  And he or she enters '827-55-6830' into the Social Security Number field
  And he or she enters 'Dillon.Short' into the Email Address field
  And he or she navigates to the Contact Details page
  Then Dillon verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, empty Confirm Password
  Given Kirk is a new customer
  When Kirk navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kirk' into the First Name field
  And he or she enters 'Oconnor' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/01/1935' into the Date of Birth field
  And he or she enters '976-27-0802' into the Social Security Number field
  And he or she enters 'Kirk.Oconnor@demo.io' into the Email Address field
  And he or she enters 'WJuwUZsmTnBzxFOcq8' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Kirk verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, non-matching Confirm Password
  Given Terrell is a new customer
  When Terrell navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Terrell' into the First Name field
  And he or she enters 'Mccarty' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/04/1987' into the Date of Birth field
  And he or she enters '824-65-7128' into the Social Security Number field
  And he or she enters 'Terrell.Mccarty@demo.io' into the Email Address field
  And he or she enters 'xahUPdpyVdOlEKCarzss18654' into the registration Password field
  And he or she enters '' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Terrell verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, empty Region
  Given Fredrick is a new customer
  When Fredrick navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Fredrick' into the First Name field
  And he or she enters 'Hodges' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '04/29/1997' into the Date of Birth field
  And he or she enters '266-03-8287' into the Social Security Number field
  And he or she enters 'Fredrick.Hodges@demo.io' into the Email Address field
  And he or she enters 'qtXhIceswuSLHBzv8458' into the registration Password field
  And he or she enters 'qtXhIceswuSLHBzv8458' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'HC 02 BOX 7455' into the registration Address field
  And he or she enters 'Farmingdale' into the registration Locality field
  And he or she enters '' into the registration Region field
  And he or she submits the Registration request
  Then Fredrick verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Postal Code
  Given Zachariah is a new customer
  When Zachariah navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Zachariah' into the First Name field
  And he or she enters 'Stephenson' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/11/1970' into the Date of Birth field
  And he or she enters '728-50-4951' into the Social Security Number field
  And he or she enters 'Zachariah.Stephenson@demo.io' into the Email Address field
  And he or she enters 'wnwFOeUq45440' into the registration Password field
  And he or she enters 'wnwFOeUq45440' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '36 AMERICO HERNANDEZ' into the registration Address field
  And he or she enters 'North chelmsford' into the registration Locality field
  And he or she enters 'MA' into the registration Region field
  And he or she enters '' into the registration Postal Code field
  And he or she submits the Registration request
  Then Zachariah verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Country
  Given Dominique is a new customer
  When Dominique navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dominique' into the First Name field
  And he or she enters 'Rowland' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/09/1997' into the Date of Birth field
  And he or she enters '232-71-5261' into the Social Security Number field
  And he or she enters 'Dominique.Rowland@demo.io' into the Email Address field
  And he or she enters 'IESncMuzVSfCqFvISlqs7' into the registration Password field
  And he or she enters 'IESncMuzVSfCqFvISlqs7' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB MONTERREY 1031 ARAMANA' into the registration Address field
  And he or she enters 'Frederick' into the registration Locality field
  And he or she enters 'MD' into the registration Region field
  And he or she enters '21704' into the registration Postal Code field
  And he or she enters '' into the registration Country field
  And he or she submits the Registration request
  Then Dominique verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Home Phone
  Given Payton is a new customer
  When Payton navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Payton' into the First Name field
  And he or she enters 'Clay' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/10/1953' into the Date of Birth field
  And he or she enters '258-85-3465' into the Social Security Number field
  And he or she enters 'Payton.Clay@demo.io' into the Email Address field
  And he or she enters 'LhhYuIXvsA999' into the registration Password field
  And he or she enters 'LhhYuIXvsA999' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB BORINQUEN I35 CALLE 3' into the registration Address field
  And he or she enters 'Lincoln' into the registration Locality field
  And he or she enters 'KS' into the registration Region field
  And he or she enters '67455' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '' into the registration Home Phone field
  And he or she submits the Registration request
  Then Payton verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, Invalid Home Phone
  Given Jaxon is a new customer
  When Jaxon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jaxon' into the First Name field
  And he or she enters 'Hood' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '10/13/1925' into the Date of Birth field
  And he or she enters '138-15-5342' into the Social Security Number field
  And he or she enters 'Jaxon.Hood@demo.io' into the Email Address field
  And he or she enters 'aIozTEBDBR839' into the registration Password field
  And he or she enters 'aIozTEBDBR839' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '26 BUCARE PARC MARQUEZ' into the registration Address field
  And he or she enters 'Gillham' into the registration Locality field
  And he or she enters 'AR' into the registration Region field
  And he or she enters '71841' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '6' into the registration Home Phone field
  And he or she submits the Registration request
  Then Jaxon verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M genderAgree False
  Given Roderick is a new customer
  When Roderick navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Roderick' into the First Name field
  And he or she enters 'Velasquez' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/03/1947' into the Date of Birth field
  And he or she enters '716-54-6821' into the Social Security Number field
  And he or she enters 'Roderick.Velasquez@demo.io' into the Email Address field
  And he or she enters 'drcOxmGvJDyaLzxtMzd91268' into the registration Password field
  And he or she enters 'drcOxmGvJDyaLzxtMzd91268' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '1 GRANDE ALLEE EST APP 17' into the registration Address field
  And he or she enters 'Novelty' into the registration Locality field
  And he or she enters 'OH' into the registration Region field
  And he or she enters '44072' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '6286937490' into the registration Home Phone field
  And he or she enters '6286937490' into the registration Mobile Phone field
  And he or she enters '6286937490' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Roderick verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Work PhoneAgree False
  Given Maximo is a new customer
  When Maximo navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Maximo' into the First Name field
  And he or she enters 'Tyler' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/22/1958' into the Date of Birth field
  And he or she enters '346-13-5902' into the Social Security Number field
  And he or she enters 'Maximo.Tyler@demo.io' into the Email Address field
  And he or she enters 'IPctGAcsMNWhqIKTBH469' into the registration Password field
  And he or she enters 'IPctGAcsMNWhqIKTBH469' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB BELLA VISTA A #5' into the registration Address field
  And he or she enters 'Hilger' into the registration Locality field
  And he or she enters 'MT' into the registration Region field
  And he or she enters '59451' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '2421904295' into the registration Home Phone field
  And he or she enters '2421904295' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'False' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Maximo verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, invalid Work Phone
  Given Stanley is a new customer
  When Stanley navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Stanley' into the First Name field
  And he or she enters 'Murphy' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/22/1992' into the Date of Birth field
  And he or she enters '718-94-3492' into the Social Security Number field
  And he or she enters 'Stanley.Murphy@demo.io' into the Email Address field
  And he or she enters 'ZxUMoDRzU5717' into the registration Password field
  And he or she enters 'ZxUMoDRzU5717' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '145 H CALLE JOSE PAREZ BO BARA' into the registration Address field
  And he or she enters 'Homestead' into the registration Locality field
  And he or she enters 'FL' into the registration Region field
  And he or she enters '33035' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '8077211278' into the registration Home Phone field
  And he or she enters '8077211278' into the registration Mobile Phone field
  And he or she enters '4710' into the registration Work Phone field
  And he or she submits the Registration request
  Then Stanley verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, empty Mobile Phone, empty Work Phone
  Given Corey is a new customer
  When Corey navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Corey' into the First Name field
  And he or she enters 'Bender' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '07/11/1950' into the Date of Birth field
  And he or she enters '389-25-9844' into the Social Security Number field
  And he or she enters 'Corey.Bender@demo.io' into the Email Address field
  And he or she enters 'yLPqkAdLIel14635' into the registration Password field
  And he or she enters 'yLPqkAdLIel14635' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'URB SAN AUGUSTO' into the registration Address field
  And he or she enters 'Randallstown' into the registration Locality field
  And he or she enters 'MD' into the registration Region field
  And he or she enters '21133' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '7183365522' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Corey verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Corey.Bender@demo.io
  And he or she enters 'yLPqkAdLIel14635' into the login Password field
  And he or she submits the login request
  And he or she verifies he or she is at the Home page


Scenario: Register user with Mr. title, M gender, empty Mobile Phone, invalid Work Phone
  Given Zion is a new customer
  When Zion navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Zion' into the First Name field
  And he or she enters 'Dyer' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '06/27/1956' into the Date of Birth field
  And he or she enters '994-05-5539' into the Social Security Number field
  And he or she enters 'Zion.Dyer@demo.io' into the Email Address field
  And he or she enters 'psogrsVuLeMUthe14' into the registration Password field
  And he or she enters 'psogrsVuLeMUthe14' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'CALLE BONET BUZON #803' into the registration Address field
  And he or she enters 'Los gatos' into the registration Locality field
  And he or she enters 'CA' into the registration Region field
  And he or she enters '95033' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '8724102617' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '976051' into the registration Work Phone field
  And he or she submits the Registration request
  Then Zion verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, Invalid Mobile Phone
  Given Kory is a new customer
  When Kory navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kory' into the First Name field
  And he or she enters 'Cortez' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/30/1946' into the Date of Birth field
  And he or she enters '475-80-2174' into the Social Security Number field
  And he or she enters 'Kory.Cortez@demo.io' into the Email Address field
  And he or she enters 'PhReqGLTSZnldIZ412' into the registration Password field
  And he or she enters 'PhReqGLTSZnldIZ412' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'ARECIBO GARDENS CALLE 5' into the registration Address field
  And he or she enters 'Madison' into the registration Locality field
  And he or she enters 'MN' into the registration Region field
  And he or she enters '56256' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '9311426350' into the registration Home Phone field
  And he or she enters '98997191' into the registration Mobile Phone field
  And he or she submits the Registration request
  Then Kory verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, empty Locality
  Given Aaron is a new customer
  When Aaron navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Aaron' into the First Name field
  And he or she enters 'Ingram' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/04/1939' into the Date of Birth field
  And he or she enters '659-55-0653' into the Social Security Number field
  And he or she enters 'Aaron.Ingram@demo.io' into the Email Address field
  And he or she enters 'YgySfKpFqrJ6' into the registration Password field
  And he or she enters 'YgySfKpFqrJ6' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'BOX 541' into the registration Address field
  And he or she enters '' into the registration Locality field
  And he or she submits the Registration request
  Then Aaron verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Address
  Given Gaige is a new customer
  When Gaige navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Gaige' into the First Name field
  And he or she enters 'Barker' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/11/1965' into the Date of Birth field
  And he or she enters '437-67-5772' into the Social Security Number field
  And he or she enters 'Gaige.Barker@demo.io' into the Email Address field
  And he or she enters 'nscNhXtIvZkhYdxeJF744' into the registration Password field
  And he or she enters 'nscNhXtIvZkhYdxeJF744' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters '' into the registration Address field
  And he or she submits the Registration request
  Then Gaige verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, empty Password
  Given Randy is a new customer
  When Randy navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Randy' into the First Name field
  And he or she enters 'Buckley' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/11/1985' into the Date of Birth field
  And he or she enters '265-13-1536' into the Social Security Number field
  And he or she enters 'Randy.Buckley@demo.io' into the Email Address field
  And he or she enters '' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Randy verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, Password less than 8 characters
  Given Dane is a new customer
  When Dane navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Dane' into the First Name field
  And he or she enters 'Fischer' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '01/17/1958' into the Date of Birth field
  And he or she enters '966-02-5148' into the Social Security Number field
  And he or she enters 'Dane.Fischer@demo.io' into the Email Address field
  And he or she enters 'y488' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Dane verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, Password with no lowercase
  Given Rylee is a new customer
  When Rylee navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Rylee' into the First Name field
  And he or she enters 'Robbins' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '08/08/1949' into the Date of Birth field
  And he or she enters '315-28-0525' into the Social Security Number field
  And he or she enters 'Rylee.Robbins@demo.io' into the Email Address field
  And he or she enters 'TPNEDPWCEFPKLW2237' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Rylee verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, Password with no numeric
  Given Ramiro is a new customer
  When Ramiro navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Ramiro' into the First Name field
  And he or she enters 'Mcfarland' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '05/02/1930' into the Date of Birth field
  And he or she enters '669-83-9883' into the Social Security Number field
  And he or she enters 'Ramiro.Mcfarland@demo.io' into the Email Address field
  And he or she enters 'nluPOjavDOpaljS' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Ramiro verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, Password with no upper
  Given Jaylin is a new customer
  When Jaylin navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jaylin' into the First Name field
  And he or she enters 'Alvarado' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/16/1947' into the Date of Birth field
  And he or she enters '936-29-2244' into the Social Security Number field
  And he or she enters 'Jaylin.Alvarado@demo.io' into the Email Address field
  And he or she enters 'bkuaslfrwf1' into the registration Password field
  And he or she navigates to the Contact Details page
  Then Jaylin verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, M gender, registered Email Address
  Given Damian is a new customer
  When Damian navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Damian' into the First Name field
  And he or she enters 'Stewart' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '09/05/1932' into the Date of Birth field
  And he or she enters '647-05-7630' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'sQUWDMahQAlsfazb65' into the registration Password field
  And he or she enters 'sQUWDMahQAlsfazb65' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Damian verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with Mr. title, M gender, registered SSN
  Given Rocco is a new customer
  When Rocco navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Rocco' into the First Name field
  And he or she enters 'Foreman' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '03/20/1968' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'Rocco.Foreman@demo.io' into the Email Address field
  And he or she enters 'OawkvRNEFKVZVnM96883' into the registration Password field
  And he or she enters 'OawkvRNEFKVZVnM96883' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Rocco verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with Mr. title, M gender, empty DoB
  Given Sebastian is a new customer
  When Sebastian navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Sebastian' into the First Name field
  And he or she enters 'Trevino' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Sebastian verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, M gender, invalid DoB
  Given Max is a new customer
  When Max navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Max' into the First Name field
  And he or she enters 'Sandoval' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '1959-09-30vx' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Max verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, F gender, SSN less than 9 digits
  Given Nicholas is a new customer
  When Nicholas navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Nicholas' into the First Name field
  And he or she enters 'Melendez' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '03/10/1930' into the Date of Birth field
  And he or she enters '5977' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Nicholas verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, F gender, SSN greater than 9 digits
  Given Gaige is a new customer
  When Gaige navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Gaige' into the First Name field
  And he or she enters 'Hughes' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '07/09/1967' into the Date of Birth field
  And he or she enters '70580856621' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Gaige verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, F gender, SSN with invalid characters
  Given Brock is a new customer
  When Brock navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Brock' into the First Name field
  And he or she enters 'Barrera' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '06/15/1995' into the Date of Birth field
  And he or she enters '765$86$3567' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Brock verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, F gender, empty Mobile Phone
  Given Darrell is a new customer
  When Darrell navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Darrell' into the First Name field
  And he or she enters 'Orr' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '12/16/1937' into the Date of Birth field
  And he or she enters '798-74-7089' into the Social Security Number field
  And he or she enters 'Darrell.Orr@demo.io' into the Email Address field
  And he or she enters 'FHigUuXMKmYZd77' into the registration Password field
  And he or she enters 'FHigUuXMKmYZd77' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  And he or she verifies he or she is the Contact Details page
  And he or she enters 'SANTANA URB. EXT. TANTAMA' into the registration Address field
  And he or she enters 'Paducah' into the registration Locality field
  And he or she enters 'KY' into the registration Region field
  And he or she enters '42001' into the registration Postal Code field
  And he or she enters 'United States' into the registration Country field
  And he or she enters '6506142002' into the registration Home Phone field
  And he or she enters '' into the registration Mobile Phone field
  And he or she enters '6506142002' into the registration Work Phone field
  And he or she selects 'True' from the Agree to Terms and Policy checkbox
  And he or she submits the Registration request
  Then Darrell verifies he or she is at the Login page
  And he or she verifies he or she is presented with a Registration Success Message
  And he or she verifies login Username contains Darrell.Orr@demo.io
  And he or she enters 'FHigUuXMKmYZd77' into the login Password field
  And he or she submits the login request
  And he or she verifies he or she is at the Home page


Scenario: Register user with Mr. title, F gender, empty DoB
  Given Abraham is a new customer
  When Abraham navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Abraham' into the First Name field
  And he or she enters 'Randolph' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Abraham verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, F gender, invalid DoB
  Given Kenyon is a new customer
  When Kenyon navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Kenyon' into the First Name field
  And he or she enters 'Newton' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '1948-10-18n' into the Date of Birth field
  And he or she navigates to the Contact Details page
  Then Kenyon verifies he or she is presented with a Error Message indicating input value does not meet required format for the field


Scenario: Register user with Mr. title, gender not selected
  Given Jamari is a new customer
  When Jamari navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Jamari' into the First Name field
  And he or she enters 'Ferguson' into the Last Name field
  And he or she selects '' from the Gender radio button
  And he or she navigates to the Contact Details page
  Then Jamari verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, empty Last Name
  Given Wilson is a new customer
  When Wilson navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters 'Wilson' into the First Name field
  And he or she enters '' into the Last Name field
  And he or she navigates to the Contact Details page
  Then Wilson verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mr. title, empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Mr.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Ms. title, M gender, registered SSN, registered Email Address
  Given Annie is a new customer
  When Annie navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters 'Annie' into the First Name field
  And he or she enters 'Edwards' into the Last Name field
  And he or she selects 'M' from the Gender radio button
  And he or she enters '02/23/1969' into the Date of Birth field
  And he or she enters '123-45-6789' into the Social Security Number field
  And he or she enters 'jsmith@demo.io' into the Email Address field
  And he or she enters 'CNiovhqmxeWj73' into the registration Password field
  And he or she enters 'CNiovhqmxeWj73' into the registration Confirm Password field
  And he or she navigates to the Contact Details page
  Then Annie verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account


Scenario: Register user with Ms. title, empty First Name
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And he or she selects 'Ms.' from the Title radio button
  And he or she enters '' into the First Name field
  And he or she navigates to the Contact Details page
  Then Kate verifies he or she is presented with a Error Message indicating the field is required


Scenario: Register user with Mrs. title, F gender, empty SSN
  Given Monique is a new customer
  When Monique navigates to the Registration page
  And he or she selects 'Mrs.' from the Title radio button
  And he or she enters 'Monique' into the First Name field
  And he or she enters 'Fletcher' into the Last Name field
  And he or she selects 'F' from the Gender radio button
  And he or she enters '12/21/1979' into the Date of Birth field
  And he or she enters '' into the Social Security Number field
  And he or she navigates to the Contact Details page
  Then Monique verifies he or she is presented with a Error Message indicating the field is required


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