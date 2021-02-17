#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>
#include <QDebug>

class MyClass : public QObject
{
    Q_OBJECT
public:
    MyClass();
public slots:
    void cppSlot(const QString &msg);
};
#endif // MYCLASS_H
