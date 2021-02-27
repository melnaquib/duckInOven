import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import TickSlider 1.0


Page {

  property alias tmpr: tmprSlider.value

  Material.background: "#2f2f2f"

  TickSlider {
    id: tmprSlider
    anchors.centerIn: parent
    anchors.fill: parent

    value: 450

    from: 350
    to: 500
    stepSize: 5
    bigTick: 5
    unit: "\u2109"
  }
}
