#include "myclass.h"
#include <QGuiApplication>


MyClass::MyClass()
{
    m_count = 0;
}

void MyClass::setMessage(const QString &a) {
    if (a != m_message) {
        m_message = a;
        emit messageChanged();
    }
}

QString MyClass::message() const {
    return m_message;
}


void MyClass::changeLanguage(const QString &msg) {
    qDebug() << "Called the C++ slot with message:" << msg;
    setCount(++m_count);
    QTranslator mTranslator;
    QGuiApplication::instance()->removeTranslator(&mTranslator);
    if (msg.compare("French") == 0) {
        if (mTranslator.load("TranslationWithLinguist_fr_FR")) {
            qDebug() << "LOAD FINISHED";
            QGuiApplication::instance()->installTranslator(&mTranslator);
        } else {
            qDebug() << "COULD NOT INSTALL TRANSLATIONS " << msg;
        }
    }
    else if (msg.compare("Hindi") == 0) {
        if (mTranslator.load("TranslationWithLinguist_hi_IN")) {
            qDebug() << "LOAD FINISHED";
            QGuiApplication::instance()->installTranslator(&mTranslator);
        } else {
            qDebug() << "COULD NOT INSTALL TRANSLATIONS " << msg;
        }
    }
    else if (msg.compare("English") == 0) {
        if (mTranslator.load("TranslationWithLinguist_En")) {
            qDebug() << "LOAD FINISHED";
            QGuiApplication::instance()->installTranslator(&mTranslator);
        } else {
            qDebug() << "COULD NOT INSTALL TRANSLATIONS " << msg;
        }
    }

    else if (msg.compare("Spanish") == 0) {
        if (mTranslator.load("TranslationWithLinguist_sp_SP")) {
            qDebug() << "LOAD FINISHED";
            QGuiApplication::instance()->installTranslator(&mTranslator);
        } else {
            qDebug() << "COULD NOT INSTALL TRANSLATIONS " << msg;
        }
    }


    setMessage(tr("Changing Language to  %1 ").arg(msg));
    emit refreshTranslate();

}
