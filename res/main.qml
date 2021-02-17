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

      onClicked: {
//        const leftPanelScreens = {
//          LeftPanel.BUTTON.CookBook: cookBook,
//          LeftPanel.BUTTON.Oven: manualSetting
//        }
        var leftPanelScreens = {};
        leftPanelScreens[leftPanel.btn_CookBook] = cookBook;
        leftPanelScreens[leftPanel.btn_Oven] = manualSetting;

        if(btn in leftPanelScreens) {
          swipeView.currentIndex = leftPanelScreens[btn].SwipeView.index;
        } else if(btn == leftPanel.btn_Power) {
          manualSetting.time = "0001";
          swipeView.currentIndex = manualSetting.SwipeView.index;
        }
      }

      heaterReady: [manualSetting, running].includes(swipeView.currentItem)
      onPowerToggled: {
        if(on) {
          heater.target = manualSetting.tmpr;
          running.time = manualSetting.timeDuration;
          swipeView.currentIndex = running.SwipeView.index;

        } else {
          swipeView.currentIndex = manualSetting.SwipeView.index;
        }
        heater.running = on;
      }
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

      SwipeView {
        id: swipeView
        anchors.fill: parent
        clip: true

        currentIndex: defaultScreen.SwipeView.index

        DefaultScreen {
          id: defaultScreen
        }
        CookBook {
          id: cookBook
          onRecipeSelected: {
            manualSetting.time = time;
            manualSetting.tmpr = tmpr;
            swipeView.currentIndex = manualSetting.SwipeView.index;
          }
        }
        ManualSetting {
          id: manualSetting
        }
        Running {
          id: running
          tmpr: heater.tmpr
        }
      }
    }

    RightPanel {
      id: rightPanel
      Layout.preferredWidth: parent.width / 4.5
      Layout.fillHeight: true

      onLightSwitched: running.light = on;
    }

  }

}
