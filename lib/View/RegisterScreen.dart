import 'package:flutter/material.dart';
import 'package:flutter_application_3_getx/Controller/register_controller.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: const Text('Reg Screen'),
        );
      },
    );
  }
}
