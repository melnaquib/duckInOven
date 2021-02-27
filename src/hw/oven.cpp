#include "oven.h"

Oven::Oven(QObject *parent) : QObject(parent),
  _form(FORM_DEFAULT), _timer(new QTimer(this)), _lamp(false), _progress(0),
  _progressAnim(new QPropertyAnimation(this, "elapsed", this)),
  _TIME_FACTOR(
    QSettings(":/settings/defaultSettings.ini",
              QSettings::IniFormat).value(
      "MocHeater/timeFactor").toInt()) {

  _progressAnim->setStartValue(0);
  _progressAnim->setEndValue(100);

  connect(_progressAnim, &QAbstractAnimation::stateChanged,
          [this](QAbstractAnimation::State newState, QAbstractAnimation::State oldState) {
    heater()->setRunning(QAbstractAnimation::Running == newState);
  });

  setDuration(30000);
}

HeaterIFace *Oven::heater() const
{
  return _heater;
}

void Oven::setHeater(HeaterIFace *heater)
{
  _heater = heater;
}

QTimer *Oven::timer() const
{
  return _timer;
}

void Oven::setTimer(QTimer *timer)
{
  _timer = timer;
}

Oven::Form Oven::form() const
{
  return _form;
}

void Oven::setForm(Form aform)
{
  if(_form == aform)
    return;
  _form = aform;
  emit formChanged(_form);
}

void Oven::onPowerBtnToggled(bool checked) {
  if(checked) {
    _progressAnim->start();
    setForm(FORM_RUNNING);
  } else {
    _progressAnim->stop();
    setForm(FORM_MANUAL_SETTING);
  }
}

void Oven::onPowerBtnCLicked() {
  setForm(FORM_MANUAL_SETTING);
}

void Oven::onCookBookBtnCLicked() {
  setForm(FORM_COOK_BOOK);
}

int Oven::duration() const
{
  return _progressAnim->duration() * _TIME_FACTOR;
}

void Oven::setDuration(const int &aduration)
{
  _progressAnim->setDuration(aduration / _TIME_FACTOR);
}

int Oven::progress() const
{
  return _progress;
}

void Oven::setProgress(const int &aprogress)
{
  if(aprogress == _progress)
    return;
  _progress = aprogress;
  emit progressChanged(_progress);
}

bool Oven::isLamp() const
{
  return _lamp;
}

void Oven::setLamp(bool alamp)
{
  if(_lamp == alamp)
    return;
  _lamp = alamp;
  emit lampChanged(_lamp);
}
