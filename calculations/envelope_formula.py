import matplotlib.pyplot as plt
import numpy as np

L = 2000
R_max = 0.083 * L

P0 = np.array([0, 0])
P1 = np.array([0.195 * L, 1.138 * R_max])
P2 = np.array([L, 1.208 * R_max])
P3 = np.array([L, 0])

def B(t):
    return (1 - t)**3 * P0 + 3 * (1-t)**2 * t * P1 + 3 * (1-t) *  t**2 * P2 + t**3 * P3

if __name__ == '__main__':
    img = plt.imread('bodensee.png')
    fig, ax = plt.subplots()
    t = np.linspace(0, 1, 100)

    x = [B(i)[0] for i in t] 
    y = [B(i)[1] for i in t]

    ax.imshow(img, extent=[0, L, -230, 230])
    ax.plot(x, y, 'r-')
    ax.plot(x, [-n for n in y], 'r-')

    plt.show()
