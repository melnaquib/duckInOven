#include "mockheater.h"
#include "vendor.h"
#include <QPropertyAnimation>
#include <QSettings>
#include <QDebug>

MockHeater::MockHeater(QSettings &settings, QObject *parent) : HeaterIFace(parent),
  _MIN_DIFF(settings.value("MocHeater/minDiff").toFloat()),
  _ROOM_TMPR(settings.value("roomTmpr").toFloat()),
  _tmpr(_ROOM_TMPR), _target(_ROOM_TMPR),
  _running(false),
  _heatAnim(new QPropertyAnimation(this, "tmpr", this)),
  _coolAnim(new QPropertyAnimation(this, "tmpr", this)) {

  QSettings defaultSettings(":/settings/defaultSettings.ini", QSettings::IniFormat);

  const qreal TIME_FACTOR = settings.value("MocHeater/timeFactor").toInt();
  _heatAnim->setDuration(600000 / TIME_FACTOR);
  _heatAnim->setEasingCurve(QEasingCurve::OutBounce);
  _coolAnim->setDuration(1200000 / TIME_FACTOR);
  _coolAnim->setEasingCurve(QEasingCurve::InQuad);

//  setTarget(350);

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
  qreal toTmpr = isRunning() ? target() : _ROOM_TMPR;
  if(qAbs(tmpr() - toTmpr) < _MIN_DIFF)
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
