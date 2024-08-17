import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/Bills/BillsController.dart';
import 'package:project_lambda_dental/shared/component/components.dart';

class BillsSearchScreen extends GetView {
  BillsSearchScreen({super.key});
  final BillsController controller = Get.put(BillsController());
  DateTime beginDate = DateTime.now().subtract(Duration(days: 7));
  DateTime endDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    controller.getAllBills();

    return GetBuilder(
      init: controller,
      builder: (controller) => Scaffold(
        appBar: MyAppBar(
          title: 'Find Bill',
          leading: AppBarPopupMenu(),
          actions: [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter Begin Date: ',
                  ),
                  datePicker(beginDate, context),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter End Date: ',
                  ),
                  datePicker(endDate, context),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              defaultButton(
                  text: "Search",
                  function: () {
                    controller.searchBill(beginDate, endDate);
                  }),
              BuildCondition(
                condition: controller.searchbillsListModel != null,
                fallback: (context) => Container(),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BuildCondition(
                    condition: controller.billsListModel!.data.isNotEmpty,
                    fallback: (context) => Center(
                      child: Text('No Bills were added yet..'),
                    ),
                    builder: (context) => ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) =>
                            catItemBuilder(context, index),
                        itemCount: controller.billsListModel!.data.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Container(
                              height: 1,
                              color: Colors.grey,
                            )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  catItemBuilder(context, index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () => Get.toNamed('billdetails', arguments: {'id': index}),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Bill '.tr +
                    controller.billsListModel!.data[index].case_id.toString(),
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Column(
              children: [
                Text('date: ' +
                    controller.billsListModel!.data[index].created_at
                        .toString()
                        .substring(0, 10)),
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
