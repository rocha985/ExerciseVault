def main():
    user_input = str(input("Input: "))
    vowels_removed = shorten(user_input)
    print(vowels_removed)


def shorten(word):
    vowels_removed = ""
    for c in word:
        if c not in 'AEIOUaeiou':
            vowels_removed += c
    return vowels_removed


if __name__ == "__main__":
    main()
