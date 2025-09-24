*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${base_url}=    https://jsonplaceholder.typicode.com/posts


*** Test Cases ***
User_registration
    Create Session    my    ${base_url}
    ${body}=    Create Dictionary     email=eve.holt@reqres.in    password=pistol    name=yusuf
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=  Post Request   my     /posts       data=${body}     headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
