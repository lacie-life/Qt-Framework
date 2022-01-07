#include "controller.h"
#include "SensorUpdator.h"


Controller::Controller()
{
    sensorPtr1 = new Sensor("Sensor1");
    sensorPtr2 = new Sensor("Sensor2");
    sensorObj.setName("sensor obj");
    sensorUpdator = new SensorUpdator();


}

void Controller::initialise(){

    //connect between different class object signal to signal

    QObject::connect(sensorPtr1, &Sensor::updateSensor,
                     sensorUpdator, &SensorUpdator::sensorRefresh);
    QObject::connect(sensorPtr2, &Sensor::updateSensor,
                     sensorUpdator, &SensorUpdator::sensorRefresh);
    QObject::connect(&sensorObj, &Sensor::updateSensor,
                     sensorUpdator, &SensorUpdator::sensorRefresh);

    // conenct between same class object
    // sensorPtr1 -- publisher
    // sensorPtr2, sensorObj -- receiver.

    // comment below line to have single therad example.
    sensorPtr2->moveToThread(&thread);
    QObject::connect(sensorPtr1, &Sensor::temperatureChanged,
                     sensorPtr2, &Sensor::setTemperature, Qt::BlockingQueuedConnection);
    QObject::connect(sensorPtr1, &Sensor::temperatureChanged,
                     &sensorObj, &Sensor::setTemperature, Qt::QueuedConnection);

    // default: AutoConnection --> DirectConnection (as both object in same thread)
    QObject::connect(sensorPtr1, &Sensor::humidityChanged,
                     sensorPtr2, &Sensor::setHumidity, Qt::QueuedConnection);
    QObject::connect(sensorPtr1, &Sensor::humidityChanged,
                     &sensorObj, &Sensor::setHumidity);



    QObject::connect(sensorUpdator, &SensorUpdator::startTest,
                     this, &Controller::testSignals);
    thread.start();

}

void Controller::testSignals() {
    qDebug() << "Start of signal test";

    qDebug() <<sensorPtr1->getName() + ": emit  humidityChanged on sensor1 20";
    emit sensorPtr1->humidityChanged(20);
    qDebug() << sensorPtr1->getName() + ": After emit of humidityChanged 20";

    qDebug() << sensorPtr1->getName() + ": emit  temperatureChanged on sensor1 30";
    emit sensorPtr1->temperatureChanged(30);
    qDebug() << sensorPtr1->getName() + ": After emit of temperatureChanged 30";

    emit sensorPtr1->humidityChanged(15);
    qDebug() << sensorPtr1->getName() + ": After emit of humidityChanged 15";


}

