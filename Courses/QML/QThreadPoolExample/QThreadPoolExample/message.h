#ifndef MESSAGE_H
#define MESSAGE_H

#include <QDate>
#include <QTimer>
#include <QObject>
#include <QQmlEngine>

class Message : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged)
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)
    Q_PROPERTY(QDateTime creationDate READ creationDate WRITE setCreationDate NOTIFY creationDateChanged)
    Q_PROPERTY(QDateTime currentDate READ currentDate WRITE setCurrentDate NOTIFY currentDateChanged)
    Q_PROPERTY(QString pColor READ pColor WRITE setPColor NOTIFY pColorChanged)
    Q_PROPERTY(int pFont READ pFont WRITE setPFont NOTIFY pFontChanged)
public:
    Message();
    void init();
    void setAuthor(const QString &a);
    void setMessage(const QString &a);
    void setCreationDate(const QDateTime &date);
    void setCurrentDate(const QDateTime &date);
    void setPFont(int temp);
    void setPColor(const QString &color);

    QString author() const;
    int pFont() const;
    QString pColor() const;
    QString message() const;
    QDateTime creationDate() const;
    QDateTime currentDate() const;


    Q_INVOKABLE QString postMessage(const QString &msg);

    Q_INVOKABLE void startThreadCall(const QString &req, int type);  // 0 worker thread inherited, 1 move to thread
signals:
    void authorChanged();
    void messageChanged();
    void creationDateChanged();
    void currentDateChanged();
    void pFontChanged();
    void pColorChanged();
    void threadCompleted(const QString &msgUpdate);
    void startThread(const QString &req);   // runnable thread

public slots:
    void refresh() {
        qDebug() << "Called the C++ slot from qml";
        QDateTime now = QDateTime::currentDateTime();
        setCurrentDate(now);
    }

    void updateMsg(const QString &msg){
        postMessage("Updated Msg from single slot" + msg);
        setMessage(msg);
    }
private:
    QString m_author;
    QString m_message;
    QDateTime m_currentDate;
    QDateTime m_creationDate;
    int m_pFont;
    QString m_pColor;
    int count;
};


#endif // MESSAGE_H
