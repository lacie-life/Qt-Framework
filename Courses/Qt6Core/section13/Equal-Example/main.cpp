/*

  What
  Equal

  Why
  We also want to ensure they are equal

  How
  qEqual are deprecated
  STD to the rescue

 */

#include <QCoreApplication>
#include <QList>
#include <QDebug>
#include <QRandomGenerator>

void randoms(QList<int> *list, int max) {

    list->reserve(max);

    for(int i = 0; i < max; i++){
        int value = QRandomGenerator::global()->bounded(100);
        list->append(value);
    }
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QList<int> list1;
    randoms(&list1,10);

    QList<int> list2;
    randoms(&list2,10);

    qInfo() << list1;
    qInfo() << list2;

    //qInfo() << "Equal: " << qEqual(list1.begin(), list1.end(), list2.begin());
    qInfo() << "Equal: " << std::equal(list1.begin(), list1.end(), list2.begin());

    list1.fill(9);
    list2.fill(9);
    qInfo() << list1;
    qInfo() << list2;

    qInfo() << "Equal: " << std::equal(list1.begin(), list1.end(), list2.begin());

    return a.exec();
}
