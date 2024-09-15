import random

def get_valid_int(prompt):
    while True:
        try:
            value = int(input(prompt))
            if value > 0:
                return value
        except ValueError:
            pass


def play_guessing_game(level):
    random_number = random.randint(1, level)

    guess = None
    while guess != random_number:
        guess = get_valid_int("Guess: ")

        if guess == random_number:
            print("Just right!")
        elif guess < random_number:
            print("Too small!")
        else:
            print("Too large!")


def main():
    level = get_valid_int("Level: ")
    play_guessing_game(level)


if __name__ == "__main__":
    main()
