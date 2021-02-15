import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3


Page {

  property alias tempr: temprLabel.text
  property alias timer: timer.text

  padding: 50

  GridLayout {
    anchors.fill: parent
    columns: 2

    Label {
      id: temprLabel
      Layout.alignment: Qt.Left
    }
    Label {
      id: timer
      Layout.alignment: Qt.Right
    }
    ProgressBar {
      id: progress
      Layout.columnSpan: 2
    }
  }

}
