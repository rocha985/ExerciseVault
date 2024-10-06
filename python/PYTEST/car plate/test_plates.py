from plates import is_valid

def test_is_valid_all_alpha_uppercase():
    assert is_valid("CSCSCS") == True

def test_is_valid_all_alpha_lowercase():
    assert is_valid("cscscs") == True

def test_is_valid_alphanumeric_invalid():
    assert is_valid("Cs34cs") == False
    assert is_valid("Cscs05") == False

def test_is_valid_all_numeric():
    assert is_valid("505050") == False

def test_is_valid_alphanumeric_valid():
    assert is_valid("CSCS50") == True

def test_is_valid_punctuation():
    assert is_valid("cscs5!") == False
    assert is_valid("!!!!!") == False

def test_is_valid_length_constraints():
    assert is_valid("CSCSCSC50!") == False
    assert is_valid("C") == False
    assert is_valid("") == False
