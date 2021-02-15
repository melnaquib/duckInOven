import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Shapes 1.12
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.3

Slider {
  id: slider

  property string unit: ""
  property real interval: to - from
  property real unitWidth: width / interval
  property real stepWidth:  unitWidth * stepSize
  property int bigTick: 0
  property real dashWidth: 1

  background: Control {
    anchors.fill: parent
    ColumnLayout {
      anchors.fill: parent

      Label {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        font.pixelSize: 50
        text: value + "<font color=\"#FF0000\">" + unit +  "</font>"
      }

      Rectangle {
        id: tickTrack
        color: "#393939"
        Layout.preferredHeight: 100
        Layout.fillWidth: true

        layer.enabled: true
        layer.effect: InnerShadow {
          radius: 20
          samples: 5
          color: "#808080"
          verticalOffset: parent.height / 4

          cached: true
          fast: true
        }

        Ticks {
          anchors.fill: parent
          anchors.topMargin: parent.height / 4
          anchors.bottomMargin: parent.height / 4

          color: "#626262"
          interval: stepWidth

          thickness: 2

          skip: 5

        }

        Ticks {
          anchors.fill: parent
          color: "#1a1a1a"
          thickness: 2
          interval: stepWidth * bigTick
          visible: bigTick != 0
        }
      }

      Item {
        Layout.fillWidth: true
        Layout.preferredHeight: 50

        Repeater {
          model : interval / bigTick
          Label {
            property real val: from + index * stepSize * bigTick
            text : val + unit
            Material.foreground: "#dadada"

//            anchors.top: parent.bottom
            anchors.horizontalCenter: parent.left
            anchors.horizontalCenterOffset: index * stepWidth * bigTick
          }
        }
      }


    }



  }

//  handle: Shape {
//    id: handle
//    width: stepWidth * 1.5
//    height: stepWidth
////    anchors.verticalCenter: parent.top
////    anchors.verticalCenter: tickTrack.top
//    y: tickTrack.y - height / 3
//    anchors.horizontalCenter: parent.left
//    anchors.horizontalCenterOffset: (slider.value - from) *
//                                    slider.availableWidth / slider.interval
//    ShapePath {
//      strokeColor: "orange"
//      fillColor: "orange"
//      PathLine { x: handle.width / 2; y: handle.height }
//      PathLine { x: handle.width }
//    }
//  }

  handle: Rectangle {
    color: "#71e51a"
    width: stepWidth * 1
    radius: width / 4
    y: tickTrack.y - tickTrack.height / 10
    height: tickTrack.height * 1.2
        anchors.horizontalCenter: parent.left
        anchors.horizontalCenterOffset: (slider.value - from) *
          slider.availableWidth / slider.interval

  }
}
