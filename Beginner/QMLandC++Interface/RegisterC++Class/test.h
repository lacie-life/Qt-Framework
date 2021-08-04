#ifndef TEST_H
#define TEST_H

#include <QObject>
#include <QDebug>
#include <QVariant>
#include <QRandomGenerator>

class Test : public QObject
{
    Q_OBJECT
public:
    explicit Test(QObject *parent = nullptr);

signals:
    void status(QVariant data);

public slots:
    void work(QVariant data);
};

#endif // TEST_H
