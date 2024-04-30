import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

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
        leading: PopupMenuButton(
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
                ]),
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
        title: Text('Cases'.tr),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
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
        backgroundColor: cyan200,
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed('/addorder');
        },
      ),
    );
  }

  catItemBuilder(context, index) {
    return InkWell(
      onTap: () => Get.toNamed('/orderdetails'),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
                  Text('2024/12/9'.tr),
                  Text('Status: Ready'.tr),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
