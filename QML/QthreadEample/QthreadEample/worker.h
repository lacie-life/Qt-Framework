#ifndef WORKER_H
#define WORKER_H
#include <QThread>
#include <QDebug>


class Worker : public QObject
{
    Q_OBJECT

public slots:
    void doWork(const QString &parameter) {
        QString result;
        for (int i=0; i<5; i++)
        {
            QThread::sleep(2);
            QString msg;
            msg = "move to thread worker :" + QString::number(i) + " : " + parameter;
            qDebug() << msg;
            emit message(msg);
        }
        result = "Complted from moveto thread: " + parameter;
        emit resultReady(result);
    }

signals:
    void resultReady(const QString &result);
    void message(const QString &msg);
};


#endif // WORKER_H
