import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3


Page {
  id: runninScreen

  signal done()

//  onDone: {
//    heater.running = false;
//    runningSwipeView.currentIndex = 1;
//  }
  Component.onCompleted: {
    done.connect( function () {
      runningSwipeView.currentIndex = 1;
      heater.running = false;
    });
  }

  property int tmpr: 0
  property real time: 0
  property real totalTime: 0

  function start() {
    time = totalTime;
    timer.running = true;
  }

  SwipeView {
    id: swipeView
    anchors.fill: parent


    SwipeView {
      id: runningSwipeView

      Pane {

        GridLayout {

          anchors.fill: parent
          anchors.margins: 50

          columns: 2

          Label {
            id: temprLabel
            Layout.alignment: Qt.AlignLeft
            text: tmpr + "\u2109"

          }
          Label {
            id: timerLabel
            Layout.alignment: Qt.AlignRight

            readonly property int totalMinutes: Math.ceil(time / 60.0)
            readonly property int minutes: totalMinutes % 60
            readonly property int hours: totalMinutes / 60
            text: (hours < 10 ? "0" : "") + hours + ":" + (minutes < 10 ? "0" : "") + minutes;
          }
          ProgressBar {
            id: progress
            Layout.columnSpan: 2
            Layout.fillWidth: true
//            value: time / totalTime
            value: oven.progress
          }
        }
      }

      Label {
        id: doneLabel
        text: "Done!\nEnjoy Your Meal!"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        font.pixelSize: height / 4
      }
    }
    Timer {
      id: timer
      interval: 1000
      onTriggered: {
        var remain = runninScreen.time - cfg_MOCK_TIME_FACTOR * interval / 1000;
        if(remain <= 1) {
          runninScreen.time = 0;
          runninScreen.done();
          timer.running = false;
        } else {
          runninScreen.time = remain;
        }
      }
    }

    CameraPreview {
      id: cameraPreview

    }
  }

  footer: ToolBar {
    RowLayout {
      anchors.fill: parent
      SideButton {
        text: qsTr("Discard")
        Layout.alignment: Qt.AlignLeft
        Layout.fillWidth: false
        onClicked: swipeView.currentIndex = 0
        visible: cameraPreview == swipeView.currentItem
      }
      SideButton {
        text: qsTr("Save")
        Layout.alignment: Qt.AlignRight
        Layout.fillWidth: false
        onClicked: cameraPreview.takePhoto()
        visible: cameraPreview == swipeView.currentItem
      }
      SideButton {
        iconDir: "imgs/Button/Camera"
        Layout.alignment: Qt.AlignRight
        Layout.fillWidth: false
        onClicked: swipeView.currentIndex = 1
      }
    }
  }

}
