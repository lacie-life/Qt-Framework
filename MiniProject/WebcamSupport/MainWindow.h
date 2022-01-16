#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QMenuBar>
#include <QAction>
#include <QGraphicsScene>
#include <QGraphicsView>
#include <QStatusBar>
#include <QLabel>
#include <QListView>
#include <QCheckBox>
#include <QPushButton>
#include <QGraphicsPixmapItem>
#include <QMutex>
#include <QStandardItemModel>

#ifdef USE_QT_CAMERA
#include <QCameraViewfinder>
#include <QCamera>
#endif

#include "opencv2/opencv.hpp"
#include "CaptureThread.h"

class MainWindow : public QMainWindow
{
    Q_OBJECT
public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    QMenu *fileMenu;

    QAction *cameraInfoAction;
    QAction *openCameraAction;
    QAction *exitAction;
    QAction *calcFPSAction;;

    QGraphicsScene *imageScene;
    QGraphicsView *imageView;

    QCheckBox *monitorCheckBox;
    QPushButton *recordButton;
    QListView *saved_list;
    QStatusBar *mainStatusBar;
    QLabel *mainStatusLabel;

    QStandardItemModel *list_model;

#ifdef USE_QT_CAMERA
    QCamera *camera;
    QCameraViewfinder *viewfinder;
#endif

    // Frame
    cv::Mat currentFrame;

    // Capture Thread
    QMutex *data_lock;
    CaptureThread *capturer;

private:
    void initUI();
    void createActions();
    void populateSavedList();

private slots:
    void showCameraInfo();
    void openCamera();
    void updateFrame(cv::Mat*);
    void calculateFPS();
    void updateFPS(float);
    void recordingStartStop();
    void appendSavedVideo(QString name);
    void updateMonitorStatus(int status);

signals:

};

#endif // MAINWINDOW_H
