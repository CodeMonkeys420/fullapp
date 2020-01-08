import 'package:flutter/material.dart';

import 'package:tcegapp/Gridview.dart';

var nameList ;
var numL ;
var dateL;
var PlaceL;
int counter =0;
var BookingsL = new List();
var AlreadyBookedD = new List();
var timeL ;

String sanitizeDateTime(DateTime dateTime) => "${dateTime.year}-${dateTime.month}-${dateTime.day}";

Set<String> getDateSet(List<DateTime> dates) => dates.map(sanitizeDateTime).toSet();

class BookList extends StatefulWidget {


  @override
  BookListState createState() => BookListState();
}



class BookListState extends State<BookList> {




  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: Text("Bookings Made"),

    ),
        body:

        DeleteItemInListViewPopupMenu()


    );

  }

}


class NameL{

  NameL(var name , var num, var date, var time, var place , var counterOne){
    nameList = name;
    numL = num;
    dateL = date;
    timeL = time;
    PlaceL = place;
    counter= counterOne;


    BookingsL.add(PlaceL+' '+nameList+' '+numL+' '+ dateL+' '+time);
    AlreadyBookedD.add(Place+' '+(sanitizeDateTime(bookingsDate)).toString()+' '+time);
  }




}


int ItemNum(){

  if(BookingsL.length == 0){



    return 1;


  }
  else{

    return (BookingsL.length);

  }

}




class DeleteItemInListViewPopupMenu extends StatefulWidget {
  @override
  DeleteItemInListViewPopupMenuState createState() {
    return new DeleteItemInListViewPopupMenuState();
  }
}

class DeleteItemInListViewPopupMenuState
    extends State<DeleteItemInListViewPopupMenu> {

  _onSelected(dynamic val) {
    setState(() => AlreadyBookedD.removeWhere((data) => data == val));

/*for(var e in unselectableDates){

  if(val.contains(e)){
    print(e);
    unselectableDates.remove(e);
  }


}*/



   AlreadyBD(AlreadyBookedD);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView(
        children: AlreadyBookedD
            .map((data) => ListTile(
          title: Text(data),
          trailing: PopupMenuButton(
            onSelected: _onSelected,
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: data,
                child: Text("Delete"),
              ),
            ],
          ),
        ))
            .toList(),
      ),
    );
  }
}