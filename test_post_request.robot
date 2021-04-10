*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASE_URL}  https://reqres.in
${name}  islam
${job}  CE
${post_url}  /api/users



*** Test Cases ***
Test Post user Request
    create session  create_user  ${BASE_URL}
    &{body}=  create dictionary  name=${name}  job=${job}
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  create_user  ${post_url}  data=${body}  headers=${header}
    log to console  ${response.content}
    status should be  201  ${response}

