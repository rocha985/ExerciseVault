import re

def main():
    text = input("Text: ")
    print(count(text))

def count(s):
    return len(re.findall(r'\bum\b', s, re.IGNORECASE))

if __name__ == "__main__":
    main()
