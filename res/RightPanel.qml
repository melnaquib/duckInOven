import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


Frame {

  GridLayout {
    anchors.fill: parent
    rows: 3

    flow: GridLayout.TopToBottom

    SideButton {
      iconDir: "imgs/Button/Light"
    }
    SideButton {
      iconDir: "imgs/Button/Nav/Timer"
    }
    SideButton {
      iconDir: "imgs/Button/Nav/Settings"
    }
    SideButton {
      iconDir: "imgs/Button/Bluetooth"
    }
    SideButton {
      iconDir: "imgs/Button/WiFi"
    }
  }

}
