import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
Window {
    id:window
    visible: true
    width: 600
    height: 600
    title: qsTr("Hello World")

    Rectangle {
        id:rect2
        anchors.fill:parent
        //        width: 800
        //        height: 800
        color: "#474747"
        ListModel {
            id:model

            ListElement {
                number:10
            }
            ListElement {
                number:6
            }
            ListElement {
                number:5
            }
            ListElement {
                number:7
            }

            ListElement {
                number:9
            }
            ListElement {
                number:3
            }
            ListElement {
                number:2
            }
            ListElement {
                number:1
            }
        }

        ListView {
            id:list
            width: parent.width; height: 30
            model:model

            orientation:ListView.Horizontal
            interactive: false
            anchors.centerIn: rect2

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
                    ColorAnimation { property: "color"; to: "yellow"; duration: 100 }
                    NumberAnimation { properties: "x,y"; duration: 200; easing.type: Easing.OutBack }
                    ScriptAction { script: moveTrans.ViewTransition.item.color = "lightsteelblue" }
                }
            }

            displaced: Transition {
                NumberAnimation { properties: "x,y"; duration: 200; easing.type: Easing.OutBounce }
            }
            focus: true
            Keys.onSpacePressed:{

                var j=list.currentIndex+1;
//                j=j+1;

                console.log("j at start",j);
                for(var p=0 ;p<j;p++)
                {
                    console.log("entered in the loop");
                    if(model.get(j).number<model.get(p).number)
                    {

                        model.move(j,p,1);
                        console.log("swapping");
                        console.log("j at middle",j)

                    }

                }


//                j++;
//                console.log("j at end",j);


























            }
        }






    }


}


