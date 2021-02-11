import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

Button {
  id: button

  readonly property string _iconState: enabled ?
                          (checked ?
                             "Triggered" :
                             pressed ? "Pressed" : "Default") :
                          "Disabled"

  property string iconDir

//  icon.source: iconDir + "/" + _iconState + " State.png"
//  icon.width: button.width / 2
//  icon.height: button.width / 2

  Layout.fillHeight: true
  Layout.fillWidth: true

  flat: true

  background: Image {
    id: name
    source: iconDir + "/" + button._iconState + " State.png"
    fillMode: Image.PreserveAspectFit
    width: button.width / 2
    height: width
    anchors.centerIn: button
  }

}
