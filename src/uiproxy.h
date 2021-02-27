#ifndef UIPROXY_H
#define UIPROXY_H

#include <QObject>

class UiProxy : public QObject
{


  Q_PROPERTY(Form form READ form WRITE setForm NOTIFY formChanged)

  Q_OBJECT
public:

  enum Form {
    FORM_DEFAULT,
    FORM_COOK_BOOK,
    FORM_MANUAL_SETTING,
    FORM_RUNNING,
    FORM_CAMERA
  };
  Q_ENUMS(Form)

  explicit UiProxy(QObject *parent = nullptr);


  Form form() const;
  void setForm(const Form &form);

public slots:
  void onPowerBtnToggled(bool checked);
  void onPowerBtnCLicked();
  void onCookBookBtnCLicked();
  void onLightBtnToggled(bool checked);



signals:
  void formChanged(Form aform);

private:
  Form _form;

};

#endif // UIPROXY_H
