total = 0
with open('input.txt') as f:
    for line in f:
        l, w, h = line.split('x')
        l, w, h = int(l), int(w), int(h)
        total += l*w*h
        li = [l, w, h]
        li.remove(max(li))
        total += sum(x*2 for x in li)

print total
# 3737498
