#ifndef SENSORUPDATOR_H
#define SENSORUPDATOR_H

#ifndef MESSAGE_H
#define MESSAGE_H

#include <QDate>
#include <QTimer>
#include <QObject>



class SensorUpdate : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)

public:
    SensorUpdate(){};

    void setMessage(const QString &a){
        if (a != m_message) {
            m_message = a;
            emit messageChanged();
            emit messageChanged1(a);
        }
    }


    QString message() const {
        return m_message;
    }


signals:

    void messageChanged();
    void messageChanged1(const QString &msg);

private:

    QString m_message;

};


#endif // MESSAGE_H


#endif // SENSORUPDATOR_H

