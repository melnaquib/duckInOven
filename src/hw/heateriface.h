#pragma once

#include <QObject>
#include <QSettings>

class QPropertyAnimation;

class HeaterIFace : public QObject
{
  Q_OBJECT

  Q_PROPERTY(qreal tmpr READ tmpr WRITE setTmpr NOTIFY tmprChanged)
  Q_PROPERTY(qreal target READ target WRITE setTarget NOTIFY targetChanged)
  Q_PROPERTY(bool running READ isRunning WRITE setRunning NOTIFY runningChanged)

public:
  explicit HeaterIFace(QObject *parent = nullptr);

  virtual qreal tmpr() const = 0;
  virtual void setTmpr(const qreal &atmpr) = 0;

  virtual bool isRunning() const = 0;
  virtual void setRunning(bool arunning) = 0;

  virtual qreal target() const = 0;
  virtual void setTarget(const qreal &atarget) = 0;

signals:
  void tmprChanged(qreal atmpr);
  void targetChanged(qreal atarget);
  void runningChanged(bool arunning);

protected:

private:

};
