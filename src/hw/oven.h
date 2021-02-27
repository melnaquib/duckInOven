#ifndef OVEN_H
#define OVEN_H

#include <QObject>
#include <QTimer>
#include <QPropertyAnimation>
#include "heateriface.h"


class Oven : public QObject
{
  Q_OBJECT

  Q_PROPERTY(Form form READ form WRITE setForm NOTIFY formChanged)
  Q_PROPERTY(bool lamp READ isLamp WRITE setLamp NOTIFY lampChanged)
  Q_PROPERTY(qreal progress READ progress NOTIFY progressChanged)
  Q_PROPERTY(int duration READ duration WRITE setDuration NOTIFY durationChanged)

public:

  enum Form {
    FORM_DEFAULT,
    FORM_COOK_BOOK,
    FORM_MANUAL_SETTING,
    FORM_RUNNING,
    FORM_CAMERA
  };
  Q_ENUMS(Form)

  explicit Oven(QObject *parent = nullptr);

  HeaterIFace *heater() const;
  void setHeater(HeaterIFace *heater);

  QTimer *timer() const;
  void setTimer(QTimer *timer);

  Form form() const;
  void setForm(Form form);

  bool isLamp() const;
  void setLamp(bool lamp);

  int progress() const;
  void setProgress(const int &progress);

  int duration() const;
  void setDuration(const int &aduration);

public slots:
  void onPowerBtnToggled(bool checked);
  void onPowerBtnCLicked();
  void onCookBookBtnCLicked();

signals:
  void formChanged(Form aform);
  void lampChanged(bool alamp);
  void progressChanged(qreal aprogress);
  void durationChanged(int aduration);


private:
  QTimer *_timer;
  HeaterIFace *_heater;
  Form _form;
  bool _lamp;

  unsigned char _progress;
  QPropertyAnimation *_progressAnim;

  const int _TIME_FACTOR;
};

#endif // OVEN_H
