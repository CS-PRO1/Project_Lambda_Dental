import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

Widget defaultButton({
  double width = 150,
  Color background = cyan400,
  required String text,
  required Function function,
  double heigh = 60,
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
              borderRadius: StandardBorderRadius,
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
          style: TextStyle(color: cyan300),
        ),
        Radio(
            activeColor: cyan400,
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

class statefull extends StatefulWidget {
  const statefull({super.key});

  @override
  State<statefull> createState() => check();
}

class check extends State<statefull> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            activeColor: cyan400,
            value: checked,
            onChanged: (value) {
              setState(() {
                checked = value!;
              });
            }),
        //Text(text.tr, style: TextStyle(color: Theme.of(context).primaryColor)),
      ],
    );
  }
}

Widget checkBox(BuildContext context, {var checked, required String text}) =>
    Row(
      children: [
        Checkbox(
            activeColor: Colors.deepPurple,
            value: checked,
            onChanged: (value) {
              //setState(() {});
            }),
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
        'Expected Delivery day:',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 30,
      ),
      MaterialButton(
        onPressed: _showDatePpcker,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            _dateTime.year.toString() +
                '/' +
                _dateTime.month.toString() +
                '/' +
                _dateTime.day.toString(),
            style: TextStyle(color: white, fontSize: 15),
          ),
        ),
        color: cyan400,
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
      'Pick Image'.tr,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: cyan400,
      shape: StadiumBorder(),
    ),
  );
}

Widget myTextField(TextEditingController controller, BuildContext context,
    String label, Icon icon,
    {int height = 1}) {
  return TextFormField(
    minLines: height,
    maxLines: 50,
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please Enter your email address';
      }
      return null;
    },
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      label: Text(label),
      prefixIcon: icon,
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: StandardBorderRadius),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
        borderRadius: ActiveBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
        borderRadius: ActiveBorderRadius,
      ),
    ),
  );
}
