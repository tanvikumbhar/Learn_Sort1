import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
Window {
    id:bubble
    width: 600
    height: 600
    visible: true

    property int textValue: 10
    Rectangle {
        id:rect2
        anchors.fill:parent
        width: 800
        height: 800
        color: "#474747"

        ListModel {
            id:model
            ListElement {
                number:2
            }
            ListElement {
                number:4
            }
            ListElement {
                number:8
            }

            ListElement {
                number:12
            }
            ListElement {
                number:11
            }
            ListElement {
                number:22
            }
            ListElement {
                number:5
            }
        }


        ListView {
            id:list
            width: parent.width; height:30
            orientation:ListView.Horizontal
            interactive: false
            anchors.centerIn: rect2
            focus: true

            delegate:
                Row{
                Rectangle {
                    x:200
                    anchors.bottom:parent.top
                    width:50; height:50
                    border.width: 1
                    color: "#f4c2c2"
                    focus: true
                    Text {
                        anchors.fill: parent
                        id: name
                        text:number
                        font.pointSize: 10
                        color: "black"
                        focus: true

                    }

                }
            }
            model:model


            move: Transition {
                id: moveTrans
                SequentialAnimation {
                    ColorAnimation { property: "color"; to: "yellow"; duration: 300 }
                    NumberAnimation { properties: "x,y"; duration: 300; easing.type: Easing.OutBack }
                    ScriptAction { script: moveTrans.ViewTransition.item.color = "lightsteelblue" }
                }
            }

            displaced: Transition {
                NumberAnimation { properties: "x,y"; duration: 300; easing.type: Easing.OutBounce }
            }
            //            focus: true
            Keys.onSpacePressed:{

                var i=list.currentIndex;
                var x=list.currentItem;
                console.log("value is:",x);

                if (model.get(i).number> model.get(i+1).number)
                {
                    model.move(i,i+1,1);
                    console.log(model.get(i).number, model.get(i+1).number);
                    incrementCurrentIndex();
                    console.log("current index",list.currentIndex);


                    if(list.currentIndex==count-1)
                    {
                        list.currentIndex=0;
                    }

                }
                else{
                    incrementCurrentIndex();
                    console.log("index after incrementation",currentIndex);

                    if(list.currentIndex==count-1)
                    {
                        list.currentIndex=0;
                    }
                }

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
            id: complete
            visible: false
            text: qsTr("Bubble sort is completed!!");
            x:150
            y:350
            font.bold: true
            color: "#f4c2c2"
            font.pointSize: 20
        }
    }


}
