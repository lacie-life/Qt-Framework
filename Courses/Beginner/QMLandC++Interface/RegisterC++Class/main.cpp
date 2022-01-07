#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include  <QQmlContext>
#include "test.h"
/*
  Registering a C++ class as a QML type
  allows you to use it in QML directly

  https://doc.qt.io/qt-5/qqmlengine.html#qmlRegisterType
 */


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //Register a type in QML
    qmlRegisterType<Test>("com.company.test",1,0,"Test");

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
