import 'package:flutter/material.dart';

import 'package:tcegapp/widgets/recent_chats.dart';

class MesgPg extends StatefulWidget {
  @override
  _MessagePgState createState() => _MessagePgState();
}

class _MessagePgState extends State<MesgPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[

                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
