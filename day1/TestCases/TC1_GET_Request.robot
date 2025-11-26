*** Settings ***
# These are the libraries (tools) used in this test.
# RequestsLibrary: lets us send HTTP requests (like GET, POST, etc.).
# Collections: helps us work with dictionaries (key-value data structures).
Library    RequestsLibrary
Library    Collections


*** Variables ***
# Here we define some variables that will be used in the test.
# ${url}: The main address of the weather API we are testing.
${url}    http://api.weatherapi.com/v1
# ${key}: The personal API key used to access the weather service (like a password for the API).
${key}    0659d8cba83942e780c103506252309
# ${city}: The name of the city we want to get the weather for.
${city}   Helsinki


*** Test Cases ***
# This test case checks if we can successfully get the current weather information for a city.
Get_weatherInfo

    # Step 1: Create a session (like opening a connection) with the weather API using the base URL.
    Create Session    my    ${url}

    # Step 2: Send a GET request to the API endpoint to get current weather information.
    # "/current.json" is the endpoint, and we pass our API key and city name as query parameters.
    ${response}=    Get Request    my    /current.json?key=${key}&q=${city}

    # (Optional) You can uncomment these lines to print information for debugging:
    # Log To Console    ${response.status_code}   # Prints the HTTP status code (e.g., 200 means success)
    # Log To Console    ${response.content}       # Prints the full response body
    # Log To Console    ${response.headers}       # Prints the response headers (metadata)

    # VALIDATIONS — now we check if the response is correct.

    # Step 3: Convert the response status code to a string so we can easily compare it.
    ${status_code}=   Convert To String     ${response.status_code}

    # Step 4: Verify that the response code is 200, which means "OK" (successful request).
    Should Be Equal    ${status_code}    200

    # Step 5: Convert the response body (the actual data) to a string.
    ${body}=   Convert To String     ${response.content}

    # Step 6: Check if the response body contains the city name we requested ("Helsinki").
    # This confirms that the API returned weather data for the correct city.
    Should Contain    ${body}    Helsinki

    # Step 7: Get the value of "Content-Type" from the response headers.
    # This tells us the format of the returned data (it should be JSON).
    ${contentTypeValue}=    Get From Dictionary     ${response.headers}    Content-Type

    # Step 8: Check if the Content-Type is exactly "application/json".
    # This ensures the data is in JSON format, which is expected.
    Should Be Equal    ${contentTypeValue}    application/json

    # Step 9: Print a friendly message with the content type in the console.
    # This helps confirm what kind of data the server sent back.
    Log To Console    "Hello this is the value" ${contentTypeValue}
