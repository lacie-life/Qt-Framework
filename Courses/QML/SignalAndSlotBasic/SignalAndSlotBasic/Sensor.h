#ifndef SENDERA_H
#define SENDERA_H

#include <QObject>


class Sensor : public QObject
{
    Q_OBJECT

public:
    Sensor();
    explicit Sensor(QString nameT) {
        name = nameT;
        temperature = 5;
        humiduty = 6;
    }
    int getHumidity() {
        return humiduty;
    }

    int getTemperature() {
        return temperature;
    }

    QString getName() const {
    return name;
    }
    void setName(const QString &a){
        if (a != name) {
            name = a;
        }
    }


public slots:
    void setTemperature(int val);
    void setHumidity(int val);

signals:
    void temperatureChanged(int newTemp);
    void humidityChanged(int newTemp);

    void updateSensor(const QString &name, QString param, int value);
private:
    int temperature;
    int humiduty;
    QString name;
};

#endif // SENDERA_H
