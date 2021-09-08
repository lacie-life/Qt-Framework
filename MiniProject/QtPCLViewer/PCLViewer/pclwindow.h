#ifndef PCLWINDOW_H
#define PCLWINDOW_H
#include <QMainWindow>

namespace Ui {
class Pclwindow;
}

class Pclwindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit Pclwindow(QWidget *parent = 0);
    ~Pclwindow();

private slots:
    void on_action_triggered();

    void on_action_2_triggered();


private:
    Ui::Pclwindow *ui;
};

#endif // PCLWINDOW_H
