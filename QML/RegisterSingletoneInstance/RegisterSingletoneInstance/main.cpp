#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <infoprovider.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QScopedPointer<InfoProvider> infoProvider(new InfoProvider);

   // InfoProvider *infoPtr = new InfoProvider();
    QQmlApplicationEngine engine;


   // qmlRegisterSingletonInstance("Qt.instance.infoSingleton", 1, 0, "MyApi", infoPtr);

    qmlRegisterSingletonInstance("Qt.instance.infoSingleton", 1, 0, "MyApi", infoProvider.get());


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    int ret = app.exec();
   // infoPtr->deleteLater();
    return ret;

}


