import re
input_file = open('input.txt')
characters = 0
memory = 0
difference = 0
for line in input_file:
    line = line.strip()
    characters += len(line)
    memory += len(eval(line))
    difference += line.count('\\') + line.count('"') + 2

print characters - memory, difference

#1012
