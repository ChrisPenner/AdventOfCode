total = 0
with open('input.txt') as f:
    for line in f:
        l, w, h = line.split('x')
        l, w, h = int(l), int(w), int(h)
        al, aw, ah = l*w, w*h, h*l
        total += min(al, aw, ah)
        total += 2*al + 2*aw + 2*ah

print total
# 1586300
