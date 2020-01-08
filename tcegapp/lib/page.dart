

import 'package:flutter/material.dart';
import 'main.dart';

import 'contacts.dart';

import 'BookingsList.dart';



var name ='Kyle Potgieter' ;
var details ='Snowboarder, Superhero and writer.\nSometime I work at google as Executive Chairman ';
 var imgUrl = 'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg';
class MyHomePageProfile extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}
bool flag = true;

class MyHomePageState extends State<MyHomePageProfile>  {

  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/')

        .then((_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;


    return new Stack(children: <Widget>[
      new Container(color: Colors.white,),


      new Scaffold(

          drawer: new Container(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
          child:  new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: _height/12, ),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: NetworkImage(imgUrl),),
                new SizedBox(height: _height/25.0,),
                new Text(name, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.black),),

            new Text(details,
              style: new TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.black),textAlign: TextAlign.center,) ,


            new Padding(padding: new EdgeInsets.only(top: _height/13, left: _width/8, right: _width/8)),

              new RaisedButton.icon(

              textColor: Colors.white,
              color: colorCustom,
              onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => editPage()),
              );},
               icon: Icon(Icons.edit),
                label: Text('Edit profile'),



              ),
                new RaisedButton.icon(

                  textColor: Colors.white,
                  color: colorCustom,
                  onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactsExampleApp()),
                  );},
                  icon: Icon(Icons.contacts),
                  label: Text('Contacts'),
                ),

                new RaisedButton.icon(

                  textColor: Colors.white,
                  color: colorCustom,
                  onPressed:(){


                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookList()),
                    );

                    },
                  icon: Icon(Icons.bookmark),
                  label: Text('Bookings'),
                ),


                new RaisedButton.icon(

                    textColor: Colors.white,
                    color: colorCustom,
                    onPressed:(){print('hello world');},
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
                ),



                new RaisedButton.icon(

                  textColor: Colors.white,
                  color: colorCustom,
                  onPressed:()=> _goToLogin(context),
                  icon: Icon(Icons.cancel),
                  label: Text('Logout'),
                )


              ],



            ),
    )))],
              );


  }




}






class editPage extends StatelessWidget {


  @override
  final myController = TextEditingController();
  final myControllerName = TextEditingController();


    Widget build(BuildContext context) {



    final _height = MediaQuery.of(context).size.height;

    return

      new Scaffold(
          appBar: AppBar(
            title: Text("Edit profile"),


          ),
          body: GridView.count(

          crossAxisCount: 1,

      children: List.generate(1, (index)
      {



      return Center(
      child:
      new Column(
      children: <Widget>[
        SingleChildScrollView(
              child:  new Center(
                child: new Column(
                  children: <Widget>[
                    new SizedBox(height: _height/12, ),


                   TextFormField(
                   decoration: InputDecoration(labelText: 'Enter your username'
                   ),
                     controller: myControllerName,
                      /* initialValue: name,*/
                   )
                    ,

                    TextFormField(
                    decoration: InputDecoration(
                    labelText: 'Enter your details'
                      ),
                     controller: myController,
                      /*initialValue: details,*/
                     ),



                   new RaisedButton.icon(

                    textColor: Colors.white,
                     color: colorCustom,
                     onPressed:(){


                        if(myControllerName.text==''){

                          _ackAlert(context);
                        }
                        else
                          {
                          if(myController.text==''){
                            _ackAlertDetails(context);
                          }
                          else{
                            details = myController.text;
                            name = myControllerName.text;
                            Navigator.pop(context);
                          }



                         }


                        },
                        icon: Icon(Icons.check),
                        label: Text('Apply'),
                        )



                  ],



                ),
              )),],
      ));})));




  }



}



/*
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}*/


Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: const Text('Please enter a name'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}



Future<void> _ackAlertDetails(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: const Text('Please enter details'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}









