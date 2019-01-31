import numpy as np
import envelope_formula as env

numSegs = 14

t = np.linspace(0, 1, env.L)
x = np.linspace(0, env.L, numSegs)
y = np.linspace(0, env.L, numSegs)

Ps = np.empty((env.L + 1, 2))

for i in range(env.L + 1):
    Ps[i] = env.B(i / env.L)

for i,n in enumerate(x):
    idx = (abs(Ps[:,0] - n)).argmin()
    y[i] = Ps[idx][1]
    
for i in range(numSegs):
    print(x[i],y[i])

import matplotlib.pyplot as plt
img = plt.imread('bodensee.png')
fig, ax = plt.subplots()

ax.imshow(img, extent=[0, env.L, -230, 230])
ax.plot(x, y, 'r-')
ax.plot(x, [-n for n in y], 'r-')

plt.show()
