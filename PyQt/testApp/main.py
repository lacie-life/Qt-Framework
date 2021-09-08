import sys

from PyQt5 import QtCore, QtGui, QtWidgets
from testApp import Ui_Test
from mainWindow import Ui_MainWindow

app = QtWidgets.QApplication(sys.argv)
MainWindow = QtWidgets.QMainWindow()
ui = Ui_MainWindow()
ui.setupUi(MainWindow)
MainWindow.show()
sys.exit(app.exec_())
