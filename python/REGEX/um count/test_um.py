from um import count

def main():
    test_cases()

def test_cases():
    assert count("um") == 1
    assert count("UM") == 1
    assert count("um?") == 1
    assert count("Um, thanks for the album") == 1
    assert count("Um, thanks, um...") == 2

    assert count("This is a test.") == 0
    assert count("um um um") == 3
    assert count("This um is different. Um.") == 2
    assert count("No ums here!") == 0
    assert count("Um? Yes, um.") == 2
    assert count("Ummm... not quite.") == 0 
    assert count("What is um? Just um.") == 2
    assert count("Multiple ums: um um um!") == 3
    assert count("") == 0  # Empty string
    assert count("Just one: um") == 1
    assert count("Mixing cases: Um, uM, UM, um") == 4

if __name__ == "__main__":
    main()
