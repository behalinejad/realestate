import 'dart:convert';

import 'package:flutter/material.dart';

class User {
  User({@required this.id,@required this.name,@required this.lastName,@required this.username,@required this.password,@required this.phoneNumber, this.userPhoto, this.email,@required this.lastLoginDevice});
  int id;
  String name,lastName,username,password,phoneNumber,userPhoto,email,lastLoginDevice ;


  toJson() => {
    'name':name,
    'lastname':lastName,
    'username':username,
    'password':password,
    'phonenumber' : phoneNumber,
    'userphoto' : userPhoto,
    'email' : email,
    'lastlogindevice':lastLoginDevice,
  };

  toJsonUtf8() => {
    'name':utf8.encode(name),
    'lastname':utf8.encode(lastName),
    'username':utf8.encode(username),
    'password':utf8.encode(password),
    'phonenumber' : phoneNumber,
    'userphoto' : userPhoto,
    'email' : utf8.encode(email),
    'lastlogindevice':lastLoginDevice,
  };
  toJsonById() => {
    'id':id.toString() ,
    'name':name,
    'lastname':lastName,
    'username':username,
    'password':password,
    'phonenumber' : phoneNumber,
    'userphoto' : userPhoto,
    'email' : email,
    'lastlogindevice':lastLoginDevice,
  };

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id : json['id'],
      name : json['name'],
      lastName : json['lastname'],
      username : json['username'],
      password : json['password'],
      phoneNumber : json['phonenumber'],
      userPhoto : json['userphoto'],
      email:json['email'],
      lastLoginDevice : json['lastlogindevice'],
    );
  }

}