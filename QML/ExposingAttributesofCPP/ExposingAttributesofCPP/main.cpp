#include <QQuickView>
#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <message.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    QQuickView view(&engine, 0);
    Message *msg = new Message();
    msg->setAuthor("Gaurav");
    msg->setCreationDate(QDateTime());
    view.engine()->rootContext()->setContextProperty("msg", msg);
    view.setSource(QUrl::fromLocalFile("quickviewmain.qml"));
    view.show();


/*
    Message *msg = new Message();
    msg->setAuthor("Gaurav");
    msg->setCreationDate(QDateTime());
    engine.rootContext()->setContextProperty("msg", msg);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
*/


    return app.exec();
}
