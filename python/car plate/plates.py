def main():
    plate = input("Plate: ")
    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")


def is_valid(s):
    if not (2 <= len(s) <= 6):
        return False

    if not s[:2].isalpha():
        return False

    has_number_started = False

    for char in s:
        if char.isdigit():
            if char == '0' and not has_number_started:
                return False
            has_number_started = True
        elif has_number_started:
            return False

    return True


main()
