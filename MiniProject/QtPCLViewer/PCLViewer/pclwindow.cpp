#include "pclwindow.h"
#include "ui_pclwindow.h"
#include <QFileDialog>
#include <QMessageBox>

#include <pcl/point_types.h>
#include <pcl/common/common.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/io/pcd_io.h>
#include <vtkRenderWindow.h>
#include <iostream>
#include <boost/filesystem.hpp>
#include <boost/thread/thread.hpp>
#include <boost/bind.hpp>

pcl::visualization::PCLVisualizer pviz ("test_viz", false);
pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_xyz (new pcl::PointCloud<pcl::PointXYZ>);

Pclwindow::Pclwindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Pclwindow)
{
    ui->setupUi(this);

    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_xyz (new pcl::PointCloud<pcl::PointXYZ>);
    for (float y = -0.5f; y <= 0.5f; y += 0.01f)
    {
      for (float z = -0.5f; z <= 0.5f; z += 0.01f)
      {
        pcl::PointXYZ point;
        point.x = 2.0f - y;
        point.y = y;
        point.z = z;
        cloud_xyz->points.push_back (point);
      }
    }
    cloud_xyz->width = cloud_xyz->points.size ();
    cloud_xyz->height = 1;

       vtkSmartPointer<vtkRenderWindow> renderWindow = pviz.getRenderWindow();
       ui->widget->SetRenderWindow (renderWindow);

       pviz.setupInteractor (ui->widget->GetInteractor (), ui->widget->GetRenderWindow ());
       pviz.getInteractorStyle ()->setKeyboardModifier (pcl::visualization::INTERACTOR_KB_MOD_SHIFT);

       pviz.addPointCloud<pcl::PointXYZ>(cloud_xyz);
       pviz.setBackgroundColor(0, 0, 0.1);


   ui->widget->show();

}

Pclwindow::~Pclwindow()
{
    delete ui;
}

void Pclwindow::on_action_triggered()
{
    this->close();
}

void Pclwindow::on_action_2_triggered()
{
    QString fileName = QFileDialog::getOpenFileName(this, tr("Open File"), "", tr("Files (*.pcd)"));
    if (fileName != "")
    {
        pviz.removeAllPointClouds();
        ui->widget->setDisabled(true);
        ui->menuBar->setDisabled(true);
        boost::thread t(boost::bind(pcl::io::loadPCDFile<pcl::PointXYZ>, fileName.toStdString(), boost::ref(*cloud_xyz)));
        //for (int i = 0; i <= (int) sec; i++)
        //{
        //    ui->progressBar->setValue((int) ((i/sec)*100));
        //    ui->label->setText(QString::fromStdString("Wait for "+boost::lexical_cast<std::string>(((int)sec)-i)+" sec"));
            //boost::this_thread::sleep(boost::posix_time::seconds(1)); // wait 1 sec
        //}
        t.join();
        ui->progressBar->setValue(100);
        ui->widget->setEnabled(true);
        ui->menuBar->setEnabled(true);
        if (cloud_xyz->size() > 0)
        {
            pviz.addPointCloud<pcl::PointXYZ>(cloud_xyz);
            ui->progressBar->setValue(0);
        }
    };
}
