#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QThread>
#include <QDebug>
#include <worker.h>
#include <workerthread.h>
#include <message.h>

class Controller : public QObject
{
    Q_OBJECT
    QThread workerThread;
public:
    Controller() {
        m_message = new Message();
        connect(this, &Controller::message,m_message, &Message::updateMsg);
        connect(m_message, &Message::startThread, this,&Controller::startQthreadInhirited);
        connect(m_message, &Message::startInThread, this,&Controller::startWorkerMovingToQthread);

    }
    ~Controller() {
        workerThread.quit();
        workerThread.wait();
    }

    Message* getMessageObj()
    {
        return m_message;
    }
    void  startWorkerMovingToQthread(const QString &req)
    {
        Worker *worker = new Worker;
        worker->moveToThread(&workerThread);
        connect(&workerThread, &QThread::finished, worker, &QObject::deleteLater);
        connect(this, &Controller::operate, worker, &Worker::doWork);
        connect(worker, &Worker::resultReady, this, &Controller::handleResults);
        connect(worker, &Worker::message, this, &Controller::message);
        connect(worker, &Worker::resultReady, m_message,&Message::threadCompleted);

        workerThread.start();
        emit operate(req);
    }

    void startQthreadInhirited()
    {
        WorkerThread *workerThread = new WorkerThread();
        connect(workerThread, &WorkerThread::resultReady, this,&Controller::handleResults);
        connect(workerThread, &WorkerThread::finished, workerThread, &QObject::deleteLater);
        connect(workerThread, &WorkerThread::message, this, &Controller::message);
        connect(workerThread, &WorkerThread::resultReady, m_message,&Message::threadCompleted);

        workerThread->start();
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

};

#endif // CONTROLLER_H
