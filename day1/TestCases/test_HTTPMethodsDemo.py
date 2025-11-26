import requests
import pytest

HEADERS = {'Content-Type': 'application/json',
           "x-api-key": "reqres-free-v1"

}

def test_users_users():
    res = requests.get("https://reqres.in/api/users?page=2",headers=HEADERS)
    print(res.json())
    assert res.status_code == 200
