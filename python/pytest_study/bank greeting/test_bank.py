from bank import value

def test_value():
    assert value("hello") == 0

def test_value_with_h():
    assert value("hi") == 20

def test_value_without_h():
    assert value("yo!") == 100

def test_value_case_insensitivity():
    assert value("HeLLo") == 0
