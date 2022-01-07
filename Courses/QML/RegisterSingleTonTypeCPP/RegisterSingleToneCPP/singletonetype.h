#ifndef SINGLETONETYPE_H
#define SINGLETONETYPE_H

#include <QJSValue>
#include <QDateTime>
#include <QQmlEngine>

static int statValue = 5;
static QString colorStr;
static int fontValue = 6;

// First, define the singleton type provider function (callback).
static QJSValue example_qjsvalue_singletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)

    QJSValue example = scriptEngine->newObject();
    example.setProperty("exampleProperty", statValue++);
    return example;
}

//  multiple property
static QJSValue information_singletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)

    QJSValue example = scriptEngine->newObject();
    example.setProperty("pName","Gaurav");
    example.setProperty("pDateTime",QDateTime::currentDateTime().toString());
    example.setProperty("pFont", fontValue);
    example.setProperty("pColor", colorStr);

    return example;
}
#endif // SINGLETONETYPE_H
