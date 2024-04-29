import QtQuick         2.15
import QtQuick.Layouts 1.15

import SddmComponents  2.0 as SDDM

ColumnLayout {
    id: formContainer

    SDDM.TextConstants {
        id: textConstants
    }

    property bool virtualKeyboardActive

    property int    p: config.ScreenPadding
    property string a: config.FormPosition

    property alias systemButtonVisibility: systemButtons.visible
    property alias clockVisibility:        clock.visible

    Clock {
        id: clock

        Layout.alignment:       Qt.AlignHCenter | Qt.AlignBottom
        Layout.preferredHeight: root.height / 3
        Layout.leftMargin:      p != "0" ? a == "left" ? -p : a == "right" ? p : 0 : 0
    }

    Input {
        id: input

        Layout.alignment:       Qt.AlignVCenter
        Layout.preferredHeight: root.height / 10
        Layout.leftMargin:      p != "0" ? a == "left" ? -p : a == "right" ? p : 0 : 0
        Layout.topMargin:       virtualKeyboardActive ? -height * 1.5 : 0
    }

    SystemButtons {
        id: systemButtons

        Layout.alignment:       Qt.AlignHCenter | Qt.AlignBottom
        Layout.preferredHeight: root.height / 4
        Layout.maximumHeight:   root.height / 4
        Layout.leftMargin:      p != "0" ? a == "left" ? -p : a == "right" ? p : 0 : 0

        exposedSession: input.exposeSession
    }
}
