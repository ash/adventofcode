import re

lines = []
with open('input.txt') as f:
    lines = f.readlines()

good = 0
for line in lines:
    m = re.search('(\d+)-(\d+) (\w): (\w+)', line)

    ch1 = m.group(4)[int(m.group(1)) - 1]
    ch2 = m.group(4)[int(m.group(2)) - 1]
    ch = m.group(3)

    if (ch1 == ch and ch2 != ch) or (ch2 == ch and ch1 != ch):
        good += 1

print(good) # 649
