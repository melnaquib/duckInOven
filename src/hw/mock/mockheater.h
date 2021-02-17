#ifndef MOCKHEATER_H
#define MOCKHEATER_H

#include <QObject>

class QPropertyAnimation;

class MockHeater : public QObject
{
  Q_PROPERTY(qreal tmpr READ tmpr WRITE setTmpr NOTIFY tmprChanged)
  Q_PROPERTY(qreal target READ target WRITE setTarget NOTIFY targetChanged)
  Q_PROPERTY(bool running READ isRunning WRITE setRunning NOTIFY runningChanged)
  Q_OBJECT
public:
  explicit MockHeater(QObject *parent = nullptr);

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
  qreal _tmpr;
  qreal _target;
  bool _running;
  QPropertyAnimation *_heatAnim, *_coolAnim;

};

#endif // MOCKHEATER_H
