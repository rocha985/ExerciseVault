from PIL import Image, ImageOps
import sys
import os

def validate_arguments(args):
    if len(args) != 3:
        raise ValueError("Usage: python shirt.py <input_file> <output_file>")
    return args[1], args[2]

def check_file_extensions(input_ext, output_ext):
    valid_extensions = ["jpg", "jpeg", "png"]
    if input_ext != output_ext:
        raise ValueError("Input and output have different extensions")
    if output_ext not in valid_extensions:
        raise ValueError("Invalid output file extension")

def process_image(input_file, output_file):
    try:
        image = Image.open(input_file)
    except FileNotFoundError:
        sys.exit("Input file does not exist")

    shirt = Image.open("shirt.png")
    size = shirt.size
    puppet = ImageOps.fit(image, size)
    puppet.paste(shirt, (0, 0), shirt)
    puppet.save(output_file)

def main():
    try:
        input_file, output_file = validate_arguments(sys.argv)

        input_ext = os.path.splitext(input_file)[1][1:].lower()
        output_ext = os.path.splitext(output_file)[1][1:].lower()

        check_file_extensions(input_ext, output_ext)

        process_image(input_file, output_file)

    except ValueError as e:
        sys.exit(str(e))

if __name__ == "__main__":
    main()
