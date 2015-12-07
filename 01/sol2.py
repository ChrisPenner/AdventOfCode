floor = 0
basement = -1
with open('input.txt') as f:
    for i, char in enumerate(f.read(), 1):
        if char == '(':
            floor += 1
        elif char == ")":
            floor -= 1
        if floor < 0:
            basement = i
            break;

print 'basement at position:', i
# 1795
