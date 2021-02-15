import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


Page {
  ColumnLayout {

    TimeWidget {
      Layout.fillHeight: true
      Layout.alignment: Qt.AlignHCenter
      font.pixelSize: 150
    }
    DateWidget {
      Layout.fillHeight: true
      Layout.alignment: Qt.AlignHCenter
    }
  }
}
