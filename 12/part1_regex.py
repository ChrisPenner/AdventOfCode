import re
# Find all numbers
numbers = re.compile(r'-?\d+')
with open('input.txt') as f:
    inp = f.read()
print sum(int(x) for x in numbers.findall(inp))
