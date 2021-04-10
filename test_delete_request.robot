*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASE_URL}  https://reqres.in
${user_id}  2
${delete_url}  /api/users/${user_id}

*** Test Cases ***
Test Delete user Request
    create session  get_single_user  ${BASE_URL}
    ${response}=  delete request  get_single_user  ${delete_url}
    status should be  204  ${response}