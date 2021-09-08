import sys
import time
import datetime

from PyQt5 import QtCore, QtGui, QtWidgets
from ui_mainwindow import Ui_mqttClient
from PyQt5.QtGui import QIcon

import PyQt5
from PyQt5.QtWidgets import (QApplication, QLabel, QPushButton, QMainWindow, QSizePolicy)
from PyQt5.QtCore import Qt, QTimer
from PyQt5.QtGui import *
from PyQt5.QtCore import pyqtSignal as Signal, pyqtSlot as Slot

import paho.mqtt.client as mqtt
import pymongo
from pymongo import MongoClient


class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow, self).__init__()
        self.ui = Ui_mqttClient()
        self.ui.setupUi(self)

        self.setupGUI_Iots()
        self.setupMongodb()

    def setupGUI_Iots(self):
        self.mqttc = mqtt.Client()
        self.mqttc.on_message = self.on_iot_message
        self.mqttc.on_publish = self.on_iot_publish

        self.mqttc.connect("127.0.0.1", 1883, 60)
        self.mqttc.subscribe("demo/test", qos=0)
        self.mqttc.loop_start()

        self.ui.label.setText("Host :" + " 127.0.0.1")
        self.ui.label_2.setText("Port :" + " 1883")
        self.ui.label_3.setText("Topic :" + " demo/test")

        self.timer_alarm = QTimer(self)
        self.timer_alarm.timeout.connect(self.print)
        self.timer_alarm.setInterval(3000)
        self.timer_alarm.start()

    def setupMongodb(self):
        self.client = MongoClient('localhost', 27017)

        self.db = self.client["mydatabase"]
        self.collection = self.db["WeatherStation"]
    #    for x in self.collection.find():
    #       print(x)

    def on_iot_message(self, mqttc, obj, msg):
        print('Update IoTs ...')
        self.data = msg.payload
#        print(self.data)
        self.ui.label_4.setText("Message : " + str(self.data))
        self.convertdata()
        self.printData()
        data = {
           "WindDirection" : self.windDirection,
           "WindSpeedAverage" : self.windSpeedAverage,
           "WindSpeedMax" : self.windSpeedMax,
            "Temperature" : self.temperature,
            "RainfallOneHour" : self.rainFallOneHour,
            "RainfallOneDay" : self.rainFallOneDay,
            "Humidity" : self.humidity,
            "BarPressure" : self.barPressure,
            "Time" : datetime.datetime.now()
        }
#        print(data)
        self.result = self.collection.insert_one(data)

    def on_iot_publish(self, mqttc, obj, mid):
        # print("pub: " + str(mid) + " - mess = " + str(obj))
        pass

    def print(self):
        print("something")

    def convertdata(self):
        temp = str(self.data)
        print("convert data function")
        self.id = ''
        self.sensorData = ''
        for i in range(temp.find('<')+1, temp.find('>')):
        #    print(temp[i])
            self.id = self.id + temp[i]
        for i in range(temp.find('>')+1, temp.find('*')):
            self.sensorData = self.sensorData + temp[i]
        print(self.id)
        print(self.sensorData)

        WindDirection = ''
        for i in range(1, 4):
            WindDirection = WindDirection + self.sensorData[i]
        self.windDirection = int(WindDirection)
    #    print(WindDirection)

        WindSpeedAverage = ''
        for i in range(5,8):
            WindSpeedAverage = WindSpeedAverage + self.sensorData[i]
        self.windSpeedAverage = 0.44704*(int(WindSpeedAverage))

        WindSpeedMax = ''
        for i in range(9,12):
            WindSpeedMax = WindSpeedMax + self.sensorData[i]
        self.windSpeedMax = 0.44704*(int(WindSpeedMax))

        Temperature = ''
        for i in range(13,16):
            Temperature = Temperature +self.sensorData[i]
        self.temperature = (int(Temperature)-32.00)*5.00/9.00

        RainfallOneHour = ''
        for i in range(17,20):
            RainfallOneHour = RainfallOneHour + self.sensorData[i]
        self.rainFallOneHour = (int(RainfallOneHour))*25.40*0.01

        RainfallOneDay = ''
        for i in range(21,24):
            RainfallOneDay = RainfallOneDay + self.sensorData[i]
        self.rainFallOneDay = (int(RainfallOneDay))*25.04*0.01

        Humidity = ''
        for i in range(25,27):
            Humidity = Humidity + self.sensorData[i]
        self.humidity = int(Humidity)

        BarPressure = ''
        for i in range(28,33):
            BarPressure = BarPressure + self.sensorData[i]
        self.barPressure = int(BarPressure) / 10.00

    def printData(self):
        self.ui.WindDirection.setText("Wind Direction: " + str(self.windDirection))
        self.ui.WindSpeedAverage.setText("Wind Speed Average: " + str(self.windSpeedAverage))
        self.ui.WindSpeedMax.setText(("Wind Speed Max: " + str(self.windSpeedMax)))
        self.ui.Temperature.setText(("Temperature: " + str(self.temperature)))
        self.ui.RainfallOneHour.setText(("Rain fall One Hour: " + str(self.rainFallOneHour)))
        self.ui.RainfallOneDay.setText(("Rain fall One Day: " + str(self.rainFallOneDay)))
        self.ui.Humidity.setText(("Humidity: " + str(self.humidity)))
        self.ui.BarPressure.setText(("Bar Pressure: " + str(self.barPressure)))
        self.ui.Time.setText(("Time: " + str(datetime.datetime.now())))

if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    ui = MainWindow()
    ui.show()
    sys.exit(app.exec_())
