import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.blueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,

);

const kMessageContainerDecoration =

// BoxDecoration(
//   borderRadius: BorderRadius.all(
//     Radius.circular(40.0),
//     color: Colors.blue[200],
//   ),
//      // color: Colors.blue[200],
//
// );

BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0,),
    bottom: BorderSide(color: Colors.blueAccent,width: 2.0),
    right: BorderSide(color: Colors.blueAccent,width: 10.0),
    left: BorderSide(color: Colors.blueAccent,width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
