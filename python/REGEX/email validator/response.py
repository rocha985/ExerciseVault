from validator_collection import checkers

def main():
    print(is_valid(input("Email: ")))

def is_valid(email):
    return "Valid" if checkers.is_email(email) else "Invalid"

if __name__ == "__main__":
    main()
