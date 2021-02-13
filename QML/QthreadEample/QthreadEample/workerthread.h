#ifndef WORKERTHREAD_H
#define WORKERTHREAD_H

#include <QThread>
#include <QObject>
#include <QtDebug>

class WorkerThread : public QThread
{
    Q_OBJECT
    void run() override {
        QString result;
        for (int i=0; i<10; i++)
        {
            sleep(3);
            QString msg = "Qthread inherited :" +  QString::number(i) + "Worker Thread";
            qDebug() << msg;
            emit message(msg);
            qDebug() << msg;
        }
        result = "complted from Qthread inherited";
        emit resultReady(result);
    }
signals:
    void resultReady(const QString &s);
    void message(const QString &msg);

};



#endif // WORKERTHREAD_H
