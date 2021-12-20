#!/usr/bin/python3

from urllib import request, error
from sys import argv
import json

APIKEY = "a5726f84bd2d1c4b4a97bc856dd86cb5"
url = "https://api.openweathermap.org/data/2.5/weather?q=Asansol&appid=" + APIKEY

try:
    request = request.urlopen(url)
    response = request.read()
    result = json.loads(str(response, 'UTF-8'))

    weather = ""
    temperature = float(result["main"]["temp"]) - 273.15
    temp_unit =  "°C"
    if "-f" in argv:
        temperature = (temperature * 1.8) + 32
        temp_unit = "°F"

    wind_speed = float(result["wind"]["speed"]) * 3.6

    if "--nerd" in argv:
        weather += "" + str(int(temperature)) + temp_unit
        weather += " 煮" + str(int(wind_speed)) + "km/h"
    else:
        weather += "🌡️" + str(int(temperature)) + temp_unit
        weather += " 🍃" + str(int(wind_speed)) + "km/h"

    print(weather, end="\n\n")
    print('#1FF9FF')
except error.URLError as err:
    print("  ", end="\n\n")
    print('#FF0000')
