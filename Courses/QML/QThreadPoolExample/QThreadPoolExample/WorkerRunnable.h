#ifndef WORKERRUNNABLE_H
#define WORKERRUNNABLE_H


#include <QThread>
#include <QObject>
#include <QtDebug>
#include <QRunnable>

class WorkerRunnable :  public QObject, public QRunnable
{
    Q_OBJECT
    void run() override {
        QString result;
        emit resultReady("Started " + taskName);
        for (int i=0; i<taskLength; i++)
        {
            QThread::sleep(1);
            QString msg = "Runnable function : " + taskName +": "+  QString::number(i);
            qDebug() << msg;
            emit message(msg);
        }
        result = "complted Runnable function: " + taskName;
        emit resultReady(result);
    }
public:
    void setTaskName(const QString &temp) {
        taskName = temp;
    }
    void setTaskLength(int val) {
        taskLength = val;
    }
signals:
    void resultReady(const QString &s);
    void message(const QString &msg);
private:
    QString taskName;
    int taskLength;

};

#endif // WORKERRUNNABLE_H
