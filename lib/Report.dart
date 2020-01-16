import 'package:flutter/material.dart';

import 'main.dart';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';


import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

String dropdownValue = 'IT';

class ReportPg extends StatefulWidget {
  @override
  ReportPgState createState() => ReportPgState();
}


class ReportPgState extends State<ReportPg> {
  final myControllerDescription = TextEditingController();
  final myControllerSurname = TextEditingController();
  final myController = TextEditingController();
  Position _currentPosition;
  File _image;
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

  //  Future uploadPic(BuildContext context) async{
    //  String fileName = basename(_image.path);
    //  StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    //  StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
   //   StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
     // setState(() {
     //   print("Profile Picture uploaded");
    //    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
   //   });
  //  }
   return new Scaffold(


        body: GridView.count(

          crossAxisCount: 1,

          children: List.generate(1, (index)
          {
            return Center(
                child:
                new Column(
                    children: <Widget>[


                          TextFormField(
                          decoration: InputDecoration(labelText: 'Enter Name'
                            ),
                               controller: myController,


          )
          ,

                      TextFormField(
                        decoration: InputDecoration(labelText: 'Enter Surname'
                        ),
                        controller: myControllerSurname,


                      )
                      ,
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Description'
                        ),
                        controller: myControllerDescription,


                      )
                      ,


                          Row( children: <Widget>[

                            Text('Choose Department:  '),

                            DropdownButton<String>(

                            icon: Icon(Icons.arrow_downward),
                            value: dropdownValue,
                            iconSize: 24,
                            elevation: 20,
                            style:

                            TextStyle(
                                color: Colors.deepPurple
                            ),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;




                              });
                            },
                            items: <String>['IT', 'Maintenance', 'Landscaping']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            })
                                .toList(),
                          )])

                                             ,


                      ButtonTheme(
                          minWidth: 150.0,
                          height: 36.0,
                          child:
                          new RaisedButton.icon(

                            textColor: Colors.white,
                            color: colorCustom,
                            onPressed:() {
                              //uploadPic(context);
                              getImage();
                              _getCurrentLocation();

                              if (_currentPosition != null){


                                print("LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}");}


                            }

                            ,
                            icon:  Icon(Icons.photo),
                            label: new Text('Upload Photo'),
                          )),

                      ButtonTheme(
                          minWidth: 150.0,
                          height: 36.0,
                          child:
                          new RaisedButton.icon(

                            textColor: Colors.white,
                            color: colorCustom,
                            onPressed:() {
                              //uploadPic(context);
                              getImage();
                              _getCurrentLocation();

                              if (_currentPosition != null){


                                print("LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}");}


                            }

                            ,
                            icon:  Icon(Icons.check),
                            label: new Text('Submit'),
                          ))










                      ])









            );},
        )));







  }



  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}




