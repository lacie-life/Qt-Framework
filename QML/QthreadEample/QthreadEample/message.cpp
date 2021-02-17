#include "message.h"


Message::Message() {
    m_creationDate = QDateTime();
    m_currentDate = QDateTime();
    count =0;
    m_pFont =30;
    m_pColor = "red";
}


void Message::init(){

}

void Message::setMessage(const QString &a) {
    if (a != m_message) {
        m_message = a;
        emit messageChanged();
    }
}

QString Message::message() const {
    return m_message;
}

void Message::setCreationDate(const QDateTime &date) {
    if (date.isValid()) {
        m_creationDate = date;
        emit creationDateChanged();
    }
}

QDateTime Message::creationDate() const {
    return m_creationDate;
}

void Message::setCurrentDate(const QDateTime &date) {
    if (date.isValid()) {
        m_currentDate = date;
        emit currentDateChanged();
    }
}

QDateTime Message::currentDate() const {
    return m_currentDate;
}

void Message::setPFont(int temp) {
    m_pFont = temp;
    emit pFontChanged();
}
void Message::setPColor(const QString &color) {
    if (color != m_pColor) {
        m_pColor = color;
        emit pColorChanged();
    }
}

int Message::pFont() const {
    return m_pFont;
}
QString Message::pColor() const {
    return  m_pColor;
}


void Message::setAuthor(const QString &a) {
    if (a != m_author) {
        m_author = a;
        emit authorChanged();
    }
}

QString Message::author() const {
    return m_author;
}

QString Message::postMessage(const QString &msg) {
    qDebug() << "Called the C++ method with" << msg;
    count++;
    QString reply = "reply from c++ " + QString::number(count) ;
    return reply;
}

void Message::startThreadCall(const QString &req, int type){
    if (type == 0)
        emit startThread(req);
    else if (type == 1)
        emit startInThread(req);
    else {
        qDebug()<< "not Implemented";
    }
}



