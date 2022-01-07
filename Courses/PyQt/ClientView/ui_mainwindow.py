# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'ui_mainwindow.ui'
#
# Created by: PyQt5 UI code generator 5.9.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_client(object):
    def setupUi(self, client):
        client.setObjectName("client")
        client.resize(808, 600)
        self.centralwidget = QtWidgets.QWidget(client)
        self.centralwidget.setObjectName("centralwidget")
        self.host = QtWidgets.QLabel(self.centralwidget)
        self.host.setGeometry(QtCore.QRect(30, 60, 67, 31))
        font = QtGui.QFont()
        font.setPointSize(13)
        self.host.setFont(font)
        self.host.setObjectName("host")
        self.label = QtWidgets.QLabel(self.centralwidget)
        self.label.setGeometry(QtCore.QRect(30, 110, 67, 31))
        font = QtGui.QFont()
        font.setPointSize(13)
        self.label.setFont(font)
        self.label.setObjectName("label")
        self.host_edit = QtWidgets.QLineEdit(self.centralwidget)
        self.host_edit.setGeometry(QtCore.QRect(90, 60, 291, 31))
        self.host_edit.setObjectName("host_edit")
        self.port_edit = QtWidgets.QLineEdit(self.centralwidget)
        self.port_edit.setGeometry(QtCore.QRect(90, 110, 111, 31))
        self.port_edit.setObjectName("port_edit")
        self.connectButton = QtWidgets.QPushButton(self.centralwidget)
        self.connectButton.setGeometry(QtCore.QRect(430, 60, 91, 31))
        self.connectButton.setObjectName("connectButton")
        self.topic = QtWidgets.QLabel(self.centralwidget)
        self.topic.setGeometry(QtCore.QRect(30, 170, 221, 31))
        self.topic.setObjectName("topic")
        self.message = QtWidgets.QLabel(self.centralwidget)
        self.message.setGeometry(QtCore.QRect(30, 210, 561, 41))
        self.message.setObjectName("message")
        self.convertedMessage = QtWidgets.QLabel(self.centralwidget)
        self.convertedMessage.setGeometry(QtCore.QRect(30, 260, 191, 41))
        self.convertedMessage.setObjectName("convertedMessage")
        self.printOut = QtWidgets.QLabel(self.centralwidget)
        self.printOut.setGeometry(QtCore.QRect(30, 300, 741, 241))
        self.printOut.setFrameShape(QtWidgets.QFrame.Panel)
        self.printOut.setFrameShadow(QtWidgets.QFrame.Plain)
        self.printOut.setText("")
        self.printOut.setObjectName("printOut")
        client.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(client)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 808, 22))
        self.menubar.setObjectName("menubar")
        client.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(client)
        self.statusbar.setObjectName("statusbar")
        client.setStatusBar(self.statusbar)

        self.retranslateUi(client)
        QtCore.QMetaObject.connectSlotsByName(client)

    def retranslateUi(self, client):
        _translate = QtCore.QCoreApplication.translate
        client.setWindowTitle(_translate("client", "MQTT"))
        self.host.setText(_translate("client", "Host :"))
        self.label.setText(_translate("client", "Port :"))
        self.connectButton.setText(_translate("client", "Connect"))
        self.topic.setText(_translate("client", "Topic : "))
        self.message.setText(_translate("client", "Message :"))
        self.convertedMessage.setText(_translate("client", "Converted Message :"))

