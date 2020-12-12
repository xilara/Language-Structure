# Xiana Lara
# September 28, 2020
# Programming 4: Comparing interpreted and compiled codes

# Original Sources
# https://rosettacode.org/wiki/Gaussian_elimination#Python

# Current Purpose:
# Comparing interpreted and compiled languages by measuring
# the time it takes to run the programs with different data sizes

# Input: Square matrices size
# Output: The amount of time in seconds each program ran for

import copy
from fractions import Fraction
import random
import time


mSize = int(input("Square Matrix Size: "))

def gauss(a, b):

    start = time.clock()
    a = copy.deepcopy(a)
    b = copy.deepcopy(b)
    n = len(a)
    p = len(b[0])
    det = 1
    for i in range(n - 1):
        k = i
        for j in range(i + 1, n):
            if abs(a[j][i]) > abs(a[k][i]):
                k = j
        if k != i:
            a[i], a[k] = a[k], a[i]
            b[i], b[k] = b[k], b[i]
            det = -det
 
        for j in range(i + 1, n):
            t = a[j][i]/a[i][i]
            for k in range(i + 1, n):
                a[j][k] -= t*a[i][k]
            for k in range(p):
                b[j][k] -= t*b[i][k]
 
    for i in range(n - 1, -1, -1):
        for j in range(i + 1, n):
            t = a[i][j]
            for k in range(p):
                b[i][k] -= t*b[j][k]
        t = 1/a[i][i]
        det *= a[i][i]
        for j in range(p):
            b[i][j] *= t

    fin = time.clock()
    print(fin-start)

    return det, b

for x in range(5):

    b = [[0 for _ in range(mSize+1)]for _ in range(mSize)]

    # filling random array

    a = [[random.uniform(1, 100) for _ in range(mSize+1)]for _ in range(mSize)]

    det, c = gauss(a, b)