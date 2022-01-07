#include <QApplication>
#include <QWidget>

int main(int argc, char *argv[]) {

    QApplication app(argc, argv);

    QWidget window;

    window.resize(250, 150);
//    window.setWindowTitle("Simple example");
    window.setWindowTitle("ToolTip");
    window.setToolTip("QWidget");
    window.show();

    return app.exec();
}
