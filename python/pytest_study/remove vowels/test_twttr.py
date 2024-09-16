from twttr import shorten

def test_shorten_with_vowels():
    assert shorten("hello") == "hll"

def test_shorten_uppercase_vowels():
    assert shorten("HELLO") == "HLL"

def test_shorten_with_whitespace():
    assert shorten("hello world") == "hll wrld"

def test_shorten_with_numbers():
    assert shorten("1234") == "1234"

def test_shorten_with_punctuation():
    assert shorten(".!?") == ".!?"
