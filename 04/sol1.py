from hashlib import md5
i = 1
while not md5('iwrupvqb{}'.format(i)).hexdigest().startswith('00000'):
    i += 1
print i
# 346386


i = 1
while not md5('iwrupvqb{}'.format(i)).hexdigest().startswith('000000'):
    i += 1
print i
# 9958218
