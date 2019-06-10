import time
import datetime
import locale
from datetime import timedelta
locale.setlocale(locale.LC_ALL, "en")
print(time.strftime("%a, %d %b %Y %H:%M:%S"))

d = datetime.datetime(2009, 10, 5, 18, 00)
print(d.strftime("%a, %d %b %Y %H:%M:%S"))
print(d + timedelta(seconds=30))
print (d.strftime("%a, %d %b %Y %I:%M:%S %p"))