import re

def main():
    print(convert(input("Hours: ")))

def convert(s):
    pattern = r"^([1-9]|1[0-2]):?([0-5][0-9])? (AM|PM) to ([1-9]|1[0-2]):?([0-5][0-9])? (AM|PM)$"
    hours = re.search(pattern, s)

    if hours:
        if int(hours.group(1)) > 12 or int(hours.group(4)) > 12:
            raise ValueError

        start_time = convert_to_24_hour_format(int(hours.group(1)), hours.group(2), hours.group(3))
        end_time = convert_to_24_hour_format(int(hours.group(4)), hours.group(5), hours.group(6))

        return f"{start_time} to {end_time}"

    else:
        raise ValueError

def convert_to_24_hour_format(hour, minute, period):
    if period == "PM":
        if hour != 12:
            hour += 12
    else:
        if hour == 12:
            hour = 0

    if minute is None:
        minute = "00"

    return f"{hour:02}:{minute:02}"

if __name__ == "__main__":
    main()
