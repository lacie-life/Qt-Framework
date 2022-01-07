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
    Q_PROPERTY(QString pColor READ pColor WRITE setPColor NOTIFY pColorChanged)
    Q_PROPERTY(int pFont READ pFont WRITE setPFont NOTIFY pFontChanged)
public:
    Message();
    void setAuthor(const QString &a);
    void setCreationDate(const QDateTime &date);
    void setPFont(int temp);
    void setPColor(const QString &color);

    int pFont() const;
    QString pColor() const;
    QString author() const;
    QDateTime creationDate() const;


    Q_INVOKABLE QString postMessage(const QString &msg);
signals:
    void authorChanged();
    void creationDateChanged();
    void pFontChanged();
    void pColorChanged();
    void newMessagePosted(const QString &subject);

public slots:
    void refresh() {
        qDebug() << "Called the C++ slot from qml";
    }
private:
    QString m_author;
    QDateTime m_creationDate;
    int m_pFont;
    QString m_pColor;
    int count;
};


#endif // MESSAGE_H
