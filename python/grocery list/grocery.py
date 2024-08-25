list = {}

def main():
    while True:
        try:
            item = input().upper()

            if item in list:
                list[item] += 1
            else:
                list[item] = 1

        except EOFError:
            for key in sorted(list.keys()):
                print(list[key], key)

            break


if __name__ == "__main__":
    main()


