import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


Frame {

  GridLayout {
    anchors.fill: parent
    rows: 3

    flow: GridLayout.TopToBottom

    SideButton {
      id: powerButton
      Layout.rowSpan: 3
      iconDir: "imgs/Button/Power"
    }
    SideButton {
      iconDir: "imgs/Button/Nav/Oven"
    }
    SideButton {
      iconDir: "imgs/Button/Nav/CookBook"
    }
    SideButton {
      iconDir: "imgs/Button/Nav/More"
    }
  }

}
