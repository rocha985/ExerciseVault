def get_greeting_reward(greeting_word):
    greeting_word = greeting_word.lower().strip()
    if greeting_word == "hello":
        reward = "$0"
    elif greeting_word.startswith('h'):
        reward = "$20"
    else:
        reward = "$100"
    return reward


def main():
    user_input = input("Greeting: ")
    user_input = user_input.replace(',', '')
    greeting_word = user_input.split()[0]
    print(get_greeting_reward(greeting_word))


main()
