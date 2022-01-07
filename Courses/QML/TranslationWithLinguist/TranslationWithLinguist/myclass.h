#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>
#include <QDebug>
#include <QTranslator>


class MyClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)
    Q_PROPERTY(int count READ count WRITE setCount NOTIFY countChanged)

public:
    MyClass();
    void setMessage(const QString &a);
    QString message() const;

    int count(){
        return m_count;
    }

    void setCount(int temp) {
        m_count = temp;
        emit countChanged();
    }
signals:
    void refreshTranslate();
    void countChanged();
    void messageChanged();


public slots:
    void changeLanguage(const QString &msg);


private:
    QString m_message;
    int m_count;
};
#endif // MYCLASS_H
