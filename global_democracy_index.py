import numpy as np
import pandas as pd
import matplotlib.pyplot as plt 
from matplotlib.pyplot import subplots

global_democracy_index = pd.read_csv(r'C:\Users\Antonio\Desktop\global_democracy_index\global_democracy_index.csv')
top_10 = global_democracy_index.nlargest(10, 'score_2022')
# Make a bar plot with the results
fig, ax1 = plt.subplots(figsize=(8,8)) 
ax1.bar(top_10['country_name'], top_10['score_2022'])
ax1.set_ylim(bottom=top_10['score_2022'].min() - 0.6, top=top_10['score_2022'].max() + 0.6)
ax1.set_title("Top 10 countries in the 2022 Global Democracy Index")
ax1.set_xlabel('Countries')
ax1.set_ylabel('Index Value')
plt.show()

global_democracy_index['difference'] = global_democracy_index['score_2022'] - global_democracy_index['score_2018']
global_democracy_index['percentage_change']= np.round(((global_democracy_index['score_2022'] - global_democracy_index['score_2018']) / global_democracy_index['score_2018'])* 100, 2)
top_10_percentage_change = global_democracy_index.nsmallest(10, 'percentage_change')

# bar plot with the top 10 countries with biggest percentage change
fig, ax2 = plt.subplots(figsize=(8,8)) 
ax2.bar(top_10_percentage_change['country_name'], abs(top_10_percentage_change['percentage_change']))
ax2.set_title("Top 10 countries with negative change between 2018 and 2022")
ax2.set_xlabel("Countries")
ax2.set_ylabel("Percentage Change (Absolute Value)")
plt.show()





