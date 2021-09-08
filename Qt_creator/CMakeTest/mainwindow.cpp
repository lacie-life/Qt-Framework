#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QMessageBox>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    QMessageBox::about(this, "Lacie", "CMake Test");
    mosqpp::lib_init();

    connect = new mqttConnection("tempconv", "127.0.0.1", 1883);
    connect->loop_forever();

    mosqpp::lib_cleanup();
}


