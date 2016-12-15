import re
from sys import stdin
digits = re.compile(r'(\d+)')
nums = lambda s: map(int, digits.findall(s))
lines = stdin.readlines()
for line in lines:
    _, num_positions, _, start_pos = nums(line)
    discs.append((num_positions, start_pos))

for i in count():
    for t, (mod, start) in enumerate(discs, 1):
        if (start + t + i) % mod != 0:
            break
    else:
        print i
        break
