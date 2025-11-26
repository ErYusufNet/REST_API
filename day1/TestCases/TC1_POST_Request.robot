*** Settings ***
# These are the libraries (tools) we use in this test.
# RequestsLibrary helps us send HTTP requests (like GET, POST, etc.).
# Collections helps us work with lists and dictionaries (key-value data).
Library    RequestsLibrary
Library    Collections


*** Variables ***
# This is the base URL (the main address) of the API we are testing.
# All our requests will be sent to this website.
${base_url}=    https://jsonplaceholder.typicode.com/posts



*** Test Cases ***
# This test case simulates a user registration process.
# It sends a POST request with user details and checks the response.
User_registration

    # Step 1: Create a session to connect to the API using the base URL.
    # Think of this like opening a communication line with the website.
    Create Session    my    ${base_url}

    # Step 2: Create a dictionary (key-value pairs) that holds the user data.
    # This is the information we will send to the server (like email, password, name).
    ${body}=    Create Dictionary     email=eve.holt@reqres.in    password=pistol    name=yusuf

    # Step 3: Create a dictionary for the headers.
    # "Content-Type" tells the server that we are sending JSON data.
    ${header}=    Create Dictionary    Content-Type=application/json

    # Step 4: Send a POST request to the server.
    # - "my" is the session we created.
    # - "/posts" is the endpoint (a specific function of the API).
    # - "data=${body}" sends the user information.
    # - "headers=${header}" sends the header information.
    ${response}=  Post Request   my     /posts       data=${body}     headers=${header}

    # Step 5: Print the response status code in the console.
    # Example: 200 means success, 201 means created, etc.
    Log To Console    ${response.status_code}

    # Step 6: Print the response body (the actual data returned by the server).
    Log To Console    ${response.content}

    # Step 7: Convert the response body to a string, so we can easily check what it contains.
    ${res_body}=   Convert To String     ${response.content}

    # Step 8: Validation — check if the response contains specific expected data.
    # "Should Contain" will pass if the given text is found inside ${res_body}.
    # Here you can specify what text you expect (like "yusuf" or "email").
    Should Contain    ${res_body}
    Should Contain    ${res_body}
