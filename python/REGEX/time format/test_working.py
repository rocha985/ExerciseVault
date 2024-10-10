from working import convert
import pytest

def main():
    test_valid_times()
    test_invalid_times()
    test_edge_cases()

def test_valid_times():
    assert convert("12 PM to 1 PM") == "12:00 to 13:00"
    assert convert("12 AM to 12 PM") == "00:00 to 12:00"
    assert convert("1 AM to 1 PM") == "01:00 to 13:00"
    assert convert("3:15 PM to 4:45 AM") == "15:15 to 04:45"
    assert convert("6 AM to 6 PM") == "06:00 to 18:00"

def test_invalid_times():
    with pytest.raises(ValueError):
        convert("12:60 PM to 1:00 AM")
    with pytest.raises(ValueError):
        convert("9 AM - 5 PM")
    with pytest.raises(ValueError):
        convert("9 AM to 13 PM")
    with pytest.raises(ValueError):
        convert("9:00 AM to 5:00 PM PM")
    with pytest.raises(ValueError):
        convert("10:30 PM to 8:70 AM")

def test_edge_cases():
    assert convert("12:00 AM to 12:00 AM") == "00:00 to 00:00"
    assert convert("1:00 PM to 1:00 AM") == "13:00 to 01:00"
    assert convert("11:59 PM to 12:00 AM") == "23:59 to 00:00"
    assert convert("12:00 PM to 11:59 PM") == "12:00 to 23:59"

if __name__ == "__main__":
    main()
