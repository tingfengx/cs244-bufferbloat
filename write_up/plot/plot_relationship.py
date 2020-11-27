import matplotlib.pyplot as plt
import numpy as np
from scipy import stats

plt.figure(figsize=(8, 6))
plt.style.use("seaborn")
qs = np.array([5, 20, 100])
rtts = np.array([12.5, 20, 175])

slope, intercept, r_value, p_value, std_err = stats.linregress(qs, rtts)
plt.scatter(qs, rtts, s=100, label="Observations")
plt.plot(np.arange(0, 101), np.arange(0, 101) * slope + intercept, label=f"Fitted Line via Linear Regression \n RTT = {intercept} + {slope} * qsize")
plt.title("Relatinship between RTT and Queue size", size=18)
plt.xlabel("queue size", size=14)
plt.ylabel("rtt time in average (ms)", size=14)
plt.legend(loc="best")
plt.savefig("./fit.pdf")
