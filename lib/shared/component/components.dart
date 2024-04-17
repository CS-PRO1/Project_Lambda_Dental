import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  required double width,
   Color background=Colors.purple,
   double radius= 20.0,
  required String text,
  required Function function,
  required double heigh,
})=>    Container(
  width: width,
  height: heigh,
  child: TextButton(
    onPressed: () {},
    child: Text(text ),
    style: ButtonStyle(
      foregroundColor:
      MaterialStateProperty.all(Colors.white),
     backgroundColor:
      MaterialStateProperty.all(background),
      shape: MaterialStateProperty.all<
          RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: Colors.white),
        ),
      ),
    ),
  ),
);


