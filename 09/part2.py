from itertools import permutations

# Store distances
distances = {}

# Get all possible places
places = set()

with open('input.txt') as f:
    for line in f:
        parts = line.split(' ')
        frm, _, to, _, amount = parts
        amount = int(amount.strip())
        distances[frm, to] = distances[to, frm] = amount
        places.add(frm)
        places.add(to)

# Get every possible route
possibilities = permutations(places)
# Store route distances as we compute them
totals = []

for route in possibilities:
    total = 0
    for i, frm in enumerate(route):
        if i == len(route) - 1:
            break
        to = route[i+1]
        total += distances[(frm, to)]
    totals.append(total)

print min(totals)
