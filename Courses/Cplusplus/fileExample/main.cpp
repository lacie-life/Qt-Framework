#include <QTextStream>
#include <QFileInfo>
#include <QDateTime>

int main(int argc, char *argv[]) {

  QTextStream out(stdout);

  // File Infor
  if (argc != 2) {

    qWarning("Usage: file_size file");
    return 1;
  }

  QString filename = argv[1];

  if (!QFile(filename).exists()) {

    qWarning("The file does not exist");
    return 1;
  }

  QFileInfo fileinfo(filename);

  qint64 size = fileinfo.size();

  QString str = "The size is: %1 bytes";

  out << str.arg(size) << endl;

  QDateTime last_rea = fileinfo.lastRead();
  QDateTime last_mod = fileinfo.lastModified();

  out << "Last read: " << last_rea.toString() << endl;
  out << "Last modified: " << last_mod.toString() << endl;

  QString absPath = fileinfo.absoluteFilePath();
  QString baseName = fileinfo.baseName();
  QString compBaseName = fileinfo.completeBaseName();
  QString fileName = fileinfo.fileName();
  QString suffix = fileinfo.suffix();
  QString compSuffix = fileinfo.completeSuffix();

  out << "Absolute file path: " << absPath << endl;
  out << "Base name: " << baseName << endl;
  out << "Complete base name: " << compBaseName << endl;
  out << "File name: " << fileName << endl;
  out << "Suffix: " << suffix << endl;
  out << "Whole suffix: " << compSuffix << endl;

  // Read and Write file
  QFile file(filename);

  if (!file.open(QIODevice::ReadOnly)) {

      qWarning("Cannot open file for reading");
      return 1;
    }

  QTextStream in(&file);

  while (!in.atEnd()) {

    QString line = in.readLine();
    out << line << endl;
  }

  file.close();

  if (file.open(QIODevice::WriteOnly)) {

      QTextStream out(&file);
      out << "Xubuntu" << endl;
      out << "Arch" << endl;
      out << "Debian" << endl;
      out << "Redhat" << endl;
      out << "Slackware" << endl;

    } else {

      qWarning("Could not open file");
    }

    file.close();

    // Copy file
    QFile::copy(filename, "blabla");

    // File owner and group
    QString group = fileinfo.group();
    QString owner = fileinfo.owner();

    out << "Group: " << group << endl;
    out << "Owner: " << owner << endl;

    return 0;
}
