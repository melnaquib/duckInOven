import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Shapes 1.12


Item {
  property int orientation: Qt.Horizontal

  property real thickness: 1
  property real interval: 10

  property int skip: 0

  property alias color: shapePath.strokeColor

  clip: true

  Shape {

    id: shape

    anchors.verticalCenter: parent.verticalCenter
    width: parent.width

    //TODO, implement vertical, reverse


    transform: [
      Scale { yScale: slider.availableHeight}
    ]

    ShapePath {
      id: shapePath
      strokeStyle: ShapePath.DashLine
      dashPattern: [thickness, interval - thickness]

      PathLine {
        x: shape.width
      }
    }
  }
}
