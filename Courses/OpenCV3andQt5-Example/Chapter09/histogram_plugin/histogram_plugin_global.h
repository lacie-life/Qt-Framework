#ifndef HISTOGRAM_PLUGIN_GLOBAL_H
#define HISTOGRAM_PLUGIN_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(HISTOGRAM_PLUGIN_LIBRARY)
#  define HISTOGRAM_PLUGIN_SHARED_EXPORT Q_DECL_EXPORT
#else
#  define HISTOGRAM_PLUGIN_SHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // HISTOGRAM_PLUGIN_GLOBAL_H