import sys
import csv
import os

def validate_arguments(args):
    if len(args) != 3:
        raise ValueError("Usage: python scourgify.py <input_filename.csv> <output_filename.csv>")


def invert_student_name_format(input_file, output_file):
    students = []

    with open(input_file, "r") as rfile:
        reader = csv.DictReader(rfile)

        for row in reader:
            last_name, first_name = (name.strip() for name in row["name"].split(","))
            students.append({
                "first": first_name,
                "last": last_name,
                "house": row["house"]
            })

    with open(output_file, "w", newline='') as wfile:
        writer = csv.DictWriter(wfile, fieldnames=["first", "last", "house"])

        writer.writeheader()

        for student in students:
            writer.writerow(student)


def main():
    try:
        validate_arguments(sys.argv)
        input_filename = sys.argv[1]
        output_filename = sys.argv[2]

        if not os.path.isfile(input_filename):
            sys.exit(f"File '{input_filename}' not found.")

        invert_student_name_format(input_filename, output_filename)

    except ValueError as e:
        sys.exit(str(e))


if __name__ == "__main__":
    main()
