import re
from collections import defaultdict
from itertools import count
from hashlib import md5

salt = 'yjdafjpo'
three = re.compile(r'(.)\1\1')


def gen_thousand(r):
    return [h2016(salt + str(i)) for i in range(r, r + 1000)]

def h2016(h):
    for i in range(2017):
        h = md5(h).hexdigest()
    return h

def main():
    hashes = []
    results = set()
    for i in count():
        if len(results) == 64:
            print sorted(results)[-1]
            return
        if i + 1001 > len(hashes):
            hashes.extend(gen_thousand(len(hashes)))
        thous = hashes[i+1:i + 1001]
        hex = hashes[i]
        matches = three.findall(hex)
        if matches:
            m = matches[0]
            for h in thous:
                if (m*5) in h:
                    results.add(i)
                    print len(results)
                    break
main()
