*** Settings ***
Library  RequestsLibrary
*** Variables ***
${BaseURL}  http://10.100.109.153/base-client-api/
*** Test Cases ***
TC1_Get_Request
    create session  Get_Student_Details  ${BaseURL}
    ${Response}=  get request  Get_Student_Details  customer/400401/contact/email
    log to console  ${Response.content}
    ${body}=  convert to string  ${Response.content}
    should be Equal  ${body}  {"email":"Amira.Azouz@wevioo.com","phone":"+33.660920673"}

