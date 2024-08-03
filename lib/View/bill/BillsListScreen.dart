import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Controller/Bills/BillsController.dart';
import 'package:project_lambda_dental/shared/component/components.dart';

class BillsListScreen extends GetView {
  const BillsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BillsController(),
      builder: (controller) => Scaffold(
        appBar: MyAppBar(
          title: 'Bills',
          leading: AppBarPopupMenu(),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  catItemBuilder(context, index),
              itemCount: 40,
              separatorBuilder: (BuildContext context, int index) => Container(
                    height: 1,
                    color: Colors.grey,
                  )),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.cyan[200],
        //   child: Icon(Icons.add),
        //   onPressed: () {
        //     Get.toNamed('/bills');
        //   },
        // ),
      ),
    );
  }

  catItemBuilder(context, index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () => Get.toNamed('billdetails'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Bill'.tr + ' 001',
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Column(
              children: [
                Text('date from:' + ' 18/4/2024'),
                Text('date to:' + ' 20/4/2024'),
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
