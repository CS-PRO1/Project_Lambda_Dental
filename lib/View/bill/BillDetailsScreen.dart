import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/Bills/BillsController.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class BillDetailsScreen extends GetView {
  BillDetailsScreen({super.key});
  int id = Get.arguments['id'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BillsController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text('Bill'.tr + id.toString()),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        catItemBuilder(context, index),
                    itemCount: 14,
                    separatorBuilder: (BuildContext context, int index) =>
                        Container(
                          height: 1,
                          color: Colors.grey,
                        )),
                Container(
                  color: Colors.grey[200],
                  width: double.infinity,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Final Bill'.tr),
                      Text('16.000.000 '),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  catItemBuilder(context, index) {
    return InkWell(
      onTap: () {
        Get.toNamed('/orderdetails', arguments: {'id' : index});
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                '#001',
                style: TextStyle(fontSize: 18, color: cyan600),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Column(
              children: [
                Text('Patient Name:'.tr + ' ' + 'Sali'.tr),
                Text('Date:'.tr + ' ' + '5/4/2024'),
              ],
            ),
            Text(
              '6,000,000',
              style: TextStyle(fontSize: 22, color: cyan400),
            ),
          ],
        ),
      ),
    );
  }
}
