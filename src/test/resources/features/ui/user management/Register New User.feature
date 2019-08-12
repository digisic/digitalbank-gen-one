@ui @user @security @register
Feature: Register New User (UI)
  As a new customer
  I want to register as a new user
  so I can login to Digital Bank to manage my accounts.


@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Email Address expecting an Error result
  Given Jerry is a new customer
  When Jerry navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Jerry' into the First Name field
  And they enter 'Pratt' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '01/21/1979' into the Date of Birth field
  And they enter '104-07-3084' into the Social Security Number field
  And they enter '' into the Email Address field
  And they navigate to the Contact Details page
  Then Jerry verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address with no at sign expecting an Error result
  Given German is a new customer
  When German navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'German' into the First Name field
  And they enter 'Everett' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/15/1958' into the Date of Birth field
  And they enter '606-13-5670' into the Social Security Number field
  And they enter 'German481491gmail.com' into the Email Address field
  And they navigate to the Contact Details page
  Then German verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Email Address without domain expecting an Error result
  Given Milo is a new customer
  When Milo navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Milo' into the First Name field
  And they enter 'Alford' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '03/23/1930' into the Date of Birth field
  And they enter '721-55-7786' into the Social Security Number field
  And they enter 'Milo980999@' into the Email Address field
  And they navigate to the Contact Details page
  Then Milo verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Confirm Password expecting an Error result
  Given Cordell is a new customer
  When Cordell navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Cordell' into the First Name field
  And they enter 'David' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '03/09/1991' into the Date of Birth field
  And they enter '289-79-1910' into the Social Security Number field
  And they enter 'Cordell28641@gmail.com' into the Email Address field
  And they enter 'KIPITEEeCpLlKMyfiTlq49611' into the registration Password field
  And they enter '' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Cordell verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, non-matching Confirm Password expecting an Error result
  Given Solomon is a new customer
  When Solomon navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Solomon' into the First Name field
  And they enter 'George' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/12/1986' into the Date of Birth field
  And they enter '169-53-7136' into the Social Security Number field
  And they enter 'Solomon78267@gmail.com' into the Email Address field
  And they enter 'OHJnzEwlBKI5573' into the registration Password field
  And they enter '' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Solomon verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Region expecting an Error result
  Given Seamus is a new customer
  When Seamus navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Seamus' into the First Name field
  And they enter 'Lott' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '11/05/1982' into the Date of Birth field
  And they enter '898-15-0805' into the Social Security Number field
  And they enter 'Seamus798669@gmail.com' into the Email Address field
  And they enter 'kVbNwatyKwyEy581' into the registration Password field
  And they enter 'kVbNwatyKwyEy581' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HC-03 BOX 36002' into the registration Address field
  And they enter 'Indianapolis' into the registration Locality field
  And they enter '' into the registration Region field
  And they submit the Registration request
  Then Seamus verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Postal Code expecting an Error result
  Given Quentin is a new customer
  When Quentin navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Quentin' into the First Name field
  And they enter 'Lott' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/24/1998' into the Date of Birth field
  And they enter '451-11-6221' into the Social Security Number field
  And they enter 'Quentin5514@gmail.com' into the Email Address field
  And they enter 'PjJmDsINKMrr2223' into the registration Password field
  And they enter 'PjJmDsINKMrr2223' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'BARRIO PUGNADO' into the registration Address field
  And they enter 'New port richey' into the registration Locality field
  And they enter 'FL' into the registration Region field
  And they enter '' into the registration Postal Code field
  And they submit the Registration request
  Then Quentin verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Country expecting an Error result
  Given Miguel is a new customer
  When Miguel navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Miguel' into the First Name field
  And they enter 'Johns' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '05/04/1988' into the Date of Birth field
  And they enter '912-16-8657' into the Social Security Number field
  And they enter 'Miguel4006@gmail.com' into the Email Address field
  And they enter 'FidkmzPBSbWc81080' into the registration Password field
  And they enter 'FidkmzPBSbWc81080' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HC 05 BOX 57596 BO LEGISAMO' into the registration Address field
  And they enter 'Owensburg' into the registration Locality field
  And they enter 'IN' into the registration Region field
  And they enter '47453' into the registration Postal Code field
  And they enter '' into the registration Country field
  And they submit the Registration request
  Then Miguel verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Home Phone expecting an Error result
  Given Johnny is a new customer
  When Johnny navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Johnny' into the First Name field
  And they enter 'Hebert' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/02/1985' into the Date of Birth field
  And they enter '801-94-4962' into the Social Security Number field
  And they enter 'Johnny9189@gmail.com' into the Email Address field
  And they enter 'JJOPgSjapPsBc87' into the registration Password field
  And they enter 'JJOPgSjapPsBc87' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HC-02 BOX 9843' into the registration Address field
  And they enter 'Oxford' into the registration Locality field
  And they enter 'MA' into the registration Region field
  And they enter '15400' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '' into the registration Home Phone field
  And they submit the Registration request
  Then Johnny verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Home Phone expecting an Error result
  Given Clifford is a new customer
  When Clifford navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Clifford' into the First Name field
  And they enter 'Bentley' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '05/31/1937' into the Date of Birth field
  And they enter '016-69-4547' into the Social Security Number field
  And they enter 'Clifford748498@gmail.com' into the Email Address field
  And they enter 'ZLVBAaEqPHHQeAdoK222' into the registration Password field
  And they enter 'ZLVBAaEqPHHQeAdoK222' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'URB VISTA DEL VALLE 74' into the registration Address field
  And they enter 'Francitas' into the registration Locality field
  And they enter 'TX' into the registration Region field
  And they enter '77961' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '98042' into the registration Home Phone field
  And they submit the Registration request
  Then Clifford verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Agree False expecting an Error result
  Given Dallas is a new customer
  When Dallas navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Dallas' into the First Name field
  And they enter 'Park' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/25/1993' into the Date of Birth field
  And they enter '340-16-0259' into the Social Security Number field
  And they enter 'Dallas015253@gmail.com' into the Email Address field
  And they enter 'FdvIvQrMoiXMs449' into the registration Password field
  And they enter 'FdvIvQrMoiXMs449' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HC02 BOX 12315 BO CAPA CARR 11' into the registration Address field
  And they enter 'Mira' into the registration Locality field
  And they enter 'LA' into the registration Region field
  And they enter '71059' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '2524284861' into the registration Home Phone field
  And they enter '2524284861' into the registration Mobile Phone field
  And they enter '2524284861' into the registration Work Phone field
  And they select 'False' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Dallas verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Work Phone, Agree False expecting an Error result
  Given Greyson is a new customer
  When Greyson navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Greyson' into the First Name field
  And they enter 'Summers' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '12/24/1970' into the Date of Birth field
  And they enter '663-19-0415' into the Social Security Number field
  And they enter 'Greyson427196@gmail.com' into the Email Address field
  And they enter 'eEcsnUcdUGF8' into the registration Password field
  And they enter 'eEcsnUcdUGF8' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'CALLE 49 AA' into the registration Address field
  And they enter 'Harrisburg' into the registration Locality field
  And they enter 'PA' into the registration Region field
  And they enter '17110' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '5131342544' into the registration Home Phone field
  And they enter '5131342544' into the registration Mobile Phone field
  And they enter '' into the registration Work Phone field
  And they select 'False' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Greyson verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid Work Phone expecting an Error result
  Given Keshawn is a new customer
  When Keshawn navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Keshawn' into the First Name field
  And they enter 'Boyle' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/29/1939' into the Date of Birth field
  And they enter '132-87-8640' into the Social Security Number field
  And they enter 'Keshawn243520@gmail.com' into the Email Address field
  And they enter 'kQNDWjkF1328' into the registration Password field
  And they enter 'kQNDWjkF1328' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'HC04 BOX 13664' into the registration Address field
  And they enter 'Jackson' into the registration Locality field
  And they enter 'MS' into the registration Region field
  And they enter '39235' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '3034931955' into the registration Home Phone field
  And they enter '3034931955' into the registration Mobile Phone field
  And they enter '907621710' into the registration Work Phone field
  And they submit the Registration request
  Then Keshawn verifies they are presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, empty Work Phone expecting a Successful registration
  Given Luis is a new customer
  When Luis navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Luis' into the First Name field
  And they enter 'Haley' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '08/16/1946' into the Date of Birth field
  And they enter '634-27-1549' into the Social Security Number field
  And they enter 'Luis1738@gmail.com' into the Email Address field
  And they enter 'CUgjFXXulMhhWFjdChk3846' into the registration Password field
  And they enter 'CUgjFXXulMhhWFjdChk3846' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'RR 02 BOX 8552' into the registration Address field
  And they enter 'Canton' into the registration Locality field
  And they enter 'MI' into the registration Region field
  And they enter '48187' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '6612873714' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '' into the registration Work Phone field
  And they select 'True' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Luis verifies they are at the Login page
  And they verify they are presented with a Registration Success Message
  And they verify login Username contains Luis1738@gmail.com
  And they enter 'CUgjFXXulMhhWFjdChk3846' into the login Password field
  And they submit the login request
  And they verify they are at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Mobile Phone, invalid Work Phone expecting an Error result
  Given Issac is a new customer
  When Issac navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Issac' into the First Name field
  And they enter 'Hunter' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '12/16/1996' into the Date of Birth field
  And they enter '851-16-5883' into the Social Security Number field
  And they enter 'Issac8675@gmail.com' into the Email Address field
  And they enter 'TSZMiIFFwSQj62137' into the registration Password field
  And they enter 'TSZMiIFFwSQj62137' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'ALGARROBO 38 BO SUSUA' into the registration Address field
  And they enter 'Lattimer mines' into the registration Locality field
  And they enter 'PA' into the registration Region field
  And they enter '18234' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '8455002037' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '75125238' into the registration Work Phone field
  And they submit the Registration request
  Then Issac verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Invalid Mobile Phone expecting an Error result
  Given Jamel is a new customer
  When Jamel navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Jamel' into the First Name field
  And they enter 'Newman' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/27/1954' into the Date of Birth field
  And they enter '808-20-8045' into the Social Security Number field
  And they enter 'Jamel238392@gmail.com' into the Email Address field
  And they enter 'rhFQZKXQuYhp1357' into the registration Password field
  And they enter 'rhFQZKXQuYhp1357' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter '285' into the registration Address field
  And they enter 'Gadsden' into the registration Locality field
  And they enter 'AL' into the registration Region field
  And they enter '35903' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '5594179013' into the registration Home Phone field
  And they enter '44828044' into the registration Mobile Phone field
  And they submit the Registration request
  Then Jamel verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Locality expecting an Error result
  Given Shaun is a new customer
  When Shaun navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Shaun' into the First Name field
  And they enter 'Russell' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/08/1971' into the Date of Birth field
  And they enter '443-99-6799' into the Social Security Number field
  And they enter 'Shaun6987@gmail.com' into the Email Address field
  And they enter 'stElODjREIgewydOdAQe12486' into the registration Password field
  And they enter 'stElODjREIgewydOdAQe12486' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'PMB59 POB 7997' into the registration Address field
  And they enter '' into the registration Locality field
  And they submit the Registration request
  Then Shaun verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Address expecting an Error result
  Given Antwan is a new customer
  When Antwan navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Antwan' into the First Name field
  And they enter 'Phillips' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/11/1950' into the Date of Birth field
  And they enter '596-56-4020' into the Social Security Number field
  And they enter 'Antwan42748@gmail.com' into the Email Address field
  And they enter 'WzxjnajPJNxFnBFolGSb3300' into the registration Password field
  And they enter 'WzxjnajPJNxFnBFolGSb3300' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter '' into the registration Address field
  And they submit the Registration request
  Then Antwan verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty Password expecting an Error result
  Given Gaige is a new customer
  When Gaige navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Gaige' into the First Name field
  And they enter 'Wall' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '02/16/1989' into the Date of Birth field
  And they enter '940-36-4082' into the Social Security Number field
  And they enter 'Gaige36605@gmail.com' into the Email Address field
  And they enter '' into the registration Password field
  And they navigate to the Contact Details page
  Then Gaige verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password less than 8 characters expecting an Error result
  Given Liam is a new customer
  When Liam navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Liam' into the First Name field
  And they enter 'Davis' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/18/1998' into the Date of Birth field
  And they enter '763-05-7014' into the Social Security Number field
  And they enter 'Liam49601@gmail.com' into the Email Address field
  And they enter 'Asvir2021' into the registration Password field
  And they navigate to the Contact Details page
  Then Liam verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no lowercase expecting an Error result
  Given Colt is a new customer
  When Colt navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Colt' into the First Name field
  And they enter 'Greene' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '04/09/1950' into the Date of Birth field
  And they enter '431-38-5578' into the Social Security Number field
  And they enter 'Colt24958@gmail.com' into the Email Address field
  And they enter 'KFTYEIRZEBCKFIXHE868' into the registration Password field
  And they navigate to the Contact Details page
  Then Colt verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no numeric expecting an Error result
  Given Ryder is a new customer
  When Ryder navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Ryder' into the First Name field
  And they enter 'Valdez' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '06/28/1931' into the Date of Birth field
  And they enter '633-23-4228' into the Social Security Number field
  And they enter 'Ryder9234@gmail.com' into the Email Address field
  And they enter 'BGcLynMnON' into the registration Password field
  And they navigate to the Contact Details page
  Then Ryder verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, Password with no upper expecting an Error result
  Given Remington is a new customer
  When Remington navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Remington' into the First Name field
  And they enter 'William' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '11/14/1953' into the Date of Birth field
  And they enter '074-12-2690' into the Social Security Number field
  And they enter 'Remington350622@gmail.com' into the Email Address field
  And they enter 'qxyeclaxdsgempgxujsb67' into the registration Password field
  And they navigate to the Contact Details page
  Then Remington verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative @registered
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered Email Address expecting an Error result
  Given Draven is a new customer
  When Draven navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Draven' into the First Name field
  And they enter 'Mendez' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '07/01/1933' into the Date of Birth field
  And they enter '688-14-8188' into the Social Security Number field
  And they enter 'existing' into the Email Address field
  And they enter 'HtpGxptLGev247' into the registration Password field
  And they enter 'HtpGxptLGev247' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Draven verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, registered SSN expecting an Error result
  Given Mike is a new customer
  When Mike navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Mike' into the First Name field
  And they enter 'Booker' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '11/06/1955' into the Date of Birth field
  And they enter 'existing' into the Social Security Number field
  And they enter 'Mike974618@gmail.com' into the Email Address field
  And they enter 'nEthUSXP1' into the registration Password field
  And they enter 'nEthUSXP1' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Mike verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, empty DoB expecting an Error result
  Given Kamron is a new customer
  When Kamron navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Kamron' into the First Name field
  And they enter 'Mooney' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Kamron verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'M' Gender, invalid DoB expecting an Error result
  Given Brent is a new customer
  When Brent navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Brent' into the First Name field
  And they enter 'Gomez' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '2000-01-30kza' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Brent verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN less than 9 digits expecting an Error result
  Given Coleman is a new customer
  When Coleman navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Coleman' into the First Name field
  And they enter 'Pearson' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '05/27/1953' into the Date of Birth field
  And they enter '10807856' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Coleman verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN greater than 9 digits expecting an Error result
  Given Francis is a new customer
  When Francis navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Francis' into the First Name field
  And they enter 'Pope' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '12/05/1963' into the Date of Birth field
  And they enter '000260334213546' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Francis verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, SSN with invalid characters expecting an Error result
  Given Troy is a new customer
  When Troy navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Troy' into the First Name field
  And they enter 'Norris' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '05/27/1986' into the Date of Birth field
  And they enter '362$92$8605' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Troy verifies they are presented with a Error Message indicating input value does not meet required format for the field

@positive
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty Mobile Phone expecting a Successful registration
  Given Sincere is a new customer
  When Sincere navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Sincere' into the First Name field
  And they enter 'Alford' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '07/13/1965' into the Date of Birth field
  And they enter '854-79-4214' into the Social Security Number field
  And they enter 'Sincere1740@gmail.com' into the Email Address field
  And they enter 'inFPOqEJWHzD5320' into the registration Password field
  And they enter 'inFPOqEJWHzD5320' into the registration Confirm Password field
  And they navigate to the Contact Details page
  And they verify they are at the Contact Details page
  And they enter 'ALT DE MAYAGUEZ' into the registration Address field
  And they enter 'Houston' into the registration Locality field
  And they enter 'TX' into the registration Region field
  And they enter '77228' into the registration Postal Code field
  And they enter 'United States' into the registration Country field
  And they enter '7247321179' into the registration Home Phone field
  And they enter '' into the registration Mobile Phone field
  And they enter '7247321179' into the registration Work Phone field
  And they select 'True' from the Agree to Terms and Policy checkbox
  And they submit the Registration request
  Then Sincere verifies they are at the Login page
  And they verify they are presented with a Registration Success Message
  And they verify login Username contains Sincere1740@gmail.com
  And they enter 'inFPOqEJWHzD5320' into the login Password field
  And they submit the login request
  And they verify they are at the Home page

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, empty DoB expecting an Error result
  Given Jeremy is a new customer
  When Jeremy navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Jeremy' into the First Name field
  And they enter 'Herring' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Jeremy verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, 'F' Gender, invalid DoB expecting an Error result
  Given Darin is a new customer
  When Darin navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Darin' into the First Name field
  And they enter 'Steele' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '1970-04-06j' into the Date of Birth field
  And they navigate to the Contact Details page
  Then Darin verifies they are presented with a Error Message indicating input value does not meet required format for the field

@negative
Scenario: Register New User with 'Mr.' Title, Gender not selected expecting an Error result
  Given Graham is a new customer
  When Graham navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Graham' into the First Name field
  And they enter 'Francis' into the Last Name field
  And they select '' from the Gender radio button
  And they navigate to the Contact Details page
  Then Graham verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, empty Last Name expecting an Error result
  Given Adolfo is a new customer
  When Adolfo navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter 'Adolfo' into the First Name field
  And they enter '' into the Last Name field
  And they navigate to the Contact Details page
  Then Adolfo verifies they are presented with a Error Message indicating the field is required

@negative
Scenario: Register New User with 'Mr.' Title, empty First Name expecting an Error result
  Given Kate is a new customer
  When Kate navigates to the Registration page
  And they select 'Mr.' from the Title radio button
  And they enter '' into the First Name field
  And they navigate to the Contact Details page
  Then Kate verifies they are presented with a Error Message indicating the field is required

@negative @registered
Scenario: Register New User with 'Ms.' Title, 'M' Gender, registered SSN, registered Email Address expecting an Error result
  Given Karly is a new customer
  When Karly navigates to the Registration page
  And they select 'Ms.' from the Title radio button
  And they enter 'Karly' into the First Name field
  And they enter 'Giles' into the Last Name field
  And they select 'M' from the Gender radio button
  And they enter '09/15/1924' into the Date of Birth field
  And they enter 'existing' into the Social Security Number field
  And they enter 'existing' into the Email Address field
  And they enter 'MOQZxbhN6156' into the registration Password field
  And they enter 'MOQZxbhN6156' into the registration Confirm Password field
  And they navigate to the Contact Details page
  Then Karly verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account

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
  Given Esmeralda is a new customer
  When Esmeralda navigates to the Registration page
  And they select 'Mrs.' from the Title radio button
  And they enter 'Esmeralda' into the First Name field
  And they enter 'Petersen' into the Last Name field
  And they select 'F' from the Gender radio button
  And they enter '04/19/1960' into the Date of Birth field
  And they enter '' into the Social Security Number field
  And they navigate to the Contact Details page
  Then Esmeralda verifies they are presented with a Error Message indicating the field is required

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