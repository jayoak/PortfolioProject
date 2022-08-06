from src.api import users

def test_simple_pass():
    assert True

def test_simple_fail():
    assert True

def test_users_home(app):
    assert(users.hello_world1() == "My Ecommerce!!")