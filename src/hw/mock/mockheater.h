#pragma once

#include <QObject>
#include <QSettings>

#include "hw/heateriface.h"

class QPropertyAnimation;

class MockHeater : public HeaterIFace
{
  Q_PROPERTY(qreal tmpr READ tmpr WRITE setTmpr NOTIFY tmprChanged)
  Q_PROPERTY(qreal target READ target WRITE setTarget NOTIFY targetChanged)
  Q_PROPERTY(bool running READ isRunning WRITE setRunning NOTIFY runningChanged)
  Q_OBJECT
public:
  explicit MockHeater(QSettings &settings, QObject *parent = nullptr);

  qreal tmpr() const;
  void setTmpr(const qreal &atmpr);

  bool isRunning() const;
  void setRunning(bool arunning);

  qreal target() const;
  void setTarget(const qreal &atarget);

signals:
  void tmprChanged(qreal atmpr);
  void targetChanged(qreal atarget);
  void runningChanged(bool arunning);

protected:
  void animHeater();

private:
  const qreal _MIN_DIFF;
  const qreal _ROOM_TMPR;
  qreal _tmpr;
  qreal _target;
  bool _running;

  QPropertyAnimation *_heatAnim, *_coolAnim;

};
