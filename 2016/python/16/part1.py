init = '11100010111110100'

def flip(s):
    if s == '1':
        return '0'
    return '1'

def dragon(a):
    b = ''.join(list(map(flip, reversed(a))))
    return a + '0' + b

def checksum(s):
    while (len(s) % 2) == 0:
        res = ''
        while s:
            a, b = s[:2]
            s = s[2:]
            if a == b:
                res += '1'
            else:
                res += '0'
        s = res
    return s

s = init
# amount = 35651584
amount = 272
while len(s) < amount:
    s = dragon(s)
s = s[:amount]
print checksum(s)
