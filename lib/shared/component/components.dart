import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

Widget defaultButton({
  required double width,
  Color background = cyan100,
  double radius = 20.0,
  required String text,
  required Function function,
  required double heigh,
}) =>
    Container(
      width: width,
      height: heigh,
      child: TextButton(
        onPressed: () {},
        child: Text(text),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(background),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );

Widget genderRadio({
  bool isMale = true,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Male'.tr,
          style: TextStyle(color: Colors.blueAccent),
        ),
        Radio(
            activeColor: Colors.blue,
            value: (true),
            groupValue: isMale,
            onChanged: (val) {
              isMale = val!;
            }),
        SizedBox(
          width: 10.0,
        ),
        Text(
          'Female'.tr,
          style: TextStyle(color: Colors.purpleAccent),
        ),
        Radio(
            activeColor: Colors.purple,
            value: (false),
            groupValue: isMale,
            onChanged: (val) {
              isMale = val!;
            })
      ],
    );

Widget checkBox(BuildContext context, {var checked, required String text}) =>
    Row(
      children: [
        Checkbox(
            activeColor: Colors.deepPurple,
            value: checked,
            onChanged: (value) {}),
        Text(text.tr, style: TextStyle(color: Theme.of(context).primaryColor)),
      ],
    );

Widget datePicker(BuildContext context) {
  DateTime _dateTime = DateTime.now();
  void _showDatePpcker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((value) {
      _dateTime = value!;
    });
  }

  return Column(
    children: [
      Text(
        _dateTime.year.toString(),
        style: TextStyle(fontSize: 30),
      ),
      MaterialButton(
        onPressed: _showDatePpcker,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Choose Date".tr,
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 25),
          ),
        ),
        color: Colors.purple,
      )
    ],
  );
}

Widget imagePicker() {
  File? image;
  File? imageTemporary;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      //this.image = imageTemporary;
    } on PlatformException catch (e) {
      print('Faild to pick image: $e');
    }
  }

  return ElevatedButton(
    onPressed: () => pickImage(ImageSource.camera),
    child: Text(
      'Pick Camera'.tr,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    // style: ElevatedButton.styleFrom(primary: Colors.purple[400],onPrimary: Colors.purple[100],
    // shape: StadiumBorder(),
  );
}
