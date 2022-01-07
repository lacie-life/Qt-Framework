#include <QObject>
#include <QQuickView>
#include <QQuickItem>
#include <QQmlProperties>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <myclass.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    // Using QQuickView
    QQmlApplicationEngine engine;
    QQuickView view(&engine, 0);


    //QQuickView view;
    view.setSource(QUrl::fromLocalFile("main.qml"));
    view.show();
    QObject *object = qobject_cast<QObject*>(view.rootObject());

    qDebug() << "property width" << object->property("width").toString();
    object->setProperty("width", 500);
    qDebug() << "property width" << object->property("width").toString();

    // Accessing Loaded QML Objects by Object Name
    QObject *rect = object->findChild<QObject*>("rect");   // using object name
    if (rect)
    {
        rect->setProperty("color", "blue");
        QObject *text = rect->findChild<QObject*>("rextTextObj");
        if (text)
            text->setProperty("color", "red");
    }



    QQuickItem *item = qobject_cast<QQuickItem*>(object);
     item->setHeight(300);
     item->setWidth(600);

     QQmlProperty(object, "height").write(300);   // breaks binding
     item->setWidth(600);

    qDebug() << "Property value:" << QQmlProperty::read(object, "stateNumber").toInt();
    //object->setProperty("refWidth", 900);

    QString returnedValue;
    QString msg = "Hello from C++";
    QMetaObject::invokeMethod(object, "myQmlFunction",
                              Q_RETURN_ARG(QString, returnedValue),
                              Q_ARG(QString, msg));
    qDebug() << "QML function returned:" << returnedValue;

    MyClass myClass;
    QObject::connect(object, SIGNAL(qmlSignal(QString)),
                         &myClass, SLOT(cppSlot(QString)));

    return app.exec();
}
