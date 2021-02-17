#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <sensorupdate.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    SensorUpdate sensorUpdate;
    engine.rootContext()->setContextProperty("sensor_update", &sensorUpdate);
    engine.load(url);




    return app.exec();
}
