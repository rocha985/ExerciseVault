def coin_register(coin, price):
    if coin > 0:
        if coin == 25:
            price -= 25
        elif coin == 10:
            price -= 10
        elif coin == 5:
            price -= 5
        else:
            print("Invalid coin.")
    else:
        print("No coin inserted.")
    return price

def main():
    price = 50
    while price > 0:
        print(f"Amount Due: {price}")
        coin = int(input("Insert Coin: "))
        price = coin_register(coin, price)

    if price <= 0:
        change = abs(price)
        print(f"Change Owed: {change}")

main()
