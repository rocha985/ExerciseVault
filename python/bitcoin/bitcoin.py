import sys
import requests

def main():
    if len(sys.argv) != 2:
        print("Missing command-line argument ")
        sys.exit(1)

    try:
        num_bitcoins = float(sys.argv[1])
    except ValueError:
        print("Command-line argument is not a number  ")
        sys.exit(1)

    try:
        response = requests.get("https://api.coindesk.com/v1/bpi/currentprice.json")
        response.raise_for_status()
        data = response.json()
        price_per_bitcoin = data["bpi"]["USD"]["rate_float"]
    except requests.RequestException as e:
        print(f"Failed to fetch Bitcoin price. {e}")
        sys.exit(1)

    total_cost = num_bitcoins * price_per_bitcoin
    print(f"${total_cost:,.4f}", end="")

if __name__ == "__main__":
    main()
