#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <singletonetype.h>
#include <infoprovider.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;




    // Register the singleton type
    qmlRegisterSingletonType("Qt.example.singletone", 1, 0,
                             "MyApi",
                             example_qjsvalue_singletontype_provider);

    // Register the singleton type provider
    qmlRegisterSingletonType("Qt.example.singletoneInfo", 1, 0,
                             "InfoApi",
                             information_singletontype_provider);

    // Register the singleton type
    qmlRegisterSingletonType("Qt.example.singletone2", 1, 0,
                             "MyApi",
                             example_qjsvalue_singletontype_provider);

    // Register the singleton type provider
    qmlRegisterSingletonType("Qt.example.singletoneInfo2", 1, 0,
                             "InfoApi",
                             information_singletontype_provider);


    qmlRegisterSingletonType<InfoProvider>("Qt.example.InfoProvider", 1, 0,
                                                   "InfoProviderAPI",
                                                   infoProvider_singletonInstance_provider);



    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));



    return app.exec();
}


