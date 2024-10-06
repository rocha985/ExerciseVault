def main():
    user_input = input("Greeting: ")
    user_input = user_input.replace(',', '')
    greeting = user_input.split()[0]
    print(f"${value(greeting)}")

def value(greeting):
    greeting = greeting.lower().strip()
    if greeting == "hello":
        reward = 0
    elif greeting.startswith('h'):
        reward = 20
    else:
        reward = 100
    return reward


if __name__ == "__main__":
    main()
