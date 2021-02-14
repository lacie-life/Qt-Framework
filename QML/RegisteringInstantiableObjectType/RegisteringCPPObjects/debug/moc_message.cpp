/****************************************************************************
** Meta object code from reading C++ file 'message.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../message.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'message.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Message_t {
    QByteArrayData data[15];
    char stringdata0[152];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Message_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Message_t qt_meta_stringdata_Message = {
    {
QT_MOC_LITERAL(0, 0, 7), // "Message"
QT_MOC_LITERAL(1, 8, 13), // "authorChanged"
QT_MOC_LITERAL(2, 22, 0), // ""
QT_MOC_LITERAL(3, 23, 19), // "creationDateChanged"
QT_MOC_LITERAL(4, 43, 12), // "pFontChanged"
QT_MOC_LITERAL(5, 56, 13), // "pColorChanged"
QT_MOC_LITERAL(6, 70, 16), // "newMessagePosted"
QT_MOC_LITERAL(7, 87, 7), // "subject"
QT_MOC_LITERAL(8, 95, 7), // "refresh"
QT_MOC_LITERAL(9, 103, 11), // "postMessage"
QT_MOC_LITERAL(10, 115, 3), // "msg"
QT_MOC_LITERAL(11, 119, 6), // "author"
QT_MOC_LITERAL(12, 126, 12), // "creationDate"
QT_MOC_LITERAL(13, 139, 6), // "pColor"
QT_MOC_LITERAL(14, 146, 5) // "pFont"

    },
    "Message\0authorChanged\0\0creationDateChanged\0"
    "pFontChanged\0pColorChanged\0newMessagePosted\0"
    "subject\0refresh\0postMessage\0msg\0author\0"
    "creationDate\0pColor\0pFont"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Message[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       4,   60, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   49,    2, 0x06 /* Public */,
       3,    0,   50,    2, 0x06 /* Public */,
       4,    0,   51,    2, 0x06 /* Public */,
       5,    0,   52,    2, 0x06 /* Public */,
       6,    1,   53,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       8,    0,   56,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       9,    1,   57,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    7,

 // slots: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::QString, QMetaType::QString,   10,

 // properties: name, type, flags
      11, QMetaType::QString, 0x00495103,
      12, QMetaType::QDateTime, 0x00495103,
      13, QMetaType::QString, 0x00495103,
      14, QMetaType::Int, 0x00495103,

 // properties: notify_signal_id
       0,
       1,
       3,
       2,

       0        // eod
};

void Message::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Message *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->authorChanged(); break;
        case 1: _t->creationDateChanged(); break;
        case 2: _t->pFontChanged(); break;
        case 3: _t->pColorChanged(); break;
        case 4: _t->newMessagePosted((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->refresh(); break;
        case 6: { QString _r = _t->postMessage((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Message::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Message::authorChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Message::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Message::creationDateChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Message::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Message::pFontChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (Message::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Message::pColorChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (Message::*)(const QString & );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Message::newMessagePosted)) {
                *result = 4;
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
        case 0: *reinterpret_cast< QString*>(_v) = _t->author(); break;
        case 1: *reinterpret_cast< QDateTime*>(_v) = _t->creationDate(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->pColor(); break;
        case 3: *reinterpret_cast< int*>(_v) = _t->pFont(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<Message *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setAuthor(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setCreationDate(*reinterpret_cast< QDateTime*>(_v)); break;
        case 2: _t->setPColor(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setPFont(*reinterpret_cast< int*>(_v)); break;
        default: break;
        }
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
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Message::authorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Message::creationDateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Message::pFontChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void Message::pColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void Message::newMessagePosted(const QString & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
