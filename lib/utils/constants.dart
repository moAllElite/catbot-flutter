import 'package:flutter/material.dart';

import 'custom_color.dart';


var sendButtonTextStyle = TextStyle(
  color: appColor.lightBackground,
  backgroundColor: appColor.primary,
  fontSize: 18.0,
);

var kInputTextDecoration = InputDecoration(
    labelText:'Enter your username',
    contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
    hintText:'Enter your username',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: appColor.success,width:1.0
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius:BorderRadius.circular(32.0),
      borderSide: BorderSide(
        color: appColor.primary,
      )
    ),
);

const  errorIcon = Icon(
    Icons.report_problem_outlined,
    color:Colors.red,
    size:7.0
);

