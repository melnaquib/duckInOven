import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

Page {

  Material.background: "#2f2f2f"

  property string typed: "0000"
  property int typeIndex: 3
  onTypeIndexChanged: typeIndex %= typed.length
  readonly property int duration: 60 *( parseInt(typed.slice(-2)) +
                                       parseInt(typed.slice(0, 2)) * 60 )

  function pushDigit(digit) {
    typed = typed.slice(0, typeIndex) +
        digit + typed.slice(typeIndex - typed.length);
    console.log(typed);
    typeIndex = (typeIndex ? typeIndex : typed.length) - 1;
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
