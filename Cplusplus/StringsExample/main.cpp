#include <QTextStream>

int main(void) {

    QTextStream out(stdout);

    // Init String
    QString str1 = "The night train";
    out << str1 << endl;

    QString str2("A yellow rose");
    out << str2 << endl;

    std::string s1 = "A blue sky";
    QString str3 = s1.c_str();
    out << str3 << endl;

    std::string s2 = "A thick fog";
    QString str4 = QString::fromLatin1(s2.data(), s2.size());
    out << str4 << endl;

    char s3[] = "A deep forest";
    QString str5(s3);
    out << str5 << endl;

    // Accessing String
    out << str5[0] << endl;
    out << str5.at(0) << endl;

    // String building
    QString tmp = "Hello World %1";
    int n = 0;
    out << tmp.arg(n) << endl;

    // SubString

    QString str = "King of Monsters";
    out << str.right(5) << endl;
    out << str.left(5) << endl;
    out << str.mid(5, 10) << endl;

    QString strsub("The big apple");
    QStringRef sub(&strsub, 0, 7);
    out << sub.toString() << endl;

   return 0;
}
