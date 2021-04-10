*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASE_URL}  https://reqres.in
${email}  eve.holt@reqres.in
${password}  pistol
${user_registration_url}  /api/register
${register_unsuccessful_email}  sydney@fife


*** Test Cases ***
Test Register user Request
    create session  user_registration  ${BASE_URL}
    &{body}=  create dictionary  email=${email}  password=${password}
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  user_registration  ${user_registration_url}  data=${body}  headers=${header}
    log to console  ${response.content}
    status should be  200  ${response}

Test Register user Request Unsuccessful
    create session  user_registration_unsuccessful  ${BASE_URL}
    &{body}=  create dictionary  email=${register_unsuccessful_email}
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  user_registration_unsuccessful  ${user_registration_url}  data=${body}  headers=${header}
    log to console  ${response.content}
    status should be  400  ${response}
