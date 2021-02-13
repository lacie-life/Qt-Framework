#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QThread>
#include <QDebug>
#include <QThreadPool>
#include <WorkerRunnable.h>
#include <message.h>
#include <QRandomGenerator>

class Controller : public QObject
{
    Q_OBJECT
public:
    Controller() {
        poolInstance = new QThreadPool(this);
        poolInstance->setMaxThreadCount(5);

        m_message = new Message();
        connect(this, &Controller::message,m_message, &Message::updateMsg);
        connect(m_message, &Message::startThread, this,&Controller::startRunnableThread);

    }
    ~Controller() {

    }

    Message* getMessageObj()
    {
        return m_message;
    }


    void startRunnableThread(const QString &req ){
        WorkerRunnable *workerRunnable = new WorkerRunnable();
      //  QThreadPool::globalInstance()->start(workerRunnable);
        workerRunnable->setTaskName(req);
        workerRunnable->setAutoDelete(true);
        workerRunnable->setTaskLength(QRandomGenerator::global()->bounded(50));

        poolInstance->start(workerRunnable);

        connect(workerRunnable, &WorkerRunnable::resultReady,
                this,&Controller::handleResults);
        connect(workerRunnable, &WorkerRunnable::message,
                this, &Controller::message);
        connect(workerRunnable, &WorkerRunnable::resultReady,
                m_message,&Message::threadCompleted);
    }

public slots:
    void handleResults(const QString &res) {
        qDebug() << "Result after thread return : " << res;
    }
signals:
    void operate(const QString &);
    void message(const QString &msg);
private:
    Message *m_message;
    QThreadPool *poolInstance;

};

#endif // CONTROLLER_H
