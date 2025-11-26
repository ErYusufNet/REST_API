import pytest


@pytest.mark.dependency()
@pytest.mark.order(1)
def test_open_app():
    print("App opened")


@pytest.mark.dependency(depends=["test_login"])
@pytest.mark.order(3)
def test_dashboard():
    print("dashboard loaded")


@pytest.mark.dependency(depends=['test_open_app'])
@pytest.mark.order(2)
def test_login():
    print("login successfull")





