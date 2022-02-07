#include "Sphere.h"

#include <QApplication>

int main(int argc, char **argv)
{
    QApplication app(argc, argv);

    SphereViewer viewer;
    viewer.show();

    return app.exec();
}
