import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../../Util.js" as UtilScript

Pane {
    id: filterTextField

    background: Rectangle {
        color:        UIHelper.darkTheme ? "lightgray" : "white"
        radius:       UtilScript.dp(UIHelper.screenDpi, 8)
        border.width: UtilScript.dp(UIHelper.screenDpi, 1)
        border.color: "steelblue"
    }

    readonly property string filterText: textField.displayText

    property string placeholderText:     ""

    RowLayout {
        anchors.fill: parent
        spacing:      UtilScript.dp(UIHelper.screenDpi, 2)

        TextField {
            id:               textField
            placeholderText:  filterTextField.placeholderText
            font.pixelSize:   UtilScript.dp(UIHelper.screenDpi, 20)
            font.family:      "Helvetica"
            inputMethodHints: Qt.ImhNoPredictiveText
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter

            background: Rectangle {
                color: "transparent"
            }

            onEditingFinished: {
                focus = false;

                filterTextField.forceActiveFocus();
            }
        }

        Rectangle {
            implicitWidth:    textField.implicitHeight
            implicitHeight:   textField.implicitHeight
            color:            "transparent"
            visible:          textField.displayText !== ""
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Image {
                anchors.fill: parent
                source:       "qrc:/resources/images/misc/button_clear.png"
                fillMode:     Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        textField.focus = false;

                        filterTextField.forceActiveFocus();

                        textField.clear();
                    }
                }
            }
        }
    }
}
