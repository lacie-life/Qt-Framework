#include "ErodePlugin.h"

QString ErodePlugin::name()
{
    return "Erode";
}

void ErodePlugin::edit(const cv::Mat &input, cv::Mat &output)
{
    cv::erode(input, output, cv::Mat());
}
