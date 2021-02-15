import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Page {
  ScrollView {
    anchors.fill: parent

    clip: true

    spacing: 10

    GridView {
      anchors.fill: parent

      model: 10

      delegate: RoundButton {
        text: "Duck " + index
        radius: height / 4
      }
    }
  }
}
