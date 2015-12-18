from collections import namedtuple
from operator import mul
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
    next = map(sum, totals)
    calories = next[-1]
    next = next[:-1]
    next = map(lambda x: max(x, 0), next)
    return reduce(mul, next)

all = []

# Go through all combinations
# for v in xrange(101):
#     for w in xrange(101-v):
#         for x in xrange(101-v-w):
#             y = 100-v-w-x
#             all.append(get_score([v, w, x, y], ingredients))


import itertools
def gen_recipe(num_ingr, max_amount):
    for recipe in itertools.product(range(max_amount + 1), repeat=(num_ingr - 1)):
        s = sum(recipe)
        if s <= max_amount:
            yield recipe

for recipe in gen_recipe(4, 100):
    all.append(get_score(recipe, ingredients))

print max(all)
