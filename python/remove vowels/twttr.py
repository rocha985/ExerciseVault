def remove_vowels(original_string):
    vowels_removed = ""
    for c in original_string:
        if c not in 'AEIOUaeiou':
            vowels_removed += c
    return vowels_removed


def main():
    user_input = str(input("Input: "))
    vowels_removed = remove_vowels(user_input)
    print(vowels_removed)


main()


