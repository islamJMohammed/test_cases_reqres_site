*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASE_URL}  https://reqres.in
${user_id}  2
${name}  Razan
${job}  CE
${put_url}  /api/users/${user_id}



*** Test Cases ***
Test Update user Info Request
    create session  update_user  ${BASE_URL}
    &{body}=  create dictionary  name=${name}  job=${job}
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  put request  update_user  ${put_url}  data=${body}  headers=${header}
    log to console  ${response.content}
    status should be  200  ${response}

