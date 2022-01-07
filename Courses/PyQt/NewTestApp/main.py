import sys

from PyQt5 import QtCore, QtGui, QtWidgets
from TextEdit import Ui_MainWindow
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
        self.ui = Ui_MainWindow()
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

        self.timer_alarm = QTimer(self)
        self.timer_alarm.timeout.connect(self.print)
        self.timer_alarm.setInterval(3000)
        self.timer_alarm.start()

    def setupMongodb(self):
        self.client = MongoClient('localhost', 27017)
        self.db = self.client.test_database
        self.collection = self.db.test_collection

    def on_iot_message(self, mqttc, obj, msg):
        print('Update IoTs ...')
        something = msg.payload
        print(something)
        self.ui.label_3.setText(str(something))
        self.data = something
        self.result = self.db.test_collection.insert_one(self.data)

    def on_iot_publish(self, mqttc, obj, mid):
        # print("pub: " + str(mid) + " - mess = " + str(obj))
        pass

    def print(self):
        print("something")


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    ui = MainWindow()
    ui.show()
    sys.exit(app.exec_())



