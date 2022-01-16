#ifndef UTILITIES_H
#define UTILITIES_H

#include <QString>

class Utilities
{
public:
    static QString getDataPath();
    static QString newSavedVideoName();
    static QString getSavedVideoPath(QString name, QString postfix);
    static void notifyMobile(int cameraID);

};

#endif // UTILITIES_H
