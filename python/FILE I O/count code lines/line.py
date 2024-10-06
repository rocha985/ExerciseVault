import sys
import os

def validate_arguments(args):
    if len(args) != 2:
        raise ValueError("Usage: python count_lines.py <filename.py>")

    if not args[1].endswith(".py"):
        raise ValueError("Not a Python file")

def count_lines(filename):
    with open(filename, "r") as file:
        return sum(1 for line in file if line.strip() and not line.lstrip().startswith("#"))

def main():
    try:
        validate_arguments(sys.argv)
        filename = sys.argv[1]

        if not os.path.isfile(filename):
            raise FileNotFoundError(f"File '{filename}' not found.")

        line_count = count_lines(filename)
        print(line_count)

    except (ValueError) as e:
        sys.exit(e)

if __name__ == "__main__":
    main()
