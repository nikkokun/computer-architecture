# Computer Architecture, spring 2018
# Let's see if we can plot the CDF of the execution times
# of our array multiply
# input file is just a list of execution times, one per line, in ASCII
# Plan is to use this on rdtsc() values, but could in theory work
# on any numeric time value.
# rdv, 2018/6/29

import sys
import numpy as np
import matplotlib.pyplot as plt
# wound up not using this, but it's a valuable tool to be aware of
# import scipy.stats as ss

if len(sys.argv) != 2:
    print ("usage:", sys.argv[0], "<filename>")
    exit()

a = np.loadtxt(sys.argv[1])
# turn this on for debugging
# print(a)
print(len(a), "runs, min", min(a), "max", max(a))
print("mean", np.mean(a), "median", np.median(a), "std. dev.", np.std(a), "variance", np.var(a))
plt.plot(a)
plt.show()
# this will sort them in place, into ascending order
a.sort()
# turn this on for debugging
# print(a)
plt.plot(a)
plt.show()
