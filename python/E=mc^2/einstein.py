SPEED_OF_LIGHT = 300000000


def get_mass():
    mass = int(input("mass (in kg): "))
    return mass


def calculate_energy(mass):
    energy = mass * SPEED_OF_LIGHT ** 2
    return energy


def main():
    mass = get_mass()
    energy = calculate_energy(mass)
    print(energy)


main()
