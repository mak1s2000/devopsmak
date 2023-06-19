weight = int(input('Weight'))
unit = input('(L)pounds or (K)kilograms: ')
if unit.upper() == "L":
    converted = weight * 0.45
    print(f"You are {converted} kilos")
else:
    converted = weight / 0.45
    print(f"You are {converted} Pounds")
