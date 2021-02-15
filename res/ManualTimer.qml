import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

Page {

  Material.background: "#2f2f2f"

  property string typed: "0000"
  property int duration: parseInt(typed.slice(0, 2)) * 60 + parseInt(typed.slice(-2))

  function pushDigit(digit) {
    typed = typed.slice (1, 4) + digit;
    console.log(typed);
  }

  ColumnLayout {
    anchors.fill: parent
    Label {
      Layout.alignment: Qt.AlignHCenter
      font.pixelSize: 100
      text: typed.slice(0, 2) + ":" + typed.slice(-2)
    }

    GridLayout {
      Layout.alignment: Qt.AlignHCenter

      Material.foreground: "#dadada"
      columns: 5
      Repeater {
        model: 10
        delegate: RoundButton {
          property int val: (index + 1) % 10
          text: val
          onClicked: pushDigit(text)
        }
      }
    }
  }
  onVisibleChanged: {

  }
}
