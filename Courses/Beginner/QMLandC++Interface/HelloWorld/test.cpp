#include "test.h"

Test::Test(QObject *parent) : QObject(parent)
{

}

int Test::number()
{
    // Return a number
    qInfo() << "Call number()";
    return 1000;
}

void Test::bark()
{
    qInfo() << "Bark bark";

}
