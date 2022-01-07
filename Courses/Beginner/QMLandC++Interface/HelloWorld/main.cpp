#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>
#include "test.h"

/*
C++ is an advanced topic
QML lives on top of C++ with Qt
*/

//Entry point of the application
int main(int argc, char *argv[])
{
    //Application attributes
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //The application class
    QGuiApplication app(argc, argv);

    //The QML Engine
    QQmlApplicationEngine engine;

    // Add to the root context
    Test test;
    engine.rootContext()->setContextProperty("testing", &test);

     //The URL of the QML file, notice this is a compiled resource
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    //Connecting a signal and slot - making sure the object and url match
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    //The engine loading the QML file
    engine.load(url);

    //The application entering an event loop that keeps the application open
    return app.exec();
}
