#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QTimer>
#include <QDebug>
#include "vendor.h"
#include "hw/mock/mockheater.h"
#include "hw/oven.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

  QGuiApplication app(argc, argv);
  app.setOrganizationName(ORG_NAME);
  app.setApplicationName(APP_NAME);
  app.setApplicationDisplayName(APP_DISPLAY_NAME);

  QSettings defaultSettings(":/settings/defaultSettings.ini", QSettings::IniFormat);

  qmlRegisterType<Oven>("com.ics.DuckInOven.Oven", 1, 0, "Oven");

  QQmlApplicationEngine engine;

  engine.addImportPath("qrc:/");

  engine.rootContext()->
      setContextProperty("cfg_MOCK_TIME_FACTOR", defaultSettings.value("MockHeater/timeFactor").toInt());

  auto oven = new Oven(&app);

  auto heater = new MockHeater(defaultSettings, oven);
  engine.rootContext()->setContextProperty("heater", heater);

  oven->setHeater(heater);
  oven->setTimer(new QTimer(oven));
  engine.rootContext()->setContextProperty("oven", oven);

  const QUrl url(QStringLiteral("qrc:/main.qml"));
//  const QUrl url(QStringLiteral("../duckInOven/res/main.qml"));
  QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                   &app, [url](QObject *obj, const QUrl &objUrl) {
    if (!obj && url == objUrl)
      QCoreApplication::exit(-1);
  }, Qt::QueuedConnection);
  engine.load(url);

  QSettings settings;

  return app.exec();
}
