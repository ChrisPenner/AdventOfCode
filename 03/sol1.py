s = set([(0,0)])
x, y = 0, 0
with open('input.txt') as f:
    for char in f.read():
        if char == '^':
            y -= 1
        elif char == '>':
            x += 1
        elif char == 'v':
            y += 1
        elif char == '<':
            x -= 1
        s.add((x,y))

print len(s)
# 2565
