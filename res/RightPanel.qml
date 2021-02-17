import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


Frame {
  id: panel

  signal clicked(string btn);
  signal lightSwitched(bool on)

  GridLayout {
    anchors.fill: parent
    rows: 3

    flow: GridLayout.TopToBottom

    SideButton {
      onClicked: panel.clicked("light")
      iconDir: "imgs/Button/Light"
      checkable: true
      onToggled: lightSwitched(checked)
    }
    SideButton {
      onClicked: panel.clicked("timer")
      iconDir: "imgs/Button/Nav/Timer"
    }
    SideButton {
      onClicked: panel.clicked("settings")
      iconDir: "imgs/Button/Nav/Settings"
    }
    SideButton {
      onClicked: panel.clicked("bluetooth")
      iconDir: "imgs/Button/Bluetooth"
    }
    SideButton {
      onClicked: panel.clicked("wifi")
      iconDir: "imgs/Button/WiFi"
    }
  }

}
