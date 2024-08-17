import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/Bills/BillsController.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class BillDetailsScreen extends GetView {
  BillDetailsScreen({super.key});
  final int id = Get.arguments['id'];
  BillsController controller = Get.put(BillsController());

  @override
  Widget build(BuildContext context) {
    controller.getAllBills();
    return GetBuilder(
      init: BillsController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text('Bill'.tr + id.toString()),
        ),
        body: BuildCondition(
          condition: controller.billsListModel != null,
          fallback: (context) => Center(child: CircularProgressIndicator()),
          builder: (context) => SingleChildScrollView(
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
                        // Text(controller.billDetailsController!.data!.total_price
                        //     .toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  catItemBuilder(context, index) {
    return InkWell(
      onTap: () {
        Get.toNamed('/orderdetails', arguments: {'id': index});
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                controller.billsListModel!.data[index].case_id.toString(),
                style: TextStyle(fontSize: 18, color: cyan600),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Column(
              children: [
                Text('Patient Name:'.tr +
                    ' ' +
                    controller.billsListModel!.data[index].patient_name
                        .toString()),
                Text('Date:'.tr +
                    ' ' +
                    controller.billsListModel!.data[index].created_at
                        .toString()),
              ],
            ),
            Text('Total Bill:' +
                controller.billsListModel!.data[index].total_price.toString()),
            //style: TextStyle(fontSize: 22, color: cyan400),
          ],
        ),
      ),
    );
  }
}
