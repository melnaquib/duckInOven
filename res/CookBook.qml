import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.XmlListModel 2.12

Page {

  readonly property var recipeEmpty: ({"name": "", "tmpr": 0, "time": "", "description": ""})
  property var recipe: recipeEmpty

  signal recipeSelected(real tmpr, string time)

  onVisibleChanged: {
    swipeView.currentIndex = 0;
    recipe = recipeEmpty;
  }

  SwipeView {
    id: swipeView
    anchors.fill: parent

    ScrollView {

      clip: true

      spacing: 10

      GridView {
        anchors.fill: parent

        model: XmlListModel {
          source: "test/CookBook.xml"
          query: "/CookBook/Recipe"

          XmlRole { name: "name"; query: "@name/string()" }
          XmlRole { name: "tmpr"; query: "@tmpr/number()" }
          XmlRole { name: "time"; query: "@time/string()" }
          XmlRole { name: "description"; query: "string()" }
        }

        delegate: RoundButton {
          text: name
          radius: height / 4
          onClicked: {
            recipe = model;
            swipeView.currentIndex = 1;
          }
        }
      }
    }

    Button {
      id: recipeLabel
      text: recipe.description
      onClicked: recipeSelected(recipe.tmpr, recipe.time)

    }
  }


}
