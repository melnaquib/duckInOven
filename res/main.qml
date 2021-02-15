import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3


ApplicationWindow {
  id: window
  width: 1920
  height: 550
  visible: true
  title: qsTr("Duck In Oven")

  RowLayout {
    anchors.fill: parent

    spacing: 0

    LeftPanel {
      id: leftPanel
      Layout.preferredWidth: parent.width / 4.5
      Layout.fillHeight: true
    }

    Page {
      id: mainScreen

      Layout.fillWidth: true
      Layout.fillHeight: true

      Material.background: "#2f2f2f"

      header: ToolBar {
        height: 100

        padding: height/8

        RowLayout {
          anchors.fill: parent

          Label {
            id: statusLabel
            text: qsTr("Status Text")
          }

          TimeWidget {
            id: timerWidget
            Layout.alignment: Qt.AlignRight
          }
        }
      }

      footer: ToolBar {
        height: 100
      }

      StackView {
        id: swipeView
        anchors.fill: parent
        clip: true

        initialItem: manualSetting

        DefaultScreen {
          id: defaultScreen
        }
        CookBook {
          id: cookBook
          anchors.fill: parent
        }
        ManualBake {
          id: manualBake
        }
        ManualSetting {
          id: manualSetting
        }
        Running {
          id: running

          timer: "01:23"
          tempr: "425F"
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
