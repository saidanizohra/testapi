*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  os
*** Variables ***
${BaseURL}  http://10.100.109.153/base-client-api/
${CustomerKey}  400401
${body}  {"detailedCustomer":{"login":"hajer@77k55hhkk","password":"nordnet@123","blocageMail":"false","orangeCode":"orange123","createdBy":"admin","activationKey":"act123","isAccountValidated":"true","customerType":"SALER","isMarguerite":"true","orderRef":"1","rateBand":"A","hasRejection":"false","saariCode":"A","segmentTVA":"01","sendDocumentBy":"POST","versionMarguerite":"10","siret":"33","codeApe":"codéà éà","factureEuro":"true","birthDate":"2015-07-07T02:12:12+01:00","godFatherKey":"01012346006056","partner":"testOxiaéà éà#6933","defaultHandle":{"complementAddress":"Rades","localityAndPostBox":"","voie":"rue rabeg12","numVoie":"16 Ter","city":"paris","civility":"MME","company":"WEVIéà","country":"FR","email":"email_152@email.com","firstName":"FéstNàe","name":"Name2369","phone":"+33.645454","profileType":"PAR","type":"DEFAULT","zipCode":"52345","customLabel":"CustoLabji","modifiable":"true","fax":"+33.654987654","gsm":"+33.789456123","intraTVA":"12","siren":"33","birthDate":"2015-07-07T12:12:12+01:00","siret":"33","codeApe":"codApeeee","profession":"ingénieur","indicateurConservationNum":"S"},"paymentPeriod":"15"},"userInfos":{"ip":"10.2.2.2.2","userName":"test","httpUserAgent":"test"}}

*** Test Cases ***
TC1_Post_Request
    create session  AddData  ${BaseURL}
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  AddData  customers  data=${body}  headers=${header}
    log to console  ${response.status_code}
    #${bodyy}=  convert to string  ${response.content}
    log to console  ${response.content}
    ${res_body}=  convert to string  ${response.content}
    should contain  ${res_body}  Too many customers with login hajer@77k55hhkk have been found.

TC2_Get_Request
    create session  Get_CustomerByEmail  ${BaseURL}
    ${Response}=  get request  Get_CustomerByEmail  customer/${CustomerKey}/contact/email
    log to console  ${Response.content}
    ${body}=  convert to string  ${Response.content}
    should be Equal  ${body}  {"email":"Amira.Azouz@wevioo.com","phone":"+33.660920673"}


*** Keywords ***

