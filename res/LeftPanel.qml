import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


Frame {
  id: panel

  property bool heaterReady: false
  onHeaterReadyChanged: {
    console.log("READY " + heaterReady);
  }

  signal powerPressed()
  signal powerToggled(bool on)

  readonly property int btn_Power: 0
  readonly property int btn_Oven: 1
  readonly property int btn_CookBook: 2

  signal clicked(int btn);

  GridLayout {
    anchors.fill: parent
    rows: 3

    flow: GridLayout.TopToBottom

    SideButton {
      id: powerBtn
      Layout.rowSpan: 3
      iconDir: "imgs/Button/Power"

      states: [
        State {
          name: "heaterReady"
          when: heaterReady
          PropertyChanges {
            target: powerBtn
            checkable: true
            onClicked: {}
            onCheckedChanged: oven.onPowerBtnToggled(checked)
          }
        }
      ]
//      onClicked: powerPressed(powerBtn.checked);
      onClicked: if(!checkable) oven.onPowerBtnCLicked()


    }
    SideButton {
      onClicked: panel.clicked(btn_Oven)
      iconDir: "imgs/Button/Nav/Oven"
    }
    SideButton {
      onClicked: oven.onCookBookBtnCLicked()
      iconDir: "imgs/Button/Nav/CookBook"
    }
    SideButton {
      onClicked: panel.clicked(BUTTON.More)
      iconDir: "imgs/Button/Nav/More"
    }
  }

}
