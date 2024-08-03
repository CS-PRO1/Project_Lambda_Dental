import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:project_lambda_dental/Controller/Cases/TeethController.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:xml/xml.dart';

import '../../shared/component/constants.dart';

class TeethSelectionScreen extends StatelessWidget {
  TeethSelectionScreen({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final String asset;
  final TeethController controller = Get.put(TeethController());

  @override
  Widget build(BuildContext context) {
    controller.loadTeeth(asset);

    return Scaffold(
      appBar: 
            MyAppBar(title: 'Tooth Selection'),

      // AppBar(
      //   leading: PopupMenuButton(
      //     icon: const Icon(Icons.menu),
      //     itemBuilder: (context) => [
      //       PopupMenuItem(
      //         child: Row(
      //           children: [
      //             Icon(Icons.account_circle, color: Colors.black),
      //             SizedBox(width: 10),
      //             Text(
      //               "Modify profile",
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 19,
      //               ),
      //             ),
      //           ],
      //         ),
      //         onTap: () => (),
      //       ),
      //     ],
      //   ),
      //   elevation: 0,
      //   backgroundColor: cyan200,
      //   title: Text(
      //     'New Order'.tr,
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () => Navigator.of(context).pop(),
      //       icon: Icon(Icons.arrow_back),
      //     )
      //   ],
      // ),
      body: GetBuilder<TeethController>(
        builder: (controller) {
          if (controller.data.value.size == Size.zero) {
            return const UnconstrainedBox();
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                FittedBox(
                  child: SizedBox.fromSize(
                    size: controller.data.value.size,
                    child: Stack(
                      children: [
                        // teeth
                        for (final MapEntry(key: key, value: tooth)
                            in controller.data.value.teeth.entries)
                          Positioned.fromRect(
                            rect: tooth.rect,
                            child: Stack(
                              children: [
                                Tooltip(
                                  message: 'tooth\n${tooth.id}',
                                  textAlign: TextAlign.center,
                                  preferBelow: false,
                                  decoration: const BoxDecoration(
                                    color: Colors.black87,
                                    border: Border.symmetric(
                                        horizontal:
                                            BorderSide(color: Colors.white54)),
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: tooth.selected
                                          ? tooth.color
                                          : Colors.white,
                                      shadows: tooth.selected
                                          ? [
                                              const BoxShadow(
                                                  blurRadius: 4,
                                                  offset: Offset(0, 6))
                                            ]
                                          : null,
                                      shape: ToothBorder(tooth.path),
                                    ),
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: InkWell(
                                        splashColor: tooth.selected
                                            ? Colors.white
                                            : Colors.teal.shade100,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          if (!tooth.selected) {
                                            _showAlertDialog(context, tooth);
                                          } else {
                                            _showClearDialog(context, tooth);
                                          }
                                          print(
                                              'tooth ${tooth.id} pressed (id $key)');
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      '${tooth.id}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        // connections
                        for (final MapEntry(key: key, value: connection)
                            in controller.data.value.connections.entries)
                          Positioned.fromRect(
                            rect: connection.rect,
                            child: Tooltip(
                              message:
                                  'connection between tooth ${connection.tooth1Id} and tooth ${connection.tooth2Id}',
                              textAlign: TextAlign.center,
                              preferBelow: false,
                              decoration: const BoxDecoration(
                                color: Colors.black87,
                                border: Border.symmetric(
                                    horizontal:
                                        BorderSide(color: Colors.white54)),
                              ),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: connection.selected
                                      ? Colors.teal.shade400
                                      : Colors.white,
                                  shadows: connection.selected
                                      ? [
                                          const BoxShadow(
                                              blurRadius: 4,
                                              offset: Offset(0, 6))
                                        ]
                                      : null,
                                  shape: ToothBorder(connection.path!),
                                ),
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    splashColor: connection.selected
                                        ? Colors.white
                                        : Colors.teal.shade100,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      controller.toggleConnectionSelection(
                                          connection);
                                      print(
                                          'connection ${connection.tooth1Id} - ${connection.tooth2Id} pressed (id $key)');
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                defaultButton(
                  text: 'Send',
                  function: () {
                    final selectedTeeth = controller.getSelectedTeeth();
                    for (Tooth t in selectedTeeth) {
                      print('${t.id}\n${t.material}\n${t.treatment}');
                    }
                    final selectedConnections =
                        controller.getSelectedConnections();
                    for (ToothConnection c in selectedConnections) {
                      print('${c.id}\n${c.tooth1Id}\n${c.tooth2Id}');
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _showAlertDialog(BuildContext context, Tooth tooth) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: Text('Choose the treatment'.tr),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              controller.setToothTreatment(tooth, 'Crown');
              _showAlertDialog2(context, tooth);
            },
            child: Text('Crown'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              controller.setToothTreatment(tooth, 'Pontic');
              _showAlertDialog2(context, tooth);
            },
            child: Text('Pontic'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              controller.setToothTreatment(tooth, 'Implant');
              _showAlertDialog2(context, tooth);
            },
            child: Text('Implant'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              controller.setToothTreatment(tooth, 'Veneer');
              _showAlertDialog2(context, tooth);
            },
            child: Text('Veneer'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              controller.setToothTreatment(tooth, 'Inlay');
              _showAlertDialog2(context, tooth);
            },
            child: Text('Inlay'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              controller.setToothTreatment(tooth, 'Denture');
              _showAlertDialog2(context, tooth);
            },
            child: Text('Denture'.tr),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog2(BuildContext context, Tooth tooth) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: Text('Choose the material:'.tr),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              controller.setToothMaterial(tooth, 'Zircon');
              controller.toggleToothSelection(tooth);
            },
            child: Text('Zircon'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              controller.setToothMaterial(tooth, 'Metal');
              controller.toggleToothSelection(tooth);
            },
            child: Text('Metal'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              controller.setToothMaterial(tooth, 'Wax');
              controller.toggleToothSelection(tooth);
            },
            child: Text('Wax'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              controller.setToothMaterial(tooth, 'Acrylic PMMA');
              controller.toggleToothSelection(tooth);
            },
            child: Text('Acrylic PMMA'.tr),
          ),
        ],
      ),
    );
  }

  void _showClearDialog(BuildContext context, Tooth tooth) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: const Text('Clear the selected tooth?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              controller.clearTooth(tooth);
            },
            child:
                const Text('Clear Tooth', style: TextStyle(color: Colors.red)),
          )
        ],
      ),
    );
  }
}

Future<Data> loadTeethData(String asset) async {
  final xml = await rootBundle.loadString(asset);

  final doc = XmlDocument.parse(xml);
  final viewBox = doc.rootElement.getAttribute('viewBox')!.split(' ');
  final w = double.parse(viewBox[2]);
  final h = double.parse(viewBox[3]);

  final teeth = doc.rootElement.findAllElements('path');
  final connections = <int, ToothConnection>{};

  for (final tooth in teeth) {
    final id = int.parse(tooth.getAttribute('id')!);
    if (id >= 100) {
      connections[id] = ToothConnection(
        id,
        generateConnectionIds(id).$1,
        generateConnectionIds(id).$2,
        Rect.fromLTWH(0, 0, 50, 50),
        parseSvgPathData(tooth.getAttribute('d')!),
      );
    }
  }

  return (
    size: Size(w, h),
    teeth: <int, Tooth>{
      for (final tooth in teeth)
        if (int.parse(tooth.getAttribute('id')!) < 100)
          int.parse(tooth.getAttribute('id')!): Tooth(
            generateToothId(int.parse(tooth.getAttribute('id')!)),
            parseSvgPathData(tooth.getAttribute('d')!),
          ),
    },
    connections: connections,
  );
}
