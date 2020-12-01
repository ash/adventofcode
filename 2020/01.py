#!/usr/bin/env python3

import itertools
import math

data = []
with open('data.txt') as f:
    data = [int(x) for x in f.readlines()]

for size in range(2, 4):
    for pair in itertools.combinations(data, size):
        if sum(pair) == 2020:
            print(math.prod(pair))
            break
