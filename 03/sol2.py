s = set([(0,0)])
x1, y1 = 0, 0
x2, y2 = 0, 0

with open('input.txt') as f:
    chars = f.read()
    n = 2
    chunks = [chars[i:i+n] for i in xrange(0, len(chars), n)]
    for c1, c2 in chunks:
        if c1 == '^':
            y1 -= 1
        elif c1 == '>':
            x1 += 1
        elif c1 == 'v':
            y1 += 1
        elif c1 == '<':
            x1 -= 1

        if c2 == '^':
            y2 -= 1
        elif c2 == '>':
            x2 += 1
        elif c2 == 'v':
            y2 += 1
        elif c2 == '<':
            x2 -= 1

        s.add((x1,y1))
        s.add((x2,y2))

print len(s)
# 2639
