#include <QTextStream>
#include <QDate>
#include <QTime>

int main(void) {

   QTextStream out(stdout);

   // Init Date and Time
   QDate dt1(2015, 4, 12);
   out << "The date is " << dt1.toString() << endl;

   QDate dt2;
   dt2.setDate(2015, 3, 3);
   out << "The date is " << dt2.toString() << endl;

   QTime tm1(17, 30, 12, 55);
   out << "The time is " << tm1.toString("hh:mm:ss.zzz") << endl;

   QTime tm2;
   tm2.setHMS(13, 52, 45, 155);
   out << "The time is " << tm2.toString("hh:mm:ss.zzz") << endl;

   // Get Current Date and Time
   QDate cd = QDate::currentDate();
   QTime ct = QTime::currentTime();

   out << "Current date is: " << cd.toString() << endl;
   out << "Current time is: " << ct.toString() << endl;

   out << "Today is " << cd.toString(Qt::TextDate) << endl;
   out << "Today is " << cd.toString(Qt::ISODate) << endl;
   out << "Today is " << cd.toString(Qt::SystemLocaleShortDate) << endl;
   out << "Today is " << cd.toString(Qt::SystemLocaleLongDate) << endl;
   out << "Today is " << cd.toString(Qt::DefaultLocaleShortDate) << endl;
   out << "Today is " << cd.toString(Qt::DefaultLocaleLongDate) << endl;
   out << "Today is " << cd.toString(Qt::SystemLocaleDate) << endl;
   out << "Today is " << cd.toString(Qt::LocaleDate) << endl;

   out << "Today is " << cd.toString("yyyy-MM-dd") << endl;
   out << "Today is " << cd.toString("yy/M/dd") << endl;
   out << "Today is " << cd.toString("d. M. yyyy") << endl;
   out << "Today is " << cd.toString("d-MMMM-yyyy") << endl;

   out << "The time is " << ct.toString(Qt::TextDate) << endl;
   out << "The time is " << ct.toString(Qt::ISODate) << endl;
   out << "The time is " << ct.toString(Qt::SystemLocaleShortDate) << endl;
   out << "The time is " << ct.toString(Qt::SystemLocaleLongDate) << endl;
   out << "The time is " << ct.toString(Qt::DefaultLocaleShortDate) << endl;
   out << "The time is " << ct.toString(Qt::DefaultLocaleLongDate) << endl;
   out << "The time is " << ct.toString(Qt::SystemLocaleDate) << endl;
   out << "The time is " << ct.toString(Qt::LocaleDate) << endl;

   out << "The time is " << ct.toString("hh:mm:ss.zzz") << endl;
   out << "The time is " << ct.toString("h:m:s a") << endl;
   out << "The time is " << ct.toString("H:m:s A") << endl;
   out << "The time is " << ct.toString("h:m AP") << endl;

   // Comparing dates
   QDate dt3(2015, 4, 5);
   QDate dt4(2014, 4, 5);

   if (dt3 < dt4) {
      out << dt3.toString() << " comes before "
          << dt4.toString() << endl;
    } else {
      out << dt3.toString() << " comes after "
          << dt4.toString() << endl;
    }

   return 0;
}
