*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
*** Variables ***
${BaseURL}  http://10.100.109.153/base-client-api/
${CustomerRequest}  {"detailedCustomer":{"login":"amira@77k55hhkk","password":"nordnet@123","blocageMail":"false","orangeCode":"orange123","createdBy":"admin","activationKey":"act123","isAccountValidated":"true","customerType":"SALER","isMarguerite":"true","orderRef":"1","rateBand":"A","hasRejection":"false","saariCode":"A","segmentTVA":"01","sendDocumentBy":"POST","versionMarguerite":"10","siret":"33","codeApe":"codéà éà","factureEuro":"true","birthDate":"2015-07-07T02:12:12+01:00","godFatherKey":"01012346006056","partner":"testOxiaéà éà#6933","defaultHandle":{"complementAddress":"Rades","localityAndPostBox":"","voie":"rue rabeg12","numVoie":"16 Ter","city":"paris","civility":"MME","company":"WEVIéà","country":"FR","email":"email_152@email.com","firstName":"FéstNàe","name":"Name2369","phone":"+33.645454","profileType":"PAR","type":"DEFAULT","zipCode":"52345","customLabel":"CustoLabji","modifiable":"true","fax":"+33.654987654","gsm":"+33.789456123","intraTVA":"12","siren":"33","birthDate":"2015-07-07T12:12:12+01:00","siret":"33","codeApe":"codApeeee","profession":"ingénieur","indicateurConservationNum":"S"},"paymentPeriod":"15"},"userInfos":{"ip":"10.2.2.2.2","userName":"test","httpUserAgent":"test"}}

*** Test Cases ***
TC3_CreateCustomer
    create session  AddData  ${BaseURL}
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  AddData  customers  data=${CustomerRequest}  headers=${header}
    ${statuscode}=  convert to string  ${response.status_code}
    should be Equal  ${statuscode}  201
    ${json_object}=  to json  ${response.content}
    #log to console  ${json_object}
    ${key}=  get value from json  ${json_object}  $.customerKey
    log to console  ${key[0]}

#check that the customer is created
    create session  Get_CustomerByKey  ${BaseURL}
    ${Response}=  get request  Get_CustomerByKey  customers/${key[0]}
    ${json_request}=  to json  ${Response.content}
    ${json_CustomerRequest}=  to json  ${CustomerRequest}
    ${loginCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.login
    ${loginC}=  get value from json  ${json_request}  $.login
    should be Equal  ${loginC}  ${loginCR}

    ${orangeCodeCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.orangeCode
    ${orangeCodeC}=  get value from json  ${json_request}  $.orangeCode
    should be Equal  ${orangeCodeC}  ${orangeCodeCR}
    ${customerTypeCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.customerType
    ${customerTypeC}=  get value from json  ${json_request}  $.customerType
    should be Equal  ${customerTypeC}  ${customerTypeCR}
    ${orderRefCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.orderRef
    ${orderRefC}=  get value from json  ${json_request}  $.orderRef
    should be Equal  ${orderRefC}  ${orderRefCR}
    ${rateBandCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.rateBand
    ${rateBandC}=  get value from json  ${json_request}  $.rateBand
    should be Equal  ${rateBandC}  ${rateBandCR}
    #${hasRejectionCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.hasRejection
    #log to console  ${hasRejectionCR}
    #${hasRejectionC}=  get value from json  ${json_request}  $.hasRejection
    #log to console  ${hasRejectionC}
    #should be Equal  ${hasRejectionC}  ${hasRejectionCR}
    ${saariCodeCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.saariCode
    ${saariCodeC}=  get value from json  ${json_request}  $.saariCode
    should be Equal  ${saariCodeC}  ${saariCodeCR}
    ${segmentTVACR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.segmentTVA
    ${segmentTVAC}=  get value from json  ${json_request}  $.segmentTVA
    should be Equal  ${segmentTVAC}  ${segmentTVACR}
    ${sendDocumentByCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.sendDocumentBy
    ${sendDocumentByC}=  get value from json  ${json_request}  $.sendDocumentBy
    should be Equal  ${sendDocumentByC}  ${sendDocumentByCR}
    ${versionMargueriteCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.versionMarguerite
    ${versionMargueriteC}=  get value from json  ${json_request}  $.versionMarguerite
    should be Equal  ${versionMargueriteC}  ${versionMargueriteCR}
    ${siretCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.siret
    ${siretC}=  get value from json  ${json_request}  $.siret
    ${siretCR}=  convert to string  ${siretCR}
    ${siretC}=  convert to string  ${siretC}
    should be Equal  ${siretC[0]}  ${siretCR[0]}
    ${codeApeCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.codeApe
    ${codeApeC}=  get value from json  ${json_request}  $.codeApe
    should be Equal  ${codeApeC}  ${codeApeCR}
    #${factureEuroCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.factureEuro
    #${factureEuroC}=  get value from json  ${json_request}  $.factureEuro
    #should be Equal  ${factureEuroC}  ${factureEuroCR}
    ${birthDateCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.birthDate
    ${birthDateC}=  get value from json  ${json_request}  $.birthDate
    should contain  ${birthDateCR[0]}  ${birthDateC[0]}
    ${complementAddressCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.complementAddress
    ${complementAddressC}=  get value from json  ${json_request}  $.defaultHandle.complementAddress
    should be Equal  ${complementAddressCR}  ${complementAddressC}
    ${voieCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.voie
    ${voieC}=  get value from json  ${json_request}  $.defaultHandle.voie
    should be Equal  ${voieCR}  ${voieC}
    ${numVoieCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.numVoie
    ${numVoieC}=  get value from json  ${json_request}  $.defaultHandle.numVoie
    should be Equal  ${numVoieCR}  ${numVoieC}
    ${cityCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.city
    ${cityC}=  get value from json  ${json_request}  $.defaultHandle.city
    should be Equal  ${cityCR}  ${cityC}
    ${civilityCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.civility
    ${civilityC}=  get value from json  ${json_request}  $.defaultHandle.civility
    should be Equal  ${civilityCR}  ${civilityC}
    ${companyCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.company
    ${companyC}=  get value from json  ${json_request}  $.defaultHandle.company
    should be Equal  ${companyCR}  ${companyC}
    ${countryCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.country
    ${countryC}=  get value from json  ${json_request}  $.defaultHandle.country
    should be Equal  ${countryCR}  ${countryC}
    ${emailCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.email
    ${emailC}=  get value from json  ${json_request}  $.defaultHandle.email
    should be Equal  ${emailCR}  ${emailC}
    #${firstNameCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.firstName
    #${firstNameC}=  get value from json  ${json_request}  $.defaultHandle.firstName
    #should be Equal  ${firstNameCR}  ${firstNameC}
    #${nameCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.name
    #${nameC}=  get value from json  ${json_request}  $.defaultHandle.name
    #should be Equal  ${nameCR}  ${nameC}
    ${phoneCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.phone
    ${phoneC}=  get value from json  ${json_request}  $.defaultHandle.phone
    should be Equal  ${phoneCR}  ${phoneC}
    ${profileTypeCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.profileType
    ${profileTypeC}=  get value from json  ${json_request}  $.defaultHandle.profileType
    should be Equal  ${profileTypeCR}  ${profileTypeC}
    ${typeCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.type
    ${typeC}=  get value from json  ${json_request}  $.defaultHandle.type
    should be Equal  ${typeCR}  ${typeC}
    ${zipCodeCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.zipCode
    ${zipCodeC}=  get value from json  ${json_request}  $.defaultHandle.zipCode
    should be Equal  ${zipCodeCR}  ${zipCodeC}
    ${customLabelCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.customLabel
    ${customLabelC}=  get value from json  ${json_request}  $.defaultHandle.customLabel
    should be Equal  ${customLabelCR}  ${customLabelC}
    #${modifiableCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.modifiable
    #${modifiableC}=  get value from json  ${json_request}  $.defaultHandle.modifiable
    #should be Equal  ${modifiableCR}  ${modifiableC}
    ${faxCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.fax
    ${faxC}=  get value from json  ${json_request}  $.defaultHandle.fax
    should be Equal  ${faxCR}  ${faxC}
    ${gsmCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.gsm
    ${gsmC}=  get value from json  ${json_request}  $.defaultHandle.gsm
    should be Equal  ${gsmCR}  ${gsmC}
    ${intraTVACR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.intraTVA
    ${intraTVAC}=  get value from json  ${json_request}  $.defaultHandle.intraTVA
    should be Equal  ${intraTVACR}  ${intraTVAC}
    ${sirenCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.siren
    ${sirenC}=  get value from json  ${json_request}  $.defaultHandle.siren
    ${sirenCR}=  convert to string  ${sirenCR}
    ${sirenC}=  convert to string  ${sirenC}
    should be Equal  ${sirenC[0]}  ${sirenCR[0]}
    ${siretCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.siret
    ${siretC}=  get value from json  ${json_request}  $.defaultHandle.siret
    ${siretCR}=  convert to string  ${siretCR}
    ${siretC}=  convert to string  ${siretC}
    should be Equal  ${siretC[0]}  ${siretCR[0]}
    ${birthDateCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.birthDate
    ${birthDateC}=  get value from json  ${json_request}  $.defaultHandle.birthDate
    should contain  ${birthDateCR[0]}  ${birthDateC[0]}
    ${codeApeCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.codeApe
    ${codeApeC}=  get value from json  ${json_request}  $.defaultHandle.codeApe
    should be Equal  ${codeApeCR}  ${codeApeC}
    ${professionCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.profession
    ${professionC}=  get value from json  ${json_request}  $.defaultHandle.profession
    should be Equal  ${professionCR}  ${professionC}
    ${indicateurConservationNumCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.defaultHandle.indicateurConservationNum
    ${indicateurConservationNumC}=  get value from json  ${json_request}  $.defaultHandle.indicateurConservationNum
    should be Equal  ${indicateurConservationNumCR}  ${indicateurConservationNumC}
    ${paymentPeriodCR}=  get value from json  ${json_CustomerRequest}  $.detailedCustomer.paymentPeriod
    ${paymentPeriodC}=  get value from json  ${json_request}  $.paymentPeriod
    ${paymentPeriodCR}=  convert to string  ${paymentPeriodCR}
    ${paymentPeriodC}=  convert to string  ${paymentPeriodC}
    should be Equal  ${paymentPeriodCR[0]}  ${paymentPeriodC[0]}