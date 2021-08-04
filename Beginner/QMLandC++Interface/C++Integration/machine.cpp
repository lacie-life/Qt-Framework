#include "machine.h"

Machine::Machine(QObject *parent) : QObject(parent)
{
    m_timer.setInterval(1000);
    connect(&m_timer,&QTimer::timeout,this,&Machine::timeout);
}

int Machine::value()
{
    qInfo() << "Returning value";
    return m_value;
}

void Machine::setValue(int data)
{
    qInfo() << "Setting value";
    m_value = data;
    emit progress();
}

void Machine::start()
{
    setValue(0);
    m_timer.start();
    emit started();
}

void Machine::stop()
{

    m_timer.stop();
    emit stopped();
}

void Machine::pause()
{
    m_timer.stop();
    emit paused();
}

void Machine::resume()
{
    m_timer.start();
    emit resumed();
}

void Machine::timeout()
{
    m_value++;
    emit progress();
    if(m_value > 99) stop();
}
