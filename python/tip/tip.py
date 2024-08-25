def main():
    dollars = None
    while dollars is None:
        dollars = dollars_to_float(input("How much was the meal? "))

    percent = None
    while percent is None:
        percent = percent_to_float(input("What percentage would you like to tip? "))

    tip = dollars * percent
    print(f"Leave ${tip:.2f}")


def dollars_to_float(d):
    if '$' in d:
        d = d.replace('$', '')
    try:
        return float(d)
    except ValueError:
        print("Invalid input. Please enter a dollar amount.")
        return None


def percent_to_float(p):
    if '%' in p:
        p = p.replace('%', '')
    try:
        return float(p) / 100
    except ValueError:
        print("Invalid input. Please enter a percentage.")
        return None


main()
