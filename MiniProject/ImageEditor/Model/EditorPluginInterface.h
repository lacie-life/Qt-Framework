#ifndef EDITORPLUGININTERFACE_H
#define EDITORPLUGININTERFACE_H

#include <QObject>
#include <QString>
#include "opencv2/opencv.hpp"


class EditorPluginInterface
{
public:
    virtual ~EditorPluginInterface() {};
    virtual QString name() = 0;
    virtual void edit(const cv::Mat &input, cv::Mat &output) = 0;
};

#define EDIT_PLUGIN_INTERFACE_IID "com.lacie.editorplugininterface"
Q_DECLARE_INTERFACE(EditorPluginInterface, EDIT_PLUGIN_INTERFACE_IID);

#endif // EDITORPLUGININTERFACE_H
