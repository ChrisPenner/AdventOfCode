import re
g1 = re.compile('(.*[aeiou].*){3,}') # Has 3 vowels
g2 = re.compile("([a-z])\\1") # Has double letter
b = re.compile("ab|cd|pq|xy")
with open('input.txt') as f:
    lines = [l for l in f if not b.search(l)]
    lines = [l for l in lines if g1.search(l) and g2.search(l)]
    print len(lines)
    # 258


