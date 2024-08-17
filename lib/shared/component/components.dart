import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

Widget defaultButton({
  double width = 150,
  required String text,
  required VoidCallback function,
  double heigh = 60,
  double? textsize,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[cyan500, cyan400, cyan300]),
    ),
    width: width,
    height: heigh,
    child: TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(fontSize: textsize),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
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
Widget genderRadio(bool isMale) => StatefulBuilder(
      builder: (context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Male'.tr,
              style: TextStyle(color: cyan300),
            ),
            Radio(
                activeColor: cyan400,
                value: true,
                groupValue: isMale,
                onChanged: (val) {
                  setState(() {
                    isMale = val!;
                  });
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
                value: false,
                groupValue: isMale,
                onChanged: (val) {
                  setState(() {
                    isMale = val!;
                  });
                })
          ],
        );
      },
    );

Widget statefull(bool check, {required Function(bool) onChanged}) => StatefulBuilder(
      builder: (context, setState) {
        return Checkbox(
          activeColor: cyan400,
          value: check,
          onChanged: (value) {
            setState(() {
              check = value!;
              onChanged(value);
            });
          },
        );
      },
    );

     Widget datePicker(DateTime expectedDeliveryDate, BuildContext context) {
  return StatefulBuilder(
    builder: (context, setState) {
      return SizedBox(
        width: 200,
        child: Card(
          color: bglight,
          elevation: 1,
          shape:
              LinearBorder.bottom(side: BorderSide(color: cyan400, width: 2)),
          child: InkWell(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2050),
              );
              if (pickedDate != null) {
                setState(() {
                  expectedDeliveryDate = pickedDate;
                });
              }
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${expectedDeliveryDate.year}/${expectedDeliveryDate.month}/${expectedDeliveryDate.day}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.calendar_month_outlined),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


  Widget imagePicker(List images) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    images.add(File(pickedFile.path));
                  });
                }
              },
              child: Text('Pick Image from Gallery'),
            ),
            ElevatedButton(
              onPressed: () async {
                final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  setState(() {
                    images.add(File(pickedFile.path));
                  });
                }
              },
              child: Text('Take Photo'),
            ),
            SizedBox(height: 10),
            Wrap(
              children: images.map((image) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

Widget myTextField(TextEditingController controller, BuildContext context,
    String label, Icon prefixIcon,
    {int height = 1,
    int maxLines = 1,
    Widget? postfixicon,
    bool obscureText = false,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool autofocus = false}) {
  return TextFormField(
    autofocus: autofocus,
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

Widget NumInput(BuildContext context, {autofocus = false, TextEditingController? controller}) {
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
      onChanged: (value) {
        nextFocus(context);},
      
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

Widget MyFloatButton({VoidCallback? onTap}) {
  return Container(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 52.0,
        height: 52.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cyan200,
        ),
        child: Icon(
          Icons.add,
          color: cyan500,
          size: 25.0,
        ),
      ),
    ),
  );
}

toast(String msg) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: cyan400,
      textColor: Colors.white,
      fontSize: 16.0);
}
