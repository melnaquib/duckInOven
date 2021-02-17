import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

Page {

  property alias tmpr: manualTemperature.tmpr
  property alias time: manualTimer.typed
  property alias timeDuration: manualTimer.duration

  Material.foreground: "#71e51a"
  Material.accent: "#71e51a"

  header: TabBar {
    id: tabBar
    height: implicitHeight

    background: Rectangle {
      color: "#393939"
      anchors.fill: parent
    }

    currentIndex: view.currentIndex

    TabButton {
      text: qsTr("Temperature")
      width: implicitWidth

      Material.foreground: TabBar. index == tabBar.currentIndex ? "#71e51a" : "#dadada"

    }
    TabButton {
      text: qsTr("Timer")
      width: implicitWidth
      Material.foreground: TabBar. index == tabBar.currentIndex ? "#71e51a" : "#dadada"
    }
  }

  SwipeView {
    id: view
    anchors.fill: parent
    clip: true
    spacing: 10

    currentIndex: tabBar.currentIndex

    ManualTemperature { id: manualTemperature }
    ManualTimer { id: manualTimer }

  }
}
