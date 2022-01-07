#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QtDebug>
#include <Sensor.h>
#include <QThread>
#include <SensorUpdator.h>

class Controller : public QObject
{
    Q_OBJECT
    QThread thread;
public:
    Controller();

    ~Controller(){
        thread.quit();
        thread.wait();
        thread.destroyed();
    }

    void initialise();

    void testSignals();

    SensorUpdator* getSensorUpdator(){
        return  sensorUpdator;
    }

private:
    Sensor *sensorPtr1;
    Sensor *sensorPtr2;
    Sensor sensorObj;
    SensorUpdator *sensorUpdator;
};

#endif // CONTROLLER_H
