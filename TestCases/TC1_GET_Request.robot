*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${url}    http://api.weatherapi.com/v1
${key}    0659d8cba83942e780c103506252309
${city}   Helsinki

*** Test Cases ***
Get_weatherInfo
    Create Session    my    ${url}
    ${response}=    Get Request    my    /current.json?key=${key}&q=${city}
    #Log To Console    ${response.status_code}
    #Log To Console    ${response.content}
    #Log To Console    ${response.headers}
    #VALIDATIONS
    ${status_code}=   Convert To String     ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${body}=   Convert To String     ${response.content}
    Should Contain    ${body}    Helsinki
    ${contentTypeValue}=    Get From Dictionary     ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    application/json
    Log To Console    "Hello this is the value" ${contentTypeValue}
    
