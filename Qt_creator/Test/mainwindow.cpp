#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QMessageBox>
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->comboBox->addItem(QIcon(":/rec/image/open-file-icon-2.png"), "King");
    ui->comboBox->addItem(QIcon(":/rec/image/open-file-icon-2.png"), "Queen");
    ui->comboBox->addItem(QIcon(":/rec/image/open-file-icon-2.png"), "Prince");


}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_actionNew_triggered()
{
    QMessageBox::information(this, "title", "New");
}

void MainWindow::on_actionOpen_triggered()
{
    QMessageBox::information(this, "title", "Open");
}

void MainWindow::on_actionQuit_triggered()
{
    QApplication::quit();
}

void MainWindow::on_pushButton_clicked()
{
    QMessageBox::information(this, "Thang ngao: ", QString::number(ui->comboBox->currentIndex()));
}
