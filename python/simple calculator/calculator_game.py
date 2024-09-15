import random


def main():
    correct = 0
    attempts = 3

    level = get_level()

    for i in range(0, 10):
        n1, n2 = generate_integer(level)

        while attempts > 0:
            guess = 0
            try:
                guess = int(input(f"{n1} + {n2} = "))
            except ValueError:
                attempts -= 1
                print("EEE")

            if n1 + n2 != guess:
                print("EEE")
                attempts -= 1
            else:
                correct += 1
                break
        if attempts == 0:
            print(str(n1 + n2))

        attempts = 3

    print(f"Score: {int(correct)}")


def get_level():
    while True:
        try:
            lvl = int(input("Level: "))
            if lvl in range(0, 4):
                return lvl
        except ValueError:
            pass


def generate_integer(level):
    n1 = random.randint(10 ** (level - 1), 10 ** level - 1)
    n2 = random.randint(10 ** (level - 1), 10 ** level - 1)

    return n1, n2


if __name__ == "__main__":
    main()
