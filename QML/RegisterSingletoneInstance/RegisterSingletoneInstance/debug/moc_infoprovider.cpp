/****************************************************************************
** Meta object code from reading C++ file 'infoprovider.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../infoprovider.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'infoprovider.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_InfoProvider_t {
    QByteArrayData data[10];
    char stringdata0[86];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_InfoProvider_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_InfoProvider_t qt_meta_stringdata_InfoProvider = {
    {
QT_MOC_LITERAL(0, 0, 12), // "InfoProvider"
QT_MOC_LITERAL(1, 13, 12), // "pFontChanged"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 8), // "newValue"
QT_MOC_LITERAL(4, 36, 11), // "nameChanged"
QT_MOC_LITERAL(5, 48, 13), // "pColorChanged"
QT_MOC_LITERAL(6, 62, 5), // "reset"
QT_MOC_LITERAL(7, 68, 5), // "pFont"
QT_MOC_LITERAL(8, 74, 4), // "name"
QT_MOC_LITERAL(9, 79, 6) // "pColor"

    },
    "InfoProvider\0pFontChanged\0\0newValue\0"
    "nameChanged\0pColorChanged\0reset\0pFont\0"
    "name\0pColor"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_InfoProvider[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       3,   44, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   34,    2, 0x06 /* Public */,
       4,    1,   37,    2, 0x06 /* Public */,
       5,    1,   40,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       6,    0,   43,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,    3,

 // methods: parameters
    QMetaType::Void,

 // properties: name, type, flags
       7, QMetaType::Int, 0x00495103,
       8, QMetaType::QString, 0x00495103,
       9, QMetaType::QString, 0x00495103,

 // properties: notify_signal_id
       0,
       1,
       2,

       0        // eod
};

void InfoProvider::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<InfoProvider *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->pFontChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: _t->nameChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->pColorChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->reset(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (InfoProvider::*)(int );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&InfoProvider::pFontChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (InfoProvider::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&InfoProvider::nameChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (InfoProvider::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&InfoProvider::pColorChanged)) {
                *result = 2;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<InfoProvider *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->pFont(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->name(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->pColor(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<InfoProvider *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setPFont(*reinterpret_cast< int*>(_v)); break;
        case 1: _t->setName(*reinterpret_cast< QString*>(_v)); break;
        case 2: _t->setPColor(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject InfoProvider::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_InfoProvider.data,
    qt_meta_data_InfoProvider,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *InfoProvider::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *InfoProvider::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_InfoProvider.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int InfoProvider::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void InfoProvider::pFontChanged(int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void InfoProvider::nameChanged(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void InfoProvider::pColorChanged(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
