#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>
#include <QQmlEngine>

class Message : public QObject
{
    Q_OBJECT
    Q_CLASSINFO("RegisterEnumClassesUnscoped", "false")

    Q_PROPERTY(Status status READ status NOTIFY statusChanged)
public:
    enum Status {
        OK=0,
        InProgress,
        Error,
        Warning,
        Fault
    };

    enum class Environment {
        Temp=0,
        Humidity,
        Pressure
    };
    enum class OtherValue {
        Value1,
        Value2
    };
    Q_ENUM(Status)
    Q_ENUM(Environment)
    Q_ENUM(OtherValue)
    Status status() const {
        return Status::OK;
    }
    QMetaEnum MyEnum_MetaEnum = QMetaEnum::fromType<Status>();
    Q_INVOKABLE QString getEnumString(Status enumVal){
        return MyEnum_MetaEnum.valueToKey(enumVal);
    }
signals:
    void statusChanged();
    void statusUpdated(Status status);
};

#endif // MESSAGE_H
