#ifndef NAVIGATOR_H
#define NAVIGATOR_H

#include <QObject>

class Navigator : public QObject
{
  Q_OBJECT
public:
  explicit Navigator(QObject *parent = nullptr);

signals:

};

#endif // NAVIGATOR_H
