import 'package:flutter/material.dart';


class StudentDetail extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Students();
  }
}

class Students extends State<StudentDetail> {

  static var _status = {"successed", "failed"};

  TextEditingController studentName = new TextEditingController();
  TextEditingController studentDetail = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Student"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                items: _status.map((String dropDownItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownItem,
                    child: Text(dropDownItem),
                  );
                }).toList(),
                style: textStyle,
                value: 'successed',
                onChanged: (selectedItem) {
                  setState(() {
                    debugPrint("User Select $selectedItem");
                  });
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: studentName,
                style: textStyle,
                onChanged: (value) {
                  debugPrint("User Edit the Name");
                },
                decoration: InputDecoration(
                    labelText: "Name :",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: studentDetail,
                style: textStyle,
                onChanged: (value) {
                  debugPrint("User Edit the Description");
                },
                decoration: InputDecoration(
                    labelText: "Description :",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row (
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                         color: Theme.of(context).primaryColorDark,
                         textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'SAVE', textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                           setState(() {
                             debugPrint("User Click SAVED");
                           });
                        },
                    ),

                  ),

                  Container(width: 5.0,),
                  
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Delete', textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint("User Click Delete");
                        });
                      },
                    ),

                  ),
                ],


              )
              ,


            )


          ],
        ),
      ),


    );
  }
}