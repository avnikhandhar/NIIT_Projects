#!/usr/bin/env python
# coding: utf-8

# **TASK 1 : Give local time of NYC and get time in France(france time is 6hrs less than NYC time)** 

# In[3]:


from datetime import datetime
nt = input("Enter the time in NYC in HH:MM:SS format")
ft = datetime.strptime(nt,"%H:%M:%S") - datetime.strptime("18:00:00","%H:%M:%S")
t = "The current time in france is {time}".format(time=ft)
print(t)


# **TASK 2 : How many dollars will matt need to spend to get 500 Euros, including 1.75% of service charge (1.1 dollar=1 Euro)**

# In[28]:


amount_dollar = 500*1.1
amount_dollar_sc = ((amount_dollar * 1.75)/100) + amount_dollar
out = "Matt will be required to spend {0} dollars for 500 Euros".format(amount_dollar_sc)
print(out)


# **TASK 3: 45-days expenditure of Matt in France**

# In[29]:


one_day_cost = 4000/30
fortyFive_day_cost = one_day_cost *45
total = fortyFive_day_cost + ((20*fortyFive_day_cost)/100)
k = "Matt will need {} for his 45 day trip to France".format(total)
print(k)


# **TASK 4: Profit from an investment after a month** 

# In[5]:


interest = (5*20000)/100
i = "Matt will earn a profit of {0} dollars after a month".format(interest)
print(i)


# **TASK 5: Calculate no. of miles Matt should practice walking per day in NYC**

# In[6]:


no_of_miles = 12 * 0.602
j = "Matt should walk {dist} miles daily in NYC".format(dist=no_of_miles)
print(j)


# **TASK 6: Number of Laps an athelete have to complete**

# In[8]:


distance_in_miles = 3328 * 0.602
no_of_laps = round(distance_in_miles/1.2)
a = " {value} laps have to be completed by an athlete for 3328km".format(value=no_of_laps)
print(a)


# **TASK 7 : No. of days needed to complete 3328km** 

# In[9]:


time_min_Laps = no_of_laps * 2
time_min_Rest = (no_of_laps/5) * 10
time_min_lunch = 60
time_min_ride = 600
total_days = ((time_min_Laps + time_min_Rest + time_min_lunch + time_min_ride)/60)/24
l = "Athlete will need {v} days to complete 3328km".format(v=total_days)
print(l)


# **TASK 8:Calculate no. of bottles of Grape Juice**

# In[34]:


total_oz = 10 * 14
total_ml = (total_oz) * 30
no_of_bottles = (total_ml)/750
x = "Matt will require {b} bottles of grape juice for two weeks".format(b=no_of_bottles)
print(x)


# **TASK 9:Save Jupyter Notebook in three different formats** 

# **TASK 9a:In .ipynb**

# 1. Move to 'File'
# 2. Click on 'Download as'
# 3. Select 'Notebook(.ipynb)'

# **TASK 9b:In .py**

# 1. Move to 'File'
# 2. Click on 'Download as'
# 3. Select 'Python(.py)'

# **TASK 9c:In .html**

# 1. Move to 'File'
# 2. Click on 'Download as'
# 3. Select 'HTML(.html)'
