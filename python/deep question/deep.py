def is_forty_two(user_input):
    return (
        user_input.lower().strip() == "42" or
        user_input.lower().strip() == "forty-two" or
        user_input.lower().strip() == "forty two"
    )


def print_answer(is_true):
    if is_true:
        print("yes")
    else:
        print("no")


def main():
    user_input = input("What is the Answer to the Great Question of Life, the Universe and Everything? ")
    answer = is_forty_two(user_input)
    print_answer(answer)


main()
