import sys
import os
import csv
from tabulate import tabulate

def validate_arguments(args):
    if len(args) != 2:
        raise ValueError("Usage: python pizza.py <filename.csv>")

    if not args[1].endswith(".csv"):
        raise ValueError("Not a CSV file")

def read_csv_file(filename):
    with open(filename, "r") as file:
        return list(csv.DictReader(file))

def main():
    try:
        validate_arguments(sys.argv)
        filename = sys.argv[1]

        if not os.path.isfile(filename):
            raise FileNotFoundError(f"File '{filename}' not found.")

        data = read_csv_file(filename)
        print(tabulate(data, headers="keys", tablefmt="grid"))

    except (ValueError, FileNotFoundError) as e:
        print(e, file=sys.stderr)
        sys.exit(1)

    except Exception as e:
        print(f"An unexpected error occurred: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
