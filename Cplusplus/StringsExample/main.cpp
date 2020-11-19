#include <QTextStream>

int main(void) {

    QTextStream out(stdout);

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

    out << str5[0] << endl;
    out << str5.at(0) << endl;

    if (str5.at(13).isNull()){
        out << "Outside the range of the string" << endl;
    }
   return 0;
}
