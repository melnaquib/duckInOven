import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


Label {

  property date time
  text: Qt.formatDate(time, "dddd, MMMM dd")
  font.pixelSize: 50

  Timer {

    interval: 1000
    running: true
    onTriggered: time = new Date()
  }
}
