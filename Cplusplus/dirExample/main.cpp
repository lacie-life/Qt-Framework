#include <QTextStream>
#include <QDir>

int main(void) {

  QTextStream out(stdout);
  QDir dir;

  // Create directory
  if (dir.mkdir("mydir")) {
    out << "mydir successfully created" << endl;
  }

  dir.mkdir("mydir2");

  if (dir.exists("mydir2")) {
    dir.rename("mydir2", "newdir");
  }

  dir.mkpath("temp/newdir");

  // Special paths
  out << "Current path:" << QDir::currentPath() << endl;
  out << "Home path:" << QDir::homePath() << endl;
  out << "Temporary path:" << QDir::tempPath() << endl;
  out << "Rooth path:" << QDir::rootPath() << endl;
}
