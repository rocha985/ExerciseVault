def get_fraction():
    while True:
        try:
            fraction = input("fraction: ")
            numerator, denominator = map(int, fraction.split('/'))
            if denominator == 0:
                print("Denominator cannot be zero.")
                continue
            if numerator > denominator:
                continue
            return numerator, denominator
        except ValueError:
            print("Invalid input.")


def fraction_to_percentage(numerator, denominator):
    percentage = (numerator / denominator) * 100
    return round(percentage)


def main():
    numerator, denominator = get_fraction()
    percentage = fraction_to_percentage(numerator, denominator)


    if percentage <= 1:
        print("E")
    elif percentage >= 99:
        print("F")
    else:
        print(f"{percentage}%")


if __name__ == "__main__":
    main()
