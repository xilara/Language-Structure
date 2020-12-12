# Xiana Lara
# September 28, 2020
# Programming 4: Comparing interpreted and compiled codes

# Original Sources
# https://numpy.org/learn/

# Current Purpose
# Comparing interpreted and compiled languages by measuring
# the time it takes to run the programs with different data sizes

# Input: Square matrices size
# Output: The amount of time in seconds each program ran for

import numpy
import time

# read matrix size from user
mSize = int(input("Square Matrix Size: "))

for x in range(5):
    a, b= numpy.random.rand(mSize, mSize), numpy.random.rand(mSize, 1)

    start = time.clock()
    mat = numpy.linalg.solve(a, b)
    fin = time.clock()

    print(fin - start)
