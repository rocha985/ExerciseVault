def main():
    time = input("What time is it? ")
    converted_time = convert(time)
    if converted_time is not None:
        print(meal_time(converted_time))
    else:
        print("Invalid input. Please enter time in HH:MM format.")

def convert(time):
    try:
        hours, minutes = map(int, time.split(":"))
        if 0 <= hours < 24 and 0 <= minutes < 60:
            total_hours = hours + minutes / 60
            return total_hours
        else:
            return None
    except ValueError:
        return None

def meal_time(h):
    if 7 <= h <= 8:
        return "breakfast time"
    elif 12 <= h <= 13:
        return "lunch time"
    elif 18 <= h <= 19:
        return "dinner time"
    else:
        return "not a mealtime"

if __name__ == "__main__":
    main()
