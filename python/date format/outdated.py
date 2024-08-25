months = {
    "January": 1,
    "February": 2,
    "March": 3,
    "April": 4,
    "May": 5,
    "June": 6,
    "July": 7,
    "August": 8,
    "September": 9,
    "October": 10,
    "November": 11,
    "December": 12
}

def is_valid_day(day, month):
    if month in [4, 6, 9, 11]:
        return 1 <= day <= 30
    elif month == 2:
        return 1 <= day <= 29
    else:
        return 1 <= day <= 31

def main():
    while True:
        try:
            date = input("Date: ").strip()

            if ',' in date:
                month_day, year = date.split(',', 1)
                month_day = month_day.strip()
                year = year.strip()
                month, day = month_day.split(' ', 1)
                month = month.capitalize()
                day = int(day)

                month = months.get(month, 0)

            elif '/' in date:
                month, day, year = date.split('/')
                month = int(month)
                day = int(day)
                year = year.strip()

            else:
                print("Invalid input format. Please use 'Month Day, Year' or 'MM/DD/YYYY'.")
                continue

            if not (1 <= month <= 12):
                print("Invalid month. Please try again.")
                continue

            if not is_valid_day(day, month):
                print("Invalid day for the month. Please try again.")
                continue

            print(f"{year}-{month:02}-{day:02}")
            break

        except (ValueError, IndexError):
            print("Invalid input. Please try again.")

if __name__ == "__main__":
    main()
