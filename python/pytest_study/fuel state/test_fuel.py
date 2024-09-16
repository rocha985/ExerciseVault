from fuel import convert, gauge
import pytest

def test_convert_valid_fractions():
    assert convert("1/2") == 50
    assert convert("99/100") == 99

def test_convert_invalid_fractions():
    with pytest.raises(ValueError):
        convert("c/s")
    with pytest.raises(ZeroDivisionError):
        convert("1/0")

def test_gauge_display():
    assert gauge(50) == "50%"
    assert gauge(1) == "E"
    assert gauge(99) == "F"
