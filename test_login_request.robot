*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASE_URL}  https://reqres.in
${email}  eve.holt@reqres.in
${password}  cityslicka
${login_unsuccessful_email}  peter@klaven
${user_login_url}   /api/login
*** Test Cases ***
Test User Login Request
    create session  user_login  ${BASE_URL}
    &{body}=  create dictionary  email=${email}  password=${password}
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  user_login  ${user_login_url}  data=${body}  headers=${header}
    log to console  ${response.content}
    status should be  200  ${response}

Test user Login Request Unsuccessful
    create session  user_login_unsuccessful  ${BASE_URL}
    &{body}=  create dictionary  email=${login_unsuccessful_email}
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  user_login_unsuccessful  ${user_login_url}  data=${body}  headers=${header}
    log to console  ${response.content}
    status should be  400  ${response}
