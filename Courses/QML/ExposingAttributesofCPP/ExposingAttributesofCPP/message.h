#ifndef MESSAGE_H
#define MESSAGE_H

#include <QDate>
#include <QObject>
#include <QQmlEngine>

class Message : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged)
    Q_PROPERTY(QDateTime creationDate READ creationDate WRITE setCreationDate NOTIFY creationDateChanged)
    QML_ELEMENT
public:
    Message();
    void setAuthor(const QString &a);
    void setCreationDate(const QDateTime &date);
    QString author() const;
    QDateTime creationDate() const;

    Q_INVOKABLE QString postMessage(const QString &msg);
signals:
    void authorChanged();
    void creationDateChanged();
    void newMessagePosted(const QString &subject);
public slots:
    void refresh() {
        qDebug() << "Called the C++ slot from qml";
    }
private:
    QString m_author;
    QDateTime m_creationDate;
    int count;
};


#endif // MESSAGE_H
