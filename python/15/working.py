from collections import namedtuple
from operator import mul
from itertools import count
import re
nums = re.compile(r'-?\d+')
Ingredient = namedtuple('Ingredient', ['capacity', 'durability', 'flavor', 'texture', 'calories'])
ingredients = []
with open('input.txt') as f:
    for line in f:
        ingredients.append(Ingredient(*map(int, nums.findall(line))))

def get_score(amounts, ings):
    totals = []
    by_ing = zip(*ings)
    for vals in by_ing:
        totals.append(map(lambda x: x[0] * x[1], zip(vals, amounts)))
    next_one = map(sum, totals)
    calories = next_one[-1]
    next_one = next_one[:-1]
    next_one = map(lambda x: max(x, 0), next_one)
    return reduce(mul, next_one)

def get_pairs(n):
    return ((i, n - i) for i in range(n+1))

num_ingredients = len(ingredients)
amounts = [0] * num_ingredients
stack = []
recipe_scores = []
max_teaspoons = 100

p = get_pairs(max_teaspoons)
stack.append(p)
i = 0
while len(stack) > 0:
    try:
        # Get next current, up_next pair permutation at current 'level'
        current, up_next = next(stack[-1]) 
        amounts[i] = current # Set the value at the current level
        if len(stack) < num_ingredients - 1:
            # Add more levels if we've bubbled up
            stack.append(get_pairs(up_next))
            # Going to the next level
            i += 1
            continue
        else:
            # We're at the level just above the lowest, set the last element too
            amounts[-1] = up_next
    except StopIteration:
        stack.pop()
        i -= 1
        continue
    # Do work here
    recipe_scores.append(get_score(amounts, ingredients))

# 222870
print max(recipe_scores)
# 117936
