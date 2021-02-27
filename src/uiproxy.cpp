#include "uiproxy.h"

UiProxy::UiProxy(QObject *parent) : QObject(parent),
  _form(FORM_DEFAULT)
{

}

UiProxy::Form UiProxy::form() const
{
  return _form;
}

void UiProxy::setForm(const UiProxy::Form &aform) {
  if(_form == aform)
    return;
  _form = aform;
  emit formChanged(aform);
}

void UiProxy::onPowerBtnToggled(bool checked) {

}

void UiProxy::onPowerBtnCLicked() {

}

void UiProxy::onCookBookBtnCLicked() {

}

void UiProxy::onLightBtnToggled(bool checked) {

}
