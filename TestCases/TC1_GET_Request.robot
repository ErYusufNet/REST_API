*** Settings ***
Library    RequestsLibrary

*** Variables ***
${url}    http://api.weatherapi.com/v1
${key}    0659d8cba83942e780c103506252309
${city}   Helsinki

*** Test Cases ***
Get_weatherInfo
    Create Session    my    ${url}
    ${response}=    Get Request    my    /current.json?key=${key}&q=${city}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

