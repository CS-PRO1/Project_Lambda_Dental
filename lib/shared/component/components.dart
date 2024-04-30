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
  required VoidCallback function,
  double heigh = 60,
}) {
  return Container(
    width: width,
    height: heigh,
    child: TextButton(
      onPressed: function,
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
}

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
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((value) {
      _dateTime = value!;
    });
  }

  return SizedBox(
    width: 200,
    child: Card(
      color: bglight,
      elevation: 1,
      shape: LinearBorder.bottom(side: BorderSide(color: cyan400, width: 2)),
      child: InkWell(
        onTap: _showDatePicker,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _dateTime.year.toString() +
                    '/' +
                    _dateTime.month.toString() +
                    '/' +
                    _dateTime.day.toString(),
                style: TextStyle(fontSize: 20),
              ),
              Icon(Icons.calendar_month_outlined),
            ],
          ),
        ),
      ),
    ),
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
      'Add Images'.tr,
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
    String label, Icon prefixIcon,
    {int height = 1,
    int maxLines = 1,
    Widget? postfixicon,
    bool obscureText = false,
    String? Function(String?)? validator,
    TextInputType? keyboardType}) {
  return TextFormField(
    minLines: height,
    maxLines: maxLines,
    controller: controller,
    validator: validator,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      label: Text(label),
      prefixIcon: prefixIcon,
      suffixIcon: postfixicon,
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

Widget orderdetailsCard({
  required String title,
  required String description,
  Icon? icon,
  bool centertitle = true,
}) {
  return Card(
    shape: RoundedRectangleBorder(
        side: BorderSide(width: .1, color: cyan400),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: centertitle
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5e6172)),
              ),
            ],
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: cyan400,
            margin: EdgeInsets.only(bottom: 5),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff5e6172),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget NumInput(BuildContext context) {
  return SizedBox(
    width: 35,
    height: 70,
    child: TextFormField(
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      maxLength: 1,
      maxLines: 1,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(5),
        counterText: '',
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(10.0)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
            borderRadius: BorderRadius.circular(10.0)),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (value) => nextFocus(context),
    ),
  );
}

void nextFocus(BuildContext context) {
  FocusScope.of(context).nextFocus();
}

AppBar MyAppBar(
    {required String title, List<Widget>? actions, Widget? leading}) {
  return AppBar(
    leading: leading,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[cyan400, cyan100]),
      ),
    ),
    scrolledUnderElevation: 0,
    centerTitle: true,
    title: Text(title.tr),
    actions: actions,
  );
}

Widget AppBarPopupMenu() {
  return PopupMenuButton(
      icon: const Icon(Icons.menu),
      itemBuilder: (context) => [
            PopupMenuItem(
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: cyan500,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        'Settings'.tr,
                        style: TextStyle(
                          color: cyan600,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () => Get.toNamed('/settings')),
            PopupMenuItem(
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: cyan500,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        'About'.tr,
                        style: TextStyle(
                          color: cyan600,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () => Get.toNamed('/about')),
          ]);
}
