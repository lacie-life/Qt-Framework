#include "test.h"

Test::Test(QObject *parent) : QObject(parent)
{
    connect(&m_timer, &QTimer::timeout, this, &Test::timeout);
    m_timer.setInterval(1000);
    m_display = "Starting";
    qInfo() << m_display;
    emit notice(QVariant(m_display));
}

void Test::timeout()
{
    m_display = QDateTime::currentDateTime().toString();
    qInfo() << m_display;
    emit notice(QVariant(m_display));
}

void Test::start()
{
    m_display = "Starting...";
    qInfo() << m_display;
    emit notice(QVariant(m_display));
    m_timer.start();
}

void Test::stop()
{
    m_timer.stop();
    m_display = "Stopped";
    qInfo() << m_display;
    emit notice(QVariant(m_display));

}
