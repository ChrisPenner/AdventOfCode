def flip(s):
    return (not s)

def dragon(a):
    b = list(map(flip, reversed(a)))
    return a + [False] + b

def checksum(s):
    while (len(s) % 2) == 0:
        s = iter(s)
        res = []
        try:
            while True:
                a, b = next(s), next(s)
                res.append(a == b)
        except:
            s = res
    return s

toBool = lambda c: c == '1'
init = '11100010111110100'
s = map(toBool, init)
amount = 35651584

while len(s) < amount:
    s = dragon(s)
s = s[:amount]
print ''.join(map(str, map(int, checksum(s))))
