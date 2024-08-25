def get_expression():
    try:
        expression = input("Expression: ")
        x, y, z = expression.split(" ")
        return int(x), y, int(z)
    except ValueError:
        print("invalid input format.")
        return None


def calculate_result(x, y, z):
    if y == "+":
        return x + z
    elif y == "-":
        return x - z
    elif y == "*":
        return x * z
    elif y == "/":
        return x / z
    else:
        print("Invalid operator. Please use +, -, *, or /.")
        return None


def main():
    expression = get_expression()
    x, y, z = expression
    result = calculate_result(x, y, z)
    print(f"Result: {result:.1f}")


if __name__ == "__main__":
    main()




