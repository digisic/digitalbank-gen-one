@ui @user @security @register
Feature: Register New User (UI)
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.


@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Email Address expecting an Error result
  Given Quinten is a new customer
  When Quinten navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Quinten' into the First Name field
  And they enter 'Shaffer' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '03/24/1958' into the Date of Birth field
  And they enter '191-07-7554' into the Social Security Number field
  And they enter '' into the Email Address field
  And they navigate to the Contact Details page
  Then Quinten verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address with no at sign expecting an Error result
  Given Toby is a new customer
  When Toby navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Toby' into the First Name field
  And they enter 'Sandoval' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '12/30/1933' into the Date of Birth field
  And they enter '604-53-4565' into the Social Security Number field
  And they enter 'Toby84976gmail.com' into the Email Address field
  And they navigate to the Contact Details page
  Then Toby verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address without domain expecting an Error result
  Given Silas is a new customer
  When Silas navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Silas' into the First Name field
  And they enter 'Curry' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '05/05/1966' into the Date of Birth field
  And they enter '329-65-1375' into the Social Security Number field
  And they enter 'Silas548407@' into the Email Address field
  And they navigate to the Contact Details page
  Then Silas verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Confirm Password expecting an Error result
  Given Tyrone is a new customer
  When Tyrone navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Tyrone' into the First Name field
  And they enter 'Gates' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '05/13/1944' into the Date of Birth field
  And they enter '682-24-9629' into the Social Security Number field
  And they enter 'Tyrone086398@gmail.com' into the Email Address field
  And they enter 'cMGGXzcfeFfuDASRgUZ87' into the registration Password field
  And they enter '' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Tyrone verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, non-matching Confirm Password expecting an Error result
  Given Philip is a new customer
  When Philip navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Philip' into the First Name field
  And they enter 'Rowland' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '02/25/1931' into the Date of Birth field
  And they enter '765-42-8965' into the Social Security Number field
  And they enter 'Philip2320@gmail.com' into the Email Address field
  And they enter 'CMaZmNWsDefPnLb83752' into the registration Password field
  And they enter '' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Philip verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Region expecting an Error result
  Given Cameron is a new customer
  When Cameron navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Cameron' into the First Name field
  And they enter 'Cash' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '12/20/1947' into the Date of Birth field
  And they enter '790-44-7154' into the Social Security Number field
  And they enter 'Cameron286885@gmail.com' into the Email Address field
  And they enter 'UfmkcjdsFFBo10525' into the registration Password field
  And they enter 'UfmkcjdsFFBo10525' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'HC 05 BOX 43186' into the registration Address field
  And they enter 'Creighton' into the registration Locality field
  And they enter '' into the registration Region field
  And they submit the Registration request
  Then Cameron verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Postal Code expecting an Error result
  Given Rodrigo is a new customer
  When Rodrigo navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Rodrigo' into the First Name field
  And they enter 'Hensley' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/05/1924' into the Date of Birth field
  And they enter '363-47-4227' into the Social Security Number field
  And they enter 'Rodrigo8795@gmail.com' into the Email Address field
  And they enter 'qnqJQjFBcD250' into the registration Password field
  And they enter 'qnqJQjFBcD250' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'HC-02 BOX 7535' into the registration Address field
  And they enter 'Oakland' into the registration Locality field
  And they enter 'OR' into the registration Region field
  And they enter '' into the registration Postal Code field
  And they submit the Registration request
  Then Rodrigo verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Country expecting an Error result
  Given Santos is a new customer
  When Santos navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Santos' into the First Name field
  And they enter 'Bradford' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/16/1931' into the Date of Birth field
  And they enter '548-99-2543' into the Social Security Number field
  And they enter 'Santos990055@gmail.com' into the Email Address field
  And they enter 'zkyFeUfIgq373' into the registration Password field
  And they enter 'zkyFeUfIgq373' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'BO MANI CLAUDIO CARRERO 285' into the registration Address field
  And they enter 'Leander' into the registration Locality field
  And they enter 'LA' into the registration Region field
  And they enter '71445' into the registration Postal Code field
  And they enter '' into the registration Country field
  And they submit the Registration request
  Then Santos verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Home Phone expecting an Error result
  Given Travis is a new customer
  When Travis navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Travis' into the First Name field
  And they enter 'Avila' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/18/1960' into the Date of Birth field
  And they enter '213-96-6948' into the Social Security Number field
  And they enter 'Travis72165@gmail.com' into the Email Address field
  And they enter 'NHEGEOnjdDi961' into the registration Password field
  And they enter 'NHEGEOnjdDi961' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'RONDA 68 URB SULTANA' into the registration Address field
  And they enter 'Culver city' into the registration Locality field
  And they enter 'CA' into the registration Region field
  And they enter '90233' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '' into the registration Home Phone field
  And they submit the Registration request
  Then Travis verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Home Phone expecting an Error result
  Given Angelo is a new customer
  When Angelo navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Angelo' into the First Name field
  And they enter 'Macias' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '11/04/1950' into the Date of Birth field
  And they enter '078-91-5559' into the Social Security Number field
  And they enter 'Angelo523449@gmail.com' into the Email Address field
  And they enter 'MdoGdmbwyuZB7879' into the registration Password field
  And they enter 'MdoGdmbwyuZB7879' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'CALLE ANGELES BUZ N 2538' into the registration Address field
  And they enter 'Garnett' into the registration Locality field
  And they enter 'SC' into the registration Region field
  And they enter '29922' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '70898' into the registration Home Phone field
  And they submit the Registration request
  Then Angelo verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Agree False expecting an Error result
  Given Craig is a new customer
  When Craig navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Craig' into the First Name field
  And they enter 'Mclean' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/11/1934' into the Date of Birth field
  And they enter '343-78-0832' into the Social Security Number field
  And they enter 'Craig41368@gmail.com' into the Email Address field
  And they enter 'OzecsVdFuvdXGX01' into the registration Password field
  And they enter 'OzecsVdFuvdXGX01' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'HC-02 BOX 15751' into the registration Address field
  And they enter 'Henlawson' into the registration Locality field
  And they enter 'WV' into the registration Region field
  And they enter '25624' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '6047683231' into the registration Home Phone field
  And they enter '6047683231' into the registration Mobile Phone field
  And they enter '6047683231' into the registration Work Phone field
  And they select 'False' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Craig verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Work Phone, Agree False expecting an Error result
  Given Johnathon is a new customer
  When Johnathon navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Johnathon' into the First Name field
  And they enter 'Nguyen' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '08/28/1957' into the Date of Birth field
  And they enter '879-41-9163' into the Social Security Number field
  And they enter 'Johnathon8923@gmail.com' into the Email Address field
  And they enter 'fxqScZYbjum89' into the registration Password field
  And they enter 'fxqScZYbjum89' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'HC 01 BOX 2935 C-9' into the registration Address field
  And they enter 'Lone pine' into the registration Locality field
  And they enter 'CA' into the registration Region field
  And they enter '93545' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '2092331656' into the registration Home Phone field
  And they enter '2092331656' into the registration Mobile Phone field
  And they enter '' into the registration Work Phone field
  And they select 'False' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Johnathon verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid Work Phone expecting an Error result
  Given Tristan is a new customer
  When Tristan navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Tristan' into the First Name field
  And they enter 'Talley' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '05/20/1988' into the Date of Birth field
  And they enter '323-37-5556' into the Social Security Number field
  And they enter 'Tristan4076@gmail.com' into the Email Address field
  And they enter 'QCzFFAYqZXfRzlOi95' into the registration Password field
  And they enter 'QCzFFAYqZXfRzlOi95' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'URB INMACULADA 205 M BERRIOS' into the registration Address field
  And they enter 'Ormond beach' into the registration Locality field
  And they enter 'FL' into the registration Region field
  And they enter '32176' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '2706468949' into the registration Home Phone field
  And they enter '2706468949' into the registration Mobile Phone field
  And they enter '2' into the registration Work Phone field
  And they submit the Registration request
  Then Tristan verifies they are presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, empty Work Phone expecting a Successful registration
  Given Brady is a new customer
  When Brady navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Brady' into the First Name field
  And they enter 'Barton' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '02/13/1979' into the Date of Birth field
  And they enter '888-59-9359' into the Social Security Number field
  And they enter 'Brady663135@gmail.com' into the Email Address field
  And they enter 'zerTVWBdsLFubeFQiFd1841' into the registration Password field
  And they enter 'zerTVWBdsLFubeFQiFd1841' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'EL ARENDADO A #25 BUZON 238' into the registration Address field
  And they enter 'Tolley' into the registration Locality field
  And they enter 'ND' into the registration Region field
  And they enter '58787' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '5644972700' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '' into the registration Work Phone field
  And they select 'True' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Brady verifies they are at the Login page
  And they verify they are presented with a Registration Success Message
  And they verify login Username contains Brady663135@gmail.com
  And they enter 'zerTVWBdsLFubeFQiFd1841' into the login Password field
  And they submit the login request
  And they verify they are at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, invalid Work Phone expecting an Error result
  Given Emerson is a new customer
  When Emerson navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Emerson' into the First Name field
  And they enter 'Mccall' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '10/24/1929' into the Date of Birth field
  And they enter '786-81-6608' into the Social Security Number field
  And they enter 'Emerson903037@gmail.com' into the Email Address field
  And they enter 'PRkhhosi4' into the registration Password field
  And they enter 'PRkhhosi4' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'BOX 965' into the registration Address field
  And they enter 'Bremerton' into the registration Locality field
  And they enter 'WA' into the registration Region field
  And they enter '98312' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '7109375467' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '906925' into the registration Work Phone field
  And they submit the Registration request
  Then Emerson verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Mobile Phone expecting an Error result
  Given Jesus is a new customer
  When Jesus navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Jesus' into the First Name field
  And they enter 'Rice' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '02/14/1964' into the Date of Birth field
  And they enter '138-51-5435' into the Social Security Number field
  And they enter 'Jesus56571@gmail.com' into the Email Address field
  And they enter 'iJKsAXsLWbaVENGUkSdV45785' into the registration Password field
  And they enter 'iJKsAXsLWbaVENGUkSdV45785' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'CALLE 4 BUZON 45 PARC. IMBERY' into the registration Address field
  And they enter 'Palermo' into the registration Locality field
  And they enter 'ME' into the registration Region field
  And they enter '43540' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '9095032433' into the registration Home Phone field
  And they enter '111' into the registration Mobile Phone field
  And they submit the Registration request
  Then Jesus verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Locality expecting an Error result
  Given Kieran is a new customer
  When Kieran navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Kieran' into the First Name field
  And they enter 'Bowman' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/17/1988' into the Date of Birth field
  And they enter '569-95-2770' into the Social Security Number field
  And they enter 'Kieran593637@gmail.com' into the Email Address field
  And they enter 'RdoDcgHPeqyHfUg176' into the registration Password field
  And they enter 'RdoDcgHPeqyHfUg176' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'VILLA ROCA H26 CALLE 23' into the registration Address field
  And they enter '' into the registration Locality field
  And they submit the Registration request
  Then Kieran verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Address expecting an Error result
  Given Antwan is a new customer
  When Antwan navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Antwan' into the First Name field
  And they enter 'Klein' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/27/1970' into the Date of Birth field
  And they enter '455-79-9648' into the Social Security Number field
  And they enter 'Antwan711632@gmail.com' into the Email Address field
  And they enter 'uMJNcIiOxtZ2' into the registration Password field
  And they enter 'uMJNcIiOxtZ2' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter '' into the registration Address field
  And they submit the Registration request
  Then Antwan verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Password expecting an Error result
  Given Wilson is a new customer
  When Wilson navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Wilson' into the First Name field
  And they enter 'Bryan' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '12/24/1970' into the Date of Birth field
  And they enter '757-61-1370' into the Social Security Number field
  And they enter 'Wilson18722@gmail.com' into the Email Address field
  And they enter '' into the registration Password field
  And they navigate to the Contact Details page
  Then Wilson verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password less than 8 characters expecting an Error result
  Given Yosef is a new customer
  When Yosef navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Yosef' into the First Name field
  And they enter 'Castaneda' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/21/1925' into the Date of Birth field
  And they enter '221-68-7788' into the Social Security Number field
  And they enter 'Yosef475834@gmail.com' into the Email Address field
  And they enter 'AlKpm9460' into the registration Password field
  And they navigate to the Contact Details page
  Then Yosef verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no lowercase expecting an Error result
  Given Eric is a new customer
  When Eric navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Eric' into the First Name field
  And they enter 'William' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/02/1957' into the Date of Birth field
  And they enter '340-83-8635' into the Social Security Number field
  And they enter 'Eric54742@gmail.com' into the Email Address field
  And they enter 'AYOIRUIBVPSXTWSEIQ929' into the registration Password field
  And they navigate to the Contact Details page
  Then Eric verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no numeric expecting an Error result
  Given Aaron is a new customer
  When Aaron navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Aaron' into the First Name field
  And they enter 'Merritt' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '08/27/1965' into the Date of Birth field
  And they enter '436-60-6684' into the Social Security Number field
  And they enter 'Aaron450018@gmail.com' into the Email Address field
  And they enter 'WywQEoknHT' into the registration Password field
  And they navigate to the Contact Details page
  Then Aaron verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no upper expecting an Error result
  Given Asher is a new customer
  When Asher navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Asher' into the First Name field
  And they enter 'Ingram' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '10/30/1997' into the Date of Birth field
  And they enter '481-95-2229' into the Social Security Number field
  And they enter 'Asher207449@gmail.com' into the Email Address field
  And they enter 'vakboiqpkbeusle07709' into the registration Password field
  And they navigate to the Contact Details page
  Then Asher verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered Email Address expecting an Error result
  Given Ramiro is a new customer
  When Ramiro navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Ramiro' into the First Name field
  And they enter 'Bradley' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '12/23/1977' into the Date of Birth field
  And they enter '320-79-5240' into the Social Security Number field
  And they enter 'jsmith@demo.io' into the Email Address field
  And they enter 'PSUOlZjxjOmdWIvS27' into the registration Password field
  And they enter 'PSUOlZjxjOmdWIvS27' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Ramiro verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered SSN expecting an Error result
  Given Herbert is a new customer
  When Herbert navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Herbert' into the First Name field
  And they enter 'Cochran' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/18/1933' into the Date of Birth field
  And they enter '123-45-6789' into the Social Security Number field
  And they enter 'Herbert796649@gmail.com' into the Email Address field
  And they enter 'eYTVJVwBCAbLCqEBznNh1' into the registration Password field
  And they enter 'eYTVJVwBCAbLCqEBznNh1' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Herbert verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty DoB expecting an Error result
  Given Ulysses is a new customer
  When Ulysses navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Ulysses' into the First Name field
  And they enter 'Mendoza' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Ulysses verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid DoB expecting an Error result
  Given Cody is a new customer
  When Cody navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Cody' into the First Name field
  And they enter 'Reese' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '1932-09-19fxs' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Cody verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN less than 9 digits expecting an Error result
  Given Carter is a new customer
  When Carter navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Carter' into the First Name field
  And they enter 'Weiss' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '02/14/1977' into the Date of Birth field
  And they enter '1075' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Carter verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN greater than 9 digits expecting an Error result
  Given Aldo is a new customer
  When Aldo navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Aldo' into the First Name field
  And they enter 'Delaney' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '01/30/1947' into the Date of Birth field
  And they enter '6188898494515' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Aldo verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN with invalid characters expecting an Error result
  Given Gerardo is a new customer
  When Gerardo navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Gerardo' into the First Name field
  And they enter 'Hodge' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '02/04/1994' into the Date of Birth field
  And they enter '313$85$1539' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Gerardo verifies they are presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty Mobile Phone expecting a Successful registration
  Given Cristopher is a new customer
  When Cristopher navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Cristopher' into the First Name field
  And they enter 'Wilkinson' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '06/28/1954' into the Date of Birth field
  And they enter '792-01-4321' into the Social Security Number field
  And they enter 'Cristopher331584@gmail.com' into the Email Address field
  And they enter 'ccJoqELj53423' into the registration Password field
  And they enter 'ccJoqELj53423' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are the Contact Details page
  And they enter 'HC-02' into the registration Address field
  And they enter 'Columbia' into the registration Locality field
  And they enter 'MD' into the registration Region field
  And they enter '21045' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '2461377807' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '2461377807' into the registration Work Phone field
  And they select 'True' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Cristopher verifies they are at the Login page
  And they verify they are presented with a Registration Success Message
  And they verify login Username contains Cristopher331584@gmail.com
  And they enter 'ccJoqELj53423' into the login Password field
  And they submit the login request
  And they verify they are at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty DoB expecting an Error result
  Given Kian is a new customer
  When Kian navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Kian' into the First Name field
  And they enter 'Barron' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Kian verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, invalid DoB expecting an Error result
  Given Nikolas is a new customer
  When Nikolas navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Nikolas' into the First Name field
  And they enter 'Goodman' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '1924-12-06alf' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Nikolas verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, Gender not selected expecting an Error result
  Given Ibrahim is a new customer
  When Ibrahim navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Ibrahim' into the First Name field
  And they enter 'Cash' into the Last Name field
  And they select '' from the Gender radio button
  And they navigate to the Contact Details page
  Then Ibrahim verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, empty Last Name expecting an Error result
  Given Gustavo is a new customer
  When Gustavo navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Gustavo' into the First Name field
  And they enter '' into the Last Name field
  And they navigate to the Contact Details page
  Then Gustavo verifies they are presented with a Error Message indicating the field is required

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
  Given Shakira is a new customer
  When Shakira navigates to the Registration page
  And they select 'Ms.' from the Title radio button
  And they enter 'Shakira' into the First Name field
  And they enter 'Powers' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '01/18/1949' into the Date of Birth field
  And they enter '123-45-6789' into the Social Security Number field
  And they enter 'jsmith@demo.io' into the Email Address field
  And they enter 'rUFhprhutzNshsQIfO11' into the registration Password field
  And they enter 'rUFhprhutzNshsQIfO11' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Shakira verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

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
  Given Claire is a new customer
  When Claire navigates to the Registration page
  And they select 'Mrs.' from the Title radio button
  And they enter 'Claire' into the First Name field
  And they enter 'Mullen' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '08/24/1927' into the Date of Birth field
  And they enter '' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Claire verifies they are presented with a Error Message indicating the field is required

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