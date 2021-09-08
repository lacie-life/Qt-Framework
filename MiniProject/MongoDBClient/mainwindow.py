import sys
import datetime

from ui_mainwindow import Ui_MainWindow
from PyQt5.QtGui import QIcon
from mplcanvas import MplCanvs

from PyQt5.QtWidgets import (QApplication, QLabel, QPushButton, QMainWindow, QSizePolicy)
from PyQt5.QtGui import QPixmap
from PyQt5.QtCore import pyqtSignal as Signal, pyqtSlot as Slot

import pymongo
from pymongo import MongoClient
import json

class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow, self).__init__()
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)

        self.setupMongodb()
        self.setupDataDisplay()
        self.setupTestGui()
        pixMap = QPixmap("newison.jpg")
        self.ui.picture.setPixmap(pixMap)

        self.ui.countButton.clicked.connect(self.count)
        self.ui.insertButton.clicked.connect(self.insert)
        self.ui.queryButton.clicked.connect(self.queryByDate)

    def setupMongodb(self):
        self.client = MongoClient('localhost', 27017)

    def setupDataDisplay(self):
        self.dataDisplay = MplCanvs(self.ui.dataDisplay, width=7.0, height=2.2, dpi=100)

    def setupTestGui(self):
        self.ui.databaseEdit.setText("mydatabase")
        self.ui.collectionEdit.setText("testGui")
        self.ui.dateInput.setText("2020-07-17")

    def displayData(self, data):
        data_ = {
            "Humidity": data['Humidity'],
            "Temperature": data['Temperature']
        }
        data_ = json.dumps(data_)
        payload = json.loads(data_)
        print(data)
        self.dataDisplay.updateData(payload)

    @Slot()
    def count(self):
        database = self.ui.databaseEdit.text()
        collection = self.ui.collectionEdit.text()
        self.db = self.client[database]
        self.collection = self.db[collection]
        for x in self.collection.find():
            print(x)
        print(self.collection.count_documents({}))
        self.ui.outputEdit.setText(str(self.collection.count_documents({})))

    @Slot()
    def insert(self):
        database = self.ui.databaseEdit.text()
        collection = self.ui.collectionEdit.text()
        self.db = self.client[database]
        self.collection = self.db[collection]
        timeNow = datetime.datetime.now()
        data = {
            "Humidity" : int(self.ui.humidityEdit.text()),
            "Temperature" : int(self.ui.temperatureEdit.text()),
            "Date" : str(timeNow.date()),
            "Hour" : str(timeNow.hour),
            "Minute" : str(timeNow.minute),
        }
        self.collection.insert_one(data)

    @Slot()
    def query(self):
        database = self.ui.databaseEdit.text()
        collection = self.ui.collectionEdit.text()
        self.db = self.client[database]
        self.collection = self.db[collection]

        myquery = {
            "Date": self.ui.dateInput.text(),
            "Hour": self.ui.timeInput.text()
        }

        mydoc = self.collection.find(myquery)
        for data in mydoc:
            print(data)
            self.displayData(data)
        self.ui.outputEdit.setText(str(mydoc.count()))

    @Slot()
    def queryByDate(self):
        database = self.ui.databaseEdit.text()
        collection = self.ui.collectionEdit.text()
        self.db = self.client[database]
        self.collection = self.db[collection]

        for i in range(0, 24):
            myquery = {
                "Date": self.ui.dateInput.text(),
                "Hour": str(i)

            }
            print(myquery)
            mydoc = self.collection.find(myquery)
            humidity = 0
            temperature = 0
            if mydoc.count() != 0:
                for data in mydoc:
                    print(data)
                    humidity = humidity + data['Humidity']
                    temperature = temperature + data['Temperature']

                newdata = {
                    "Humidity" : humidity/mydoc.count(),
                    "Temperature" : temperature/mydoc.count()
                }
                newdata = json.dumps(newdata)
                payload = json.loads(newdata)
                self.displayData(payload)

        self.ui.outputEdit.setText(str(self.collection.count_documents({})))
        print('\n')

