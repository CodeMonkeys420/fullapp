import 'dart:ui';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:spinner_input/spinner_input.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'BookingsList.dart';

var time;
String dropdownValue = '10:00';
var AlreadyBooked = new List();
var  AlreadyBookedDate = new List();
var bookingsDate ;
var indexAmmount = 0;
bool flag = false;
var  booking  ;
var IdexCounter=1;
var imagePath;

/*Set <String> unselectableDates= {'2019-12-08'};*/
String sanitizeDateTime(DateTime dateTime) => "${dateTime.year}-${dateTime.month}-${dateTime.day}";

Set<String> getDateSet(List<DateTime> dates) => dates.map(sanitizeDateTime).toSet();

class Facilities extends StatefulWidget {
  @override
  FacilitiesState createState() => FacilitiesState();
}


class FacilitiesState extends State<Facilities> {


  @override
  Widget build(BuildContext context) {

    flag= false;

    return new Scaffold(
    body: GridView.count(
crossAxisSpacing: 2,
      mainAxisSpacing: 0.1,
      crossAxisCount: 2,

      children: List.generate(6, (index)

  {
    return

       new Column(

         children: <Widget>[


           GestureDetector(
               child: Container(
                   width:180,
                   height: 120,

                   decoration: BoxDecoration(

                     color: Colors.black,
                     image: DecorationImage(
                         image:AssetImage(ImagePath(index)),
                         fit:BoxFit.cover
                     ),
                     // button text
                   )
               ),onTap:(){


             booking = index;

             if(booking==0){
               indexAmmount= 3;
             }
             else if(booking==1) {
               indexAmmount = 1;
             }
             else if(booking==5) {
               indexAmmount = 6;
             }
             else if(booking==2) {
               indexAmmount = 2;
             }
             else
             {
               indexAmmount = 1;

             }

             flag = true;
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) =>  bookingPage()),
             );
           }
           ),


        ButtonTheme(
            minWidth: 180.0,
            height: 30.0,

            child:
            new RaisedButton.icon(

            textColor: Colors.white,
            color: colorCustom,
            onPressed:(){ booking = index;

            if(booking==0){
              indexAmmount= 3;
            }
            else if(booking==1) {
              indexAmmount = 1;
            }
            else if(booking==5) {
              indexAmmount = 6;
            }
            else if(booking==2) {
              indexAmmount = 2;
            }
            else
              {
                indexAmmount = 1;

              }

            flag = true;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  bookingPage()),
            );

            },
            icon: IconsIndex(index),
            label: LabelIndex(index,0),
      )),
    ]);



  }),
  ));}







}


String ImagePath(var indexNum){

  if (indexNum== 0)
  {
    return'Assets/restaurant.jpg';



  }

  else if (indexNum== 1)
  {
    return'Assets/wine.jpg';


  }

  else if (indexNum== 2)
  {
    return'Assets/golf.jpg';


  }

  else if (indexNum== 3)
  {

    return'Assets/spa.jpg';


  }
  else if (indexNum== 4)
  {

    return'Assets/hotel.jpg';


  }
  else{


    return'Assets/polo.jpg';


  }

}

Icon IconsIndex(var indexNum){

  if (indexNum== 0)
    {


      return  Icon(Icons.restaurant);

    }

  else if (indexNum== 1)
    {

      return  Icon(Icons.local_bar);

    }

  else if (indexNum== 2)
  {

    return  Icon(Icons.golf_course);

  }

  else if (indexNum== 3)
  {


    return  Icon(Icons.spa);

  }
  else if (indexNum== 5)
  {


    return  Icon(Icons.local_activity);

  }
  else{



    return Icon(Icons.home);

  }


}


Text LabelIndex(var indexNum, var nameIndex){

  if (indexNum== 0)
  {
    if(flag == false)
      {
        return   Text('Restaurants');

      }
    else{


      if(nameIndex==0)

      {

        return   Text('POLO CLUB RESTAURANT');
      }
      else if(nameIndex==1)
        {

          return   Text('THE VALLEY RESTAURANT');
        }
      else if(nameIndex==2) {
        return Text("Fleet Coffee Roastery");
      }



    }




  }

  else if (indexNum== 1)
  {


    if(flag == false)
    {
      return  Text('Wine');

    }
    else{


      if(nameIndex==0)

      {
        return   Text('L’HUGUENOT VENUE & VINOTEQUE');
      }






    }

  }

  else if (indexNum== 2)
  {


    if(flag == false)
    {
      return  Text('Golf');

    }
    else{


      if(nameIndex==0)

      {

        return   Text('PEARL VALLEY JACK NICKLAUS SIGNATURE GOLF COURSE',style: TextStyle(fontSize: 10),);

      }
      else if(nameIndex==1)

      {



          return   Text('SwingFit Training Academy');

      }








    }


  }

  else if (indexNum== 3)
  {
    if(flag==false)
      {

        return  Text('Spa');
      }
    else
      {
        return  Text('CAMELOT SPA VAL DE VIE');


      }


  }
  else if (indexNum== 5)
  {
    if(flag==false)
    {

      return  Text('Activities');
    }
    else
    {

      if(nameIndex==0)

      {
        return   Text('Polo Academy Lessons');
      }
      else if (nameIndex==1)
        {
          return   Text('Tennis');

        }
      else if (nameIndex==2)
      {
        return   Text('Equestrian competitive coaching');

      }
      else if (nameIndex==3)
      {
        return   Text('Equestrian riding school');

      }
      else if (nameIndex==4)
      {
        return   Text('Pearl valley Boma');

      }
      else if (nameIndex==5)
      {
        return   Text('Ryk Neethling swim school');

      }

    }


  }
  else{

    if(flag==false)
    {

      return  Text('Hotel');
    }
    else
    {
      return  Text('PEARL VALLEY HOTEL BY MANTIS');


    }



  }



}





var Place;

class bookingPage extends StatefulWidget {
  @override
  bookingPageState createState() => bookingPageState();
}




class bookingPageState extends State<bookingPage> {



  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight -300) ;
    final double itemWidth = size.width +50;

    return

   new WillPopScope(
      onWillPop: () async => true,
    child : new Scaffold(

      appBar: AppBar(
        title: Text("Bookings"),


      ),
      body: GridView.count(
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 1,

        children: List.generate(indexAmmount, (index)

        {

          return
              new Column(

                  children: <Widget>[


                   GestureDetector(
                        child: Container(
                            width:300,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                    image:AssetImage(ImagePathBookPg(booking,index)),
                                    fit:BoxFit.cover
                                ),
                                // button text
                            )
                        ),onTap:(){
                     PlaceName(booking,index);

                     flag=true;


                     Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) =>  bookSpot()));
                    }
                    ),

                    ButtonTheme(
                        minWidth: 300.0,
                        height: 36.0,
                        child:
                        new RaisedButton.icon(

                          textColor: Colors.white,
                          color: colorCustom,
                          onPressed:(){
                         //   Place = index;

                            PlaceName(booking,index);

                            flag=true;


                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  bookSpot()));
                          },
                          icon: IconsIndex(booking),
                          label: LabelIndex(booking,index),
                        )),
                  ]);



        }),
      )));}



}




class bookSpot extends StatefulWidget {
  @override
  bookSpotState createState() => bookSpotState();
}


class bookSpotState extends State<bookSpot> {

  var BookingName='';
  var AmmountOfPeople=0;
  final myController = TextEditingController();

  final formatH = DateFormat("yyyy-MM-dd");

  double spinner = 1;

  Future<bool> _onWillPop() {
    flag= true;
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('changes will not be saved'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () {
              flag= true;
              Navigator.of(context).pop(true);},
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {

    flag = true;
    return

    new WillPopScope(
        onWillPop: _onWillPop,
        child : new Scaffold(

            appBar: AppBar(
              title: Text("Book"),


            ),
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
                            /* initialValue: name,*/
                          )
                        ,




                          Column(children: <Widget>[

                            DateTimeField(

                              format: formatH,
                              decoration: InputDecoration(labelText: 'Choose a date '),
                              onShowPicker: (context, currentValue) async {

                                final date = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                  initialDate: currentValue ?? DateTime.now(),
                                  /*  selectableDayPredicate: (DateTime val) {
                                      String sanitized = sanitizeDateTime(val);
                                      return !unselectableDates.contains(sanitized);
                                    },*/
                                    lastDate: DateTime(2100));


                                if (date != null) {
                                /*  final time = await showTimePicker(

                                    context: context,

                                    initialTime:
                                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),

                                 );

                                  bookingsDate = DateTimeField.combine(date, time);
                                  return DateTimeField.combine(date, time);
                                  */

                                  bookingsDate = date;
                                  return date;
                                } else {

                                  return currentValue;
                                }


                                

                              },
                            ),

                            Row( children: <Widget>[

                              Text('Choose Time slot:  '),
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
                                time = dropdownValue.toString();



                              });
                            },
                            items: <String>['08:00', '08:15', '08:30', '08:45', '09:00', '09:15', '09:30',
                              '09:45', '10:00', '10:15', '10:30', '10:45','11:00','11:15','11:30','11:45','12:00',
                              '12:15','12:30','12:45','13:00']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            })
                                .toList(),
                          )
                                                 ,

                                        ])

                          ]),

                          Container(
                            margin: EdgeInsets.all(20),
                            child: new Column(
                                children: <Widget>[

                             new Text('Ammount of people'),

                           new  SpinnerInput(


                              spinnerValue: spinner,
                              minValue: 1,
                              maxValue: 20,



                              onChange: (newValue) {
                                setState(() {
                                  spinner = newValue;
                                });
                                },
                         ),
              ])

                          ),


                          ButtonTheme(
                              minWidth: 150.0,
                              height: 36.0,
                              child:
                              new RaisedButton.icon(

                                textColor: Colors.white,
                                color: colorCustom,
                                onPressed:(){



                                  if(myController.text ==''){


                                 _ackAlert(context);

                                  }
                                  else{
                                  if (bookingsDate == null){

                                    _ackAlertDate(context);

                                  }
                                  else{

                                    BookingName = myController.text;
                                    AmmountOfPeople = spinner.toInt();


                                    if(time == null){_ackAlertTime(context);}
                                    else{

print(Place+bookingsDate.toString()+time +' testing!!!!!!!!!!');
                                      if(AlreadyBooked.contains(Place+bookingsDate.toString()+time))
                                        {
                                          _ackAlertAlready(context);

                                        }
                                      else
                                        {


                                          AlreadyBookedDate.add(bookingsDate);
                                        //  AlreadyBookedDate.forEach( (element) =>  unselectableDates.add(sanitizeDateTime(element)));
//print(unselectableDates );
                                          NameL(BookingName,AmmountOfPeople.toString(),bookingsDate.toString(),time,Place,IdexCounter);
                                          AlreadyBooked.add(Place+bookingsDate.toString()+time);

                                              print(BookingName + ' booked for '+ AmmountOfPeople.toString() + ' on the ' +bookingsDate.toString()+' '+time+ ' at '
                                                    ''+ Place


                                             );

                                          BookingName = '';
                                          AmmountOfPeople=0;
                                          bookingsDate='';
                                          time='';
                                          Place='';
                                          IdexCounter++;
                                          flag =true;
                                          dropdownValue = '10:00';
                                          Navigator.pop(context);



                                        }

                                    }



                                  }

                                  }


                                },
                                icon:  Icon(Icons.bookmark),
                                label: new Text('book'),
                              )),
                        ]));



              }),
            )));}

}

void PlaceName (var indexNum, var nameIndex) {
  if (indexNum == 0) {


      if (nameIndex == 0) {
      Place = 'POLO CLUB RESTAURANT';
      }
      else if (nameIndex == 1) {
        Place = 'THE VALLEY RESTAURANT';
      }
      else if (nameIndex == 2) {
        Place = 'REUBEN’S AND CO CAFÈ';
      }

  }
  else if (indexNum == 1) {


    if (nameIndex == 0) {
      Place = 'L’HUGUENOT VENUE & VINOTEQUE';
    }



  }

  else if (indexNum == 2) {


    if (nameIndex == 0) {
      Place =   'PEARL VALLEY JACK NICKLAUS SIGNATURE GOLF COURSE';
    }
    else{

      Place = 'SwingFit Training Academy';
    }



  }




  else if (indexNum == 3) {


    if (nameIndex == 0) {
      Place = 'CAMELOT SPA VAL DE VIE';
    }



  }

  else if (indexNum == 4) {


    if (nameIndex == 0) {
      Place = 'PEARL VALLEY HOTEL BY MANTIS';
    }



  }

  else if (indexNum == 5) {


    if(nameIndex==0)

    {
      Place = 'VAL DE VIE EQUESTRIAN FACILITY';
    }
    else if (nameIndex==1)
    {
      Place =    'LIVERY';

    }
    else if (nameIndex==2)
    {
      Place = 'COMPETITIVE COACHING';

    }
    else if (nameIndex==3)
    {
      Place = 'PEARL VALLEY EQUESTRIAN CENTRE';

    }
    else if (nameIndex==4)
    {
      Place = 'INSTRUCTION';

    }
    else if (nameIndex==5)
    {
      Place = 'RIDING SCHOOL';

    }
    else if (nameIndex==6)
    {
      Place = 'CHILDREN’S HOLIDAY ACTIVITIES';

    }



  }


}



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



Future<void> _ackAlertDate(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: const Text('Please enter a Date'),
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


Future<void> _ackAlertTime(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: const Text('Please choose a time'),
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




Future<void> _ackAlertAlready(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: const Text('already booked , please choose another time slot'),
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


class AlreadyBD {

  AlreadyBD(var Deleted) {
    AlreadyBooked.clear();
    Deleted.forEach((element) => AlreadyBooked.add(element));

    print(AlreadyBooked.length);
    /*   if(AlreadyBooked.length ==0){

      unselectableDates.clear();
      unselectableDates= {'2019-12-08'};
    }



  }*/


  }

}

String ImagePathBookPg(var indexNum, var index){
print(indexNum.toString()+' ' + index.toString());

  if (indexNum== 0)
  {
    if(index==0){
      return'Assets/poloR.jpg';

    }

     else if(index== 1){

      return'Assets/valleyR.jpg';
    }

      else if(index== 2){

      return'Assets/CoffieR.jpg';
    }

  }

  else if (indexNum== 1)
  {
    if(index==0){
      return'Assets/wineR.jpg';

    }


  }

  else if (indexNum== 2)
  {
    if(index==0) {
      return 'Assets/golfR.jpg';
    }
    else {
      return 'Assets/golfRP.jpg';

    }

  }

  else if (indexNum== 3)
  {


    if(index==0) {
      return 'Assets/SPAr.jpeg';
    }



  }
  else if (indexNum== 4)
  {

    return'Assets/hotelr.jpg';


  }
  else{

    if(index==0) {
      return'Assets/poloA.jpg';
    }
    else if (index==1){

      return'Assets/tennis.jpg';
    }
    else if (index==2){

      return'Assets/Competitive.jpg';
    }
    else if (index==3){

      return'Assets/ridingSchool.jpg';
    }
    else if (index==4){

      return'Assets/poloA.jpg';
    }
    else if (index==5){

      return'Assets/4BWK9bCw.jpeg';
    }

  }
}