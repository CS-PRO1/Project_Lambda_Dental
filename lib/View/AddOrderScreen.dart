import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddOrderScreen extends GetView {
  const AddOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Order"),
        ),
      ),
    );
  }
}
