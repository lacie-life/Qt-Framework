#include <QObject>
#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>

#include <worker.h>
#include <workerthread.h>
#include <Controller.h>
#include <message.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    Controller contrl;

    engine.rootContext()->setContextProperty("msg", contrl.getMessageObj());

    engine.load(url);

   // contrl.startWorkerMovingToQthread("first call");
   // contrl.startWorkerMovingToQthread("second call");
   // contrl.startQthreadInhirited();



    return app.exec();
}
