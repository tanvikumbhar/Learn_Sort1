# Learn_Sort1
Objective of this project is to provide a new way for learning Sorting Type with the interactive features to the Qt framework. 
////////////////////////////////////////////////////////////////////////////////////////////
1Selection sort using QML

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

//////////////////////////////////////////////////////////////////////////////////////////
2.Bubble Sort
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
///////////////////////////////////////////////////////////////////////////////////////////////////
3.Insertion SOrt

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


