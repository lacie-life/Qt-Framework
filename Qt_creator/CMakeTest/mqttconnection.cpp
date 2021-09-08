#include "mqttconnection.h"
#include <iostream>
#include <cstdio>
#include <cstring>
#include <mosquittopp.h>

mqttConnection::mqttConnection(const char *id, const char *host, int port) : mosquittopp(id)
{
   int keepalive = 60;

   topicName = std::string(id);
   connect(host, port, keepalive);
}

mqttConnection::~mqttConnection()
{

}

void mqttConnection::on_connect(int rc)
{
    std::cout << "Connected with code " << rc << std::endl;
    if(rc == 0){
        subscribe(NULL, topicName.c_str());
    }
}

void mqttConnection::on_message(const mosquitto_message *message)
{
    if (!strcmp(message->topic, topicName.c_str())){
        std::cout << message->payload << std::endl;
    }
}

void mqttConnection::on_subscribe(int mid, int qos_count, const int *granted_qos)
{
    std::cout << "Subscription succeeded " << std::endl;
}
