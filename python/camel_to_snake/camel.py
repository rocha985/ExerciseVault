def camel_to_snake(camel_string):
    snake_string = ""
    for c in camel_string:
        if c.islower():
            snake_string += c
        else:
            snake_string += f"_{c.lower()}"
    return snake_string


def main():
    s = input("camelCase: ")
    converted_string = camel_to_snake(s)
    print(converted_string)


main()