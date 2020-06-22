import 'dart:async';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';


import 'package:realestateadvisor/models/http.dart';
import 'package:realestateadvisor/sign_in/json_file.dart';
import 'package:realestateadvisor/sign_in/sign_in_form.dart';

import '../home_page.dart';


class LandingPage extends StatefulWidget {
  LandingPage({Key key, this.isSentBack:false}) : super(key: key);
  bool isSentBack ;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  JsonFile jsFile = JsonFile();

  final http = Http();
  String myDeviceId;
  //bool isSentBack=false;
  /*@override
  void dispose() {
    super.dispose();
  }*/

  @override
  void initState() {
    super.initState();
    _ckeckRealEstateJsonFile();
    checkUserAndRoute();
  }


  @override
  Widget build(BuildContext context) {
    if (widget.isSentBack) {
      widget.isSentBack =false;
      checkUserAndRoute();
    }
    if (myDeviceId == '' || myDeviceId == null) {
      setState(() {});
    }
    // print(myDeviceId);
    return Container(
      decoration: BoxDecoration(
        //color: Colors.lightBlue,
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent[200], Colors.green],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.lightBlue,
          strokeWidth: 5,
        ),
      ),
    );

  }

  /*Stream<String> getId() async* {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      yield iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      print(androidDeviceInfo.androidId.toString());
      yield androidDeviceInfo.androidId; // unique ID on Android

    }
  }*/

  void checkUserAndRoute() {
    Map<String, String> mapedJson = jsFile.getJsonFile();
    if (mapedJson != null) {
      http.makeUserGetRequestByUsername(mapedJson['userName']).listen((
          data) async {
        //print(data.toJson());
        if (data != null) {
          String result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (
                context) => HomePage()),
          );
          if (result == 'true') {
            widget.isSentBack = true;
          }
        } else {
          String result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (
                context)  => SignInForm()),
          );
          if (result == 'true') {
            widget.isSentBack = true;
          }
        }
      });
    }
  }
  void _ckeckRealEstateJsonFile() {
    try {
      if (!jsFile.fileExists){}

        Map<String,String> newContent ;
        newContent = {'userName' :'*','password':'*','loginType':'*'};
        jsFile.createJsonFile(newContent);
    } on Exception catch (e) {
      print('error ');
    }
    }

}
