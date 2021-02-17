#ifndef MOCKCAMERA_H
#define MOCKCAMERA_H

#include <QObject>

class MockCamera : public QObject
{
  Q_OBJECT
public:
  explicit MockCamera(QObject *parent = nullptr);

signals:

};

#endif // MOCKCAMERA_H
