#include <QObject>
#include <QQuickItem>
#include <QQuickWindow>
#include <QQmlComponent>
#include <QQmlProperties>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDateTime>
#include <QVariant>
#include <QMetaObject>
#include <QDebug>
#include <Message.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    // /*
    QQmlApplicationEngine  engine;

    qmlRegisterType<Message>("org.qmlExample",1,0,"Message");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    QQmlComponent component(&engine,QUrl(QStringLiteral("qrc:/TestItem.qml")));

    QQuickWindow *window = qobject_cast<QQuickWindow*>(engine.rootObjects().at(0));
    if (!window) {
        qFatal("Error: Your root item has to be a window.");
        return -1;
    }
    window->show();
    QQuickItem *root = window->contentItem();

    QQuickItem *object = qobject_cast<QQuickItem*>(component.create());
    QQmlEngine::setObjectOwnership(object, QQmlEngine::CppOwnership);

    object->setParentItem(root);  // visual parrent
    object->setParent(&engine);   // object tree parent



    // QVariantList and QVariantMap to JavaScript Array and Object

    QVariantList list;
    list << 20 << QColor(Qt::green) << "bottles";

    QVariantMap map;
    map.insert("language", "QML");
    map.insert("released", QDate(2010, 9, 21));
    map.insert("Controller", "C++");
     map.insert("version", 5);

    QMetaObject::invokeMethod(object, "readValues",
                              Q_ARG(QVariant, QVariant::fromValue(list)),
                              Q_ARG(QVariant, QVariant::fromValue(map)));


    // QDateTime to JavaScript Date

    QDateTime dateTime = QDateTime::currentDateTime();
    QVariant retValue;


    QMetaObject::invokeMethod(object, "readDate",
                              Q_RETURN_ARG(QVariant, retValue),
                              Q_ARG(QVariant, QVariant::fromValue(dateTime)));

    qDebug() << "Value returned from readDate():" << retValue;
     qDebug() << "Value returned from converted value:" << retValue.toDateTime().toString();


    return app.exec();
}
