import 'package:flutter/material.dart';
import 'page.dart';
import 'content.dart';
import 'Gridview.dart';
import 'package:tcegapp/Report.dart';
import 'bottom_navy_bar.dart';
import 'screens/home_screen.dart';
import 'package:synchronized/synchronized.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'login_screen.dart';
import 'transition_route_observer.dart';
import 'signin/wrapper.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// var actionCodeSettings = ActionCodeSettings.Builder()
//         // URL you want to redirect back to. The domain (www.example.com) for this
//         // URL must be whitelisted in the Firebase Console.
//         .setUrl("https://vdvdatabase.firebaseapp.com/__/auth/action?mode=<action>&oobCode=<code>")
//         .setHandleCodeInApp(true)
//         .setIOSBundleId("com.example.ios")
//         .setAndroidPackageName(
//                 "com.example.android",
//                 true, /* installIfNotAvailable */
//                 "12" /* minimumVersion */)
//         .build();

void main() => runApp(Login());

const PrimaryColor = const Color(0xFF151026);
bool FlagLoc = false;

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: MyHomePage(),
    );
  }
}

var lat ;
var Lng ;



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  int currentIndex = 0;
  Position _currentPosition;
  int _currentIndex = 0;


  final List<Widget> _children = [
    NewsPG(title: "Home Page"),
    MesgPg(),
    MyHomePageProfile(),
    ReportPg(),
    Facilities()

  ];



  @override
  Widget build(BuildContext context)  {

    _getCurrentLocation();


    if(_currentPosition != null)
    {

      lat="LAT: ${_currentPosition.latitude}" ;
      Lng= "LNG: ${_currentPosition.longitude}";
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Padding(
        padding: const EdgeInsets.all(20.0)),
            Image.asset(
              'Assets/vLogo.png',
              fit: BoxFit.contain,
              height: 20,
              scale: 1,
            ),

          ],

        ),
          actions: <Widget>[
      // action button
      IconButton(
      icon: Icon(Icons.error_outline),
      onPressed: () {

        _Alert(context);


           _getCurrentLocation();


          if (_currentPosition != null)
            {

              lat="LAT: ${_currentPosition.latitude}" ;
              Lng= "LNG: ${_currentPosition.longitude}";
            }








      },
    ),]
      ),
      body:  _children[_currentIndex],

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: colorCustom,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
            activeColor: colorCustom,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: colorCustom,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.report_problem),
            title: Text('Report'),
            activeColor: colorCustom,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.local_activity),
            title: Text('Facilities'),
            activeColor: colorCustom,
          ),
        ],
      ),
    );
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




class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: colorCustom,
        accentColor: colorCustom,
        cursorColor: colorCustom,
        // fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          display2: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: colorCustom,
          ),
          button: TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.deepPurple[300],
          ),
          display4: TextStyle(fontFamily: 'Quicksand'),
          display3: TextStyle(fontFamily: 'Quicksand'),
          display1: TextStyle(fontFamily: 'Quicksand'),
          headline: TextStyle(fontFamily: 'NotoSans'),
          title: TextStyle(fontFamily: 'NotoSans'),
          subhead: TextStyle(fontFamily: 'NotoSans'),
          body2: TextStyle(fontFamily: 'NotoSans'),
          body1: TextStyle(fontFamily: 'NotoSans'),
          subtitle: TextStyle(fontFamily: 'NotoSans'),
          overline: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      home: Wrapper(),
      navigatorObservers: [TransitionRouteObserver()],
      // routes: {
      //   LoginScreen.routeName: (context) => LoginScreen(),

      // },
    );
  }




}




Map<int, Color> color =
{
  50:Color.fromRGBO(217,180,111, .1),
  100:Color.fromRGBO(217,180,111, .2),
  200:Color.fromRGBO(217,180,111, .3),
  300:Color.fromRGBO(217,180,111, .4),
  400:Color.fromRGBO(217,180,111, 1),//change .5 na 1 vir die login button fix
  500:Color.fromRGBO(217,180,111, .6),
  600:Color.fromRGBO(217,180,111, .7),
  700:Color.fromRGBO(217,180,111, .8),
  800:Color.fromRGBO(217,180,111, .9),
  900:Color.fromRGBO(217,180,111, 1),
};
//waar die color func assign word
MaterialColor colorCustom = MaterialColor(0xFFd9b46f, color);
//color insert word
const PrimaryColorTwo = const Color(0xFFd9b46f);

Future<void> _Alert(BuildContext context) {




  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Panic Alert'),
        content: const Text('This will send out a location to emergency contacts. Are you sure you you want to proceed?'),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
               Navigator.of(context).pop();
               if ( lat!= null)
                 {
                   print(lat +' '+Lng);

                 }



            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop();


            },
          )
        ],
      );
    },
  );







}



