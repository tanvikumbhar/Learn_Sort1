
import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
Window {
    id:window
    width: 600
    height: 600
    visible: true
    Rectangle {
        id:rect2
        anchors.fill:parent
        //        width: 800
        //        height: 800
        color: "#474747"
        ListModel {
            id:model

            ListElement {
                number:8
            }
            ListElement {
                number:7
            }
            ListElement {
                number:5
            }
            ListElement {
                number:6
            }

            ListElement {
                number:3
            }
            ListElement {
                number:9
            }
            ListElement {
                number:1
            }
            ListElement {
                number:2
            }
        }

        ListView {
            id:list
            anchors.centerIn: parent
            width: parent.width; height: 30
            model:model
            orientation:ListView.Horizontal
            interactive: false

            delegate:
                Rectangle {
                x:200

                width:50; height:35
                border.width: 1
                color: "#f4c2c2"
                Text {
                    anchors.centerIn: parent
                    text: number
                }
                objectName: number
            }

            move: Transition {
                id: moveTrans
                SequentialAnimation {
                    ColorAnimation { property: "color"; to: "yellow"; duration: 800 }
                    NumberAnimation { properties: "x,y"; duration: 800; easing.type: Easing.OutBack }
                    ScriptAction { script: moveTrans.ViewTransition.item.color = "lightsteelblue" }
                }
            }

            displaced: Transition {
                NumberAnimation { properties: "x,y"; duration: 800; easing.type: Easing.OutBounce }
            }
            focus: true

            Keys.onSpacePressed:{


                var j=list.currentIndex
                var min=model.get(j).number
                for(var i=j+1;i<count;i++)
                {
                    if(min>model.get(i).number)
                    {
                        min=model.get(i).number;
                        var s=i;
                    }

                }
                if(min==7)
                {
                    end.visible=true;
                    space.visible=false;
                }
                model.move(s,j,1);

                console.log("min is ",min,s);


                //                incrementCurrentIndex();






            }

        }
        Text {
            id: space
            text: qsTr("Press key space to start!!!");
            x:150
            y:350
            font.bold: true
            color: "#f4c2c2"

        }
        Text {
            id:end
            x:150
            y:360
            text: qsTr("Selection sort completed")
            visible: false
            color:"#f4c2c2"
            font.pointSize: 30

        }


    }
}

