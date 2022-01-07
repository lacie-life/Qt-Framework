#ifndef MQTTCONNECTION_H
#define MQTTCONNECTION_H

#include <mosquittopp.h>
#include <string>

class mqttConnection : public mosqpp::mosquittopp
{
public:
    mqttConnection(const char *id, const char *host, int port);
    ~mqttConnection();

    std::string topicName = "test/demo";

    void on_connect(int rc);
    void on_message(const struct mosquitto_message *message);
    void on_subscribe(int mid, int qos_count, const int *granted_qos);
};

#endif // MQTTCONNECTION_H
