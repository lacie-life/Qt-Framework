#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QMenuBar>
#include <QToolBar>
#include <QAction>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QStatusBar>
#include <QLabel>
#include <QGraphicsPixmapItem>

#include <QMap>
#include "EditorPluginInterface.h"

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    void initUI();
    void createActions();
    void setupShortcuts();
    void showImage(QString);

    // Plugin
    void loadPlugins();

private slots:
    void openImage();
    void zoomIn();
    void zoomOut();
    void prevImage();
    void nextImage();
    void saveAs();
    void blurImage();

    // Plugin
    void pluginPerform();

private:
    QMenu *fileMenu;
    QMenu *viewMenu;
    QMenu *editMenu;

    QToolBar *fileToolBar;
    QToolBar *viewToolBar;
    QToolBar *editToolBar;

    QGraphicsScene *imageScene;
    QGraphicsView *imageView;

    QStatusBar *mainStatusBar;
    QLabel *mainStatusLabel;

    QAction *openAction;
    QAction *saveAsAction;
    QAction *exitAction;
    QAction *zoomInAction;
    QAction *zoomOutAction;
    QAction *prevAction;
    QAction *nextAction;
    QAction *blurAction;

    QString currentImagePath;
    QGraphicsPixmapItem *currentImage;

    // Plugin
    QMap<QString, EditorPluginInterface*> editPlugins;

};
#endif // MAINWINDOW_H
