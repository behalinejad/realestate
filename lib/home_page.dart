import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.white),
          onPressed: ()  { /*Platform.isAndroid ?   _confirmExitApp(context) : Navigator.pop(context,'true') ;*/} ,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close),
            onPressed: () => {}/*_confirmSignOut(context)*/,
            tooltip: 'Logout',),
        ],
        title: Text('املاک'),
        centerTitle: true,
        backgroundColor: Colors.green[500],
        elevation: 10,
      )
      ,
    );
  }
}
