from datetime import date
import inflect
import sys


def main():
    birthday = input("Date (YYYY-MM-DD): ")
    result = calculate_minutes(birthday)
    if result:
        print(result)


def calculate_minutes(birthday):
    try:
        year, month, day = map(int, birthday.split("-"))
        birthday = date(year, month, day)
    except ValueError:
        sys.exit("Invalid date format. Please use YYYY-MM-DD.")

    difference_in_minutes = (date.today() - birthday).days * 24 * 60

    p = inflect.engine()
    result = p.number_to_words(difference_in_minutes, andword="").capitalize()
    return f"{result} minutes"


if __name__ == "__main__":
    main()
