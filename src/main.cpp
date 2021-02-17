#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "config.h"
#include "hw/mock/mockheater.h"

int main(int argc, char *argv[])
{
  qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

  engine.rootContext()->setContextProperty("cfg_MOCK_TIME_FACTOR", CFG_MOCK_TIME_FACTOR);

  auto heater = new MockHeater(&app);
  engine.rootContext()->setContextProperty("heater", heater);

//  const QUrl url(QStringLiteral("qrc:/main.qml"));
  const QUrl url(QStringLiteral("../duckInOven/res/main.qml"));
  QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                   &app, [url](QObject *obj, const QUrl &objUrl) {
    if (!obj && url == objUrl)
      QCoreApplication::exit(-1);
  }, Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
