import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

Pane {

  property bool light: false

  Image {
    id: img
    source: "imgs/CameraPreview.png"
    anchors.fill: parent
    layer.enabled: light
//    layer.effect: ColorOverlay {
//      color: "#80800000"
//    }
//    layer.effect: ColorOverlay {
//      color: "#80800000"
//    }
    layer.effect: GammaAdjust {
      gamma: 4
    }
  }

  Rectangle {
    id: flash
    anchors.fill: parent
    color: "#f0f0f0"
    opacity: 0.0

    SequentialAnimation on opacity {
      id: flashAnim

      NumberAnimation {
        duration: 100
        to: 1;
      }
      NumberAnimation {
        duration: 100
        to: 0;
      }
    }
  }

  function takePhoto() {
    flashAnim.start();
  }

}
