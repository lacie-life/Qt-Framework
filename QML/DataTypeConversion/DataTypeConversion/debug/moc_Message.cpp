/****************************************************************************
** Meta object code from reading C++ file 'Message.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../Message.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Message.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Message_t {
    QByteArrayData data[22];
    char stringdata0[201];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Message_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Message_t qt_meta_stringdata_Message = {
    {
QT_MOC_LITERAL(0, 0, 7), // "Message"
QT_MOC_LITERAL(1, 8, 27), // "RegisterEnumClassesUnscoped"
QT_MOC_LITERAL(2, 36, 5), // "false"
QT_MOC_LITERAL(3, 42, 13), // "statusChanged"
QT_MOC_LITERAL(4, 56, 0), // ""
QT_MOC_LITERAL(5, 57, 13), // "statusUpdated"
QT_MOC_LITERAL(6, 71, 6), // "Status"
QT_MOC_LITERAL(7, 78, 6), // "status"
QT_MOC_LITERAL(8, 85, 13), // "getEnumString"
QT_MOC_LITERAL(9, 99, 7), // "enumVal"
QT_MOC_LITERAL(10, 107, 2), // "OK"
QT_MOC_LITERAL(11, 110, 10), // "InProgress"
QT_MOC_LITERAL(12, 121, 5), // "Error"
QT_MOC_LITERAL(13, 127, 7), // "Warning"
QT_MOC_LITERAL(14, 135, 5), // "Fault"
QT_MOC_LITERAL(15, 141, 11), // "Environment"
QT_MOC_LITERAL(16, 153, 4), // "Temp"
QT_MOC_LITERAL(17, 158, 8), // "Humidity"
QT_MOC_LITERAL(18, 167, 8), // "Pressure"
QT_MOC_LITERAL(19, 176, 10), // "OtherValue"
QT_MOC_LITERAL(20, 187, 6), // "Value1"
QT_MOC_LITERAL(21, 194, 6) // "Value2"

    },
    "Message\0RegisterEnumClassesUnscoped\0"
    "false\0statusChanged\0\0statusUpdated\0"
    "Status\0status\0getEnumString\0enumVal\0"
    "OK\0InProgress\0Error\0Warning\0Fault\0"
    "Environment\0Temp\0Humidity\0Pressure\0"
    "OtherValue\0Value1\0Value2"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Message[] = {

 // content:
       8,       // revision
       0,       // classname
       1,   14, // classinfo
       3,   16, // methods
       1,   38, // properties
       3,   42, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // classinfo: key, value
       1,    2,

 // signals: name, argc, parameters, tag, flags
       3,    0,   31,    4, 0x06 /* Public */,
       5,    1,   32,    4, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       8,    1,   35,    4, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 6,    7,

 // methods: parameters
    QMetaType::QString, 0x80000000 | 6,    9,

 // properties: name, type, flags
       7, 0x80000000 | 6, 0x00495009,

 // properties: notify_signal_id
       0,

 // enums: name, alias, flags, count, data
       6,    6, 0x0,    5,   57,
      15,   15, 0x2,    3,   67,
      19,   19, 0x2,    2,   73,

 // enum data: key, value
      10, uint(Message::OK),
      11, uint(Message::InProgress),
      12, uint(Message::Error),
      13, uint(Message::Warning),
      14, uint(Message::Fault),
      16, uint(Message::Environment::Temp),
      17, uint(Message::Environment::Humidity),
      18, uint(Message::Environment::Pressure),
      20, uint(Message::OtherValue::Value1),
      21, uint(Message::OtherValue::Value2),

       0        // eod
};

void Message::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Message *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->statusChanged(); break;
        case 1: _t->statusUpdated((*reinterpret_cast< Status(*)>(_a[1]))); break;
        case 2: { QString _r = _t->getEnumString((*reinterpret_cast< Status(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Message::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Message::statusChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Message::*)(Status );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Message::statusUpdated)) {
                *result = 1;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Message *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< Status*>(_v) = _t->status(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject Message::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Message.data,
    qt_meta_data_Message,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Message::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Message::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Message.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Message::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 3;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Message::statusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Message::statusUpdated(Status _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
