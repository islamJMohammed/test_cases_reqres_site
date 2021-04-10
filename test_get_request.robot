*** Settings ***
Library  RequestsLibrary



*** Variables ***
${BASE_URL}  https://reqres.in
${user_id}  2
${user_id_not_found}  23
${list_users_url}  /api/users?page=2
${single_user_url}  /api/users/${user_id}
${not_found_user_url}  /api/users/${user_id_not_found}

*** Test Cases ***
Test Get List users Request
    create session  get_list_users  ${BASE_URL}
    ${response}=  get request  get_list_users  ${list_users_url}
    status should be  200  ${response}


Test Get Single user Request
    create session  get_single_user  ${BASE_URL}
    ${response}=  get request  get_single_user  ${single_user_url}
    status should be  200  ${response}


Test Single User Not Found
    create session  get_single_user  ${BASE_URL}
    ${response}=  get request  get_single_user  ${not_found_user_url}
    status should be  404  ${response}
