#ifndef INFOPROVIDER_H
#define INFOPROVIDER_H


#include <QJSValue>
#include <QDateTime>
#include <QQmlEngine>

class InfoProvider : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int pFont READ pFont WRITE setPFont NOTIFY pFontChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString pColor READ pColor WRITE setPColor NOTIFY pColorChanged)
public:
    // constructor
    InfoProvider(QObject* parent = 0)
        : QObject(parent),m_font(10), m_Name("Default Name from C++"),  m_color("red")
    {

    }

    ~InfoProvider() {}

    Q_INVOKABLE bool refrsh() {
       void nameChanged(QString newValue);
        return true;
    }

    int pFont() const {
        return m_font;
    }

    void setPFont(int val) {
        m_font = val;
        emit pFontChanged(val);
    }

    QString name() const {
        return m_Name;
    }

    void setName(const QString& val) {
        m_Name = val;
        emit nameChanged(val);
    }

    QString pColor() const {
        return m_color;
    }

    void setPColor(const QString& val) {
        m_color = val;
        emit pColorChanged(val);
    }

signals:
    void pFontChanged(int newValue);
    void nameChanged(QString newValue);
    void pColorChanged(QString newValue);


private:
    int m_font;
    QString m_Name;
    QString m_color;
};

class QQmlEngine;
class QJSEngine;

// Define Singleton type provider function
static QObject *infoProvider_singletonInstance_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    InfoProvider *example = new InfoProvider();
    return example;
}


#endif // INFOPROVIDER_H
