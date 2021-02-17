#include "Sensor.h"
#include <QDebug>
#include <QThread>

Sensor::Sensor()
{
    temperature = 5;
    humiduty = 6;
}

void Sensor::setTemperature(int val) {
    if (val != temperature)
    {
        qDebug() << name + ": setting temperature to " + QString::number(val);
        QThread::sleep(1);
        temperature = val;
        emit updateSensor(name, "temperature", temperature);
    }
}

void Sensor::setHumidity(int val) {
    if (val != humiduty)
    {
        qDebug() << name + ": setting humidity to " + QString::number(val);
        QThread::sleep(1);
        humiduty = val;
        emit updateSensor(name, "humiduty", humiduty);
    }
}
