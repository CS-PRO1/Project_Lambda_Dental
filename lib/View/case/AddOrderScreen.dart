// ignore: file_names
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_lambda_dental/Controller/Cases/CasesController.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

// ignore: must_be_immutable
class AddOrderScreen extends GetView {
  AddOrderScreen({super.key});
  var patientnamecontroller = TextEditingController();
  var agecontroller = TextEditingController();
  var notecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
        return GetBuilder(
      init: CasesController(),
      builder: (controller) =>  Scaffold(
      backgroundColor: bglight,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        leading: PopupMenuButton(
            icon: const Icon(Icons.menu),
            itemBuilder: (context) => [
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              'Settings'.tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Get.toNamed('/settings')),
                ]),
        elevation: 0,
        backgroundColor: cyan200,
        title: Text(
          'New Order'.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            icon: Icon(Icons.arrow_back),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myTextField(patientnamecontroller, context, 'Patient Name'.tr,
                  Icon(Icons.person)),
              SizedBox(
                height: 30,
              ),
              myTextField(agecontroller, context, 'Age'.tr,
                  Icon(Icons.hourglass_full_outlined)),
              SizedBox(
                height: 30,
              ),
              genderRadio(),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Need Trial'.tr),
                  statefull(),
                  Text('Repeat'.tr),
                  statefull(),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              DropdownMenu(
                dropdownMenuEntries: <DropdownMenuEntry<String>>[
                  DropdownMenuEntry(value: 'BL1', label: 'BL1'),
                  DropdownMenuEntry(value: 'BL2', label: 'BL2'),
                  DropdownMenuEntry(value: 'BL3', label: 'BL3'),
                  DropdownMenuEntry(value: 'BL4', label: 'BL4'),
                  DropdownMenuEntry(value: 'A1', label: 'A1'),
                  DropdownMenuEntry(value: 'A2', label: 'A2'),
                  DropdownMenuEntry(value: 'A3', label: 'A3'),
                  DropdownMenuEntry(value: 'A3.5', label: 'A3.5'),
                  DropdownMenuEntry(value: 'B1', label: 'A4'),
                  DropdownMenuEntry(value: 'B2', label: 'B1'),
                  DropdownMenuEntry(value: 'B3', label: 'B2'),
                  DropdownMenuEntry(value: 'A4', label: 'B3'),
                  DropdownMenuEntry(value: 'B4', label: 'B4'),
                  DropdownMenuEntry(value: 'C1', label: 'C1'),
                  DropdownMenuEntry(value: 'C2', label: 'C2'),
                  DropdownMenuEntry(value: 'C3', label: 'C3'),
                  DropdownMenuEntry(value: 'C4', label: 'C4'),
                  DropdownMenuEntry(value: 'D1', label: 'D1'),
                  DropdownMenuEntry(value: 'D2', label: 'D2'),
                  DropdownMenuEntry(value: 'D3', label: 'D3'),
                  DropdownMenuEntry(value: 'D4', label: 'D4'),
                ],
                // menuStyle: MenuStyle(shape: Radius),
                menuHeight: 260,
                width: 150,
                label: Text(
                  'Shade'.tr,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              //checkBox(context, text: 'Need Trial'),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: 1,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Expected Delivery date:'.tr,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              datePicker(context),
              SizedBox(
                height: 30,
              ),
              myTextField(
                  notecontroller, context, 'Notes'.tr, Icon(Icons.edit_note),
                  height: 5, maxLines: 50),
              SizedBox(
                height: 30,
              ),
              imagePicker(),
              SizedBox(
                height: 30,
              ),
              defaultButton(
                  width: 150,
                  text: 'Next'.tr,
                  function: () {
                    Get.toNamed('/teethselect');
                  },
                  heigh: 50)
            ],
          ),
        ),
      )),
    ));
  }
}
