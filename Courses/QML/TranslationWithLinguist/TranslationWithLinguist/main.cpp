#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QQmlComponent>
#include <QQuickItem>
#include <QQuickWindow>
#include <QQmlContext>
#include <myclass.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    MyClass myClass;
    QTranslator translator ;
    bool status = translator.load("TranslationWithLinguist_fr_FR");
    app.installTranslator(&translator);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    engine.rootContext()->setContextProperty("myClass", &myClass);
    engine.load(url);

    QQmlComponent component(&engine,QUrl(QStringLiteral("qrc:/qmlComp.qml")));

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


    QString returnedValue;
    QString msg = QObject::tr("Initial Message from C++ Controller");
    QMetaObject::invokeMethod(object, "myQmlFunction",
                              Q_RETURN_ARG(QString, returnedValue),
                              Q_ARG(QString, msg));
    qDebug() << "QML function returned:" << returnedValue;


    QObject::connect(object, SIGNAL(qmlSignal(QString)),
                     &myClass, SLOT(changeLanguage(QString)));

    QObject::connect(&myClass, &MyClass::refreshTranslate, &engine, &QQmlApplicationEngine::retranslate);


    return app.exec();
}
