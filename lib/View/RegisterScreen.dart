import 'package:flutter/material.dart';
import 'package:project_lambda_dental/Controller/register_controller.dart';
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
