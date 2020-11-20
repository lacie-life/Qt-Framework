#include <QTextStream>

int main(void) {

   QTextStream out(stdout);

   QString str = "Lovely";
   str.append(" season");

   out << str << endl;

   str.remove(10, 3);
   out << str << endl;

   str.replace(7, 3, "girl");
   out << str << endl;

   str.clear();

   if (str.isEmpty()) {
     out << "The string is empty" << endl;
   }

   // Aligning String
   QString field1 = "Name: ";
   QString field2 = "Occupation: ";
   QString field3 = "Residence: ";
   QString field4 = "Marital status: ";

   int width = field4.size();

   out << field1.rightJustified(width, ' ') << "Robert\n";
   out << field2.rightJustified(width, ' ') << "programmer\n";
   out << field3.rightJustified(width, ' ') << "New York\n";
   out << field4.rightJustified(width, ' ') << "single\n";

   return 0;
  }
