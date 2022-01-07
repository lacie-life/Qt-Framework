#ifndef BOOK_H
#define BOOK_H


class Book
{
public:
    Book(QString, QString);
    QString getAuthor() const;
    QString getTitle() const;

private:
    QString author;
    QString title;
};

#endif // BOOK_H
