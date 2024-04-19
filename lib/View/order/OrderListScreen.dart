import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListScreen extends GetView {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var cubit = AppCubit().get(context);
    //cubit.getCategory();
    // return BlocConsumer<AppCubit, AppStates>(
    //   listener: (context, state) {},
    //   builder: (context, state) => Scaffold(
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('Orders'.tr),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[200],
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed('/addorder');
        },
      ),
    );
  }

  catItemBuilder(context, index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          Get.toNamed('/orderdetails');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Patient Name'.tr,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Column(
              children: [
                Text('Number'.tr),
                Container(
                    // color: Colors.grey,
                    // width: double.infinity,
                    // height: 1,
                    ),
                Text('Status'.tr),
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
