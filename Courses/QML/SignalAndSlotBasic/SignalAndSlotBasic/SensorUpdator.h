#ifndef SENSORUPDATOR_H
#define SENSORUPDATOR_H

#ifndef MESSAGE_H
#define MESSAGE_H

#include <QDate>
#include <QTimer>
#include <QObject>



class SensorUpdator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)

public:
    SensorUpdator(){};

    void setMessage(const QString &a){
        if (a != m_message) {
            m_message = a;
            emit messageChanged();
        }
    }


    QString message() const {
        return m_message;
    }


signals:

    void messageChanged();
    void sensorRefresh(const QString &sensorName, QString param, int value);
    void startTest();


public slots:
    void updateMsg(const QString &msg){
        setMessage(msg);
    }
private:

    QString m_message;

};


#endif // MESSAGE_H


#endif // SENSORUPDATOR_H
