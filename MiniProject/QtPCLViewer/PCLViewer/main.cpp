#include <QApplication>

#include "pclwindow.h"

int main(int argc, char** argv)
{
 QApplication app(argc, argv);
 Pclwindow w;
 w.show();

 app.exec();

 return EXIT_SUCCESS;
}
