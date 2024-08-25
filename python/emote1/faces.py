def convert(x):
    replacements = {':)': '🙂', ':(': '🙁'}
    for key, value in replacements.items():
        x = x.replace(key, value)
    return x


def main():
   x = input()
   x = convert(x)
   print(x)


main()