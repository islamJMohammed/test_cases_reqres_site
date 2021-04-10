*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASE_URL}  https://reqres.in
${delayed_response_url}  /api/users?delay=3
*** Test Cases ***
Test Delayed Response Request
    create session  delayed_response  ${BASE_URL}
    ${response}=  get request  delayed_response  ${delayed_response_url}
    status should be  200  ${response}
