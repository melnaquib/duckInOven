#include "mockheater.h"
#include "config.h"
#include <QPropertyAnimation>
#include <QDebug>

MockHeater::MockHeater(QObject *parent) : QObject(parent),
  _tmpr(CFG_ROOM_TMPR),
  _target(CFG_ROOM_TMPR),
  _running(false),
  _heatAnim(new QPropertyAnimation(this, "tmpr", this)),
  _coolAnim(new QPropertyAnimation(this, "tmpr", this)) {
  _heatAnim->setDuration(600000 / CFG_MOCK_TIME_FACTOR);
  _heatAnim->setEasingCurve(QEasingCurve::OutBounce);
  _coolAnim->setDuration(1200000 / CFG_MOCK_TIME_FACTOR);
  _coolAnim->setEasingCurve(QEasingCurve::InQuad);
}

qreal MockHeater::tmpr() const {
  return _tmpr;
}

void MockHeater::setTmpr(const qreal &atmpr) {
  if(_tmpr == atmpr)
    return;
  _tmpr = atmpr;
  tmprChanged(_tmpr);
//  qDebug() << "HEATER TMPR" << tmpr();
}

bool MockHeater::isRunning() const {
  return _running;
}

void MockHeater::setRunning(bool arunning) {
  if(isRunning() == arunning)
    return;
  qDebug() << "Turn Mock Heater " << (arunning ? "ON" : "OFF");
  _running = arunning;
  emit runningChanged(arunning);
  animHeater();
}

void MockHeater::animHeater() {
  qreal toTmpr = isRunning() ? target() : CFG_ROOM_TMPR;
  if(qAbs(tmpr() - toTmpr) < CFG_MOCK_HEAT_MIN_DIFF)
    return;
  if(toTmpr > tmpr()) {
    _coolAnim->stop();
    _heatAnim->setStartValue(tmpr());
    _heatAnim->setEndValue(toTmpr);
    _heatAnim->start();
  } else {
    _heatAnim->stop();
    _coolAnim->setStartValue(tmpr());
    _coolAnim->setEndValue(toTmpr);
    _coolAnim->start();
  }
}

qreal MockHeater::target() const {
  return _target;
}

void MockHeater::setTarget(const qreal &atarget)
{
  if(_target == atarget)
    return;
  _target = atarget;
  emit targetChanged(_target);
}
