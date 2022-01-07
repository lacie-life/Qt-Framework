from PyQt5.QtCore import Qt
from PyQt5.QtGui import QPalette
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout, QMessageBox

def on_button_clicked():
    alert = QMessageBox()
    alert.setText('You clicked the button!')
    alert.exec_()

if __name__ == "__main__":
    app = QApplication([])
    app.setStyle('Fusion')
    button = QPushButton('Click')
    button.clicked.connect(on_button_clicked)
    button.show()
    app.exec_()















