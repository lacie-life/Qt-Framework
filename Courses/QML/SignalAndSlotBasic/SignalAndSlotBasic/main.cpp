#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <controller.h>
#include <QQmlContext>


int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));


    Controller controller;
    controller.initialise();


    engine.rootContext()->setContextProperty("sensorRef", controller.getSensorUpdator());
    //  controller.testSignals();
    engine.load(url);
    return app.exec();
}
