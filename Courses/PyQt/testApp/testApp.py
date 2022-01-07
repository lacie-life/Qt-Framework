# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'testApp.ui'
#
# Created by: PyQt5 UI code generator 5.9.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QMessageBox

class Ui_Test(object):
    def setupUi(self, Test):
        Test.setObjectName("Test")
        Test.resize(400, 300)
        self.pushButton = QtWidgets.QPushButton(Test)
        self.pushButton.setGeometry(QtCore.QRect(150, 50, 89, 25))
        self.pushButton.setObjectName("pushButton")

        self.retranslateUi(Test)
        QtCore.QMetaObject.connectSlotsByName(Test)

        self.pushButton.clicked.connect(self.printMessage)

    def retranslateUi(self, Test):
        _translate = QtCore.QCoreApplication.translate
        Test.setWindowTitle(_translate("Test", "Test"))
        self.pushButton.setText(_translate("Test", "Click Here"))
    
    def printMessage(self):
        alert = QMessageBox()
        alert.setText('Hello World')
        alert.exec_()

