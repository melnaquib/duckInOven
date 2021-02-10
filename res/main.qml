import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


ApplicationWindow {
  id: window
  width: 1920
  height: 550
  visible: true
  title: qsTr("Duck In Oven")

  RowLayout {
    anchors.fill: parent

    LeftPanel {
      id: leftPanel
      Layout.preferredWidth: parent.width / 4.5
      Layout.fillHeight: true
    }
    Page {
      id: mainScreen

      Layout.fillWidth: true
      Layout.fillHeight: true

      header: Frame {
        height: mainScreen.height / 5.5
        RowLayout {
          anchors.fill: parent

          Label {
            id: statusLabel
          }

          TimeWidget {
            id: timerWidget
            Layout.alignment: Qt.AlignRight
          }
        }
      }

      footer: Frame {
        height: mainScreen.height / 5.5
      }

      SwipeView {
        id: swipeView

        DefaultScreen {
          id: defaultScreen
        }
        CookBook {
          id: cookBook
        }
        ManualBake {
          id: manualBake
        }
        ManualTemperature {
          id: manualTemperature
        }
        ManualTimer {
          id: manualTimer
        }
        Running {
          id: running
        }
        CameraPreview {
          id: cameraPreview
        }
      }
    }

    RightPanel {
      id: rightPanel
      Layout.preferredWidth: parent.width / 4.5
      Layout.fillHeight: true
    }

  }

}
