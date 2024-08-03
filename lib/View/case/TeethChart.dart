import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:project_lambda_dental/Controller/Cases/TeethController.dart';
import 'package:project_lambda_dental/shared/component/constants.dart';

class TeethDisplayWidget extends StatelessWidget {
  TeethDisplayWidget({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final String asset;
  final TeethController controller = Get.put(TeethController());

  @override
  Widget build(BuildContext context) {
    controller.loadTeeth(asset);

    return GetBuilder<TeethController>(
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
                              AnimatedContainer(
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
                                          blurRadius: 4, offset: Offset(0, 6))
                                    ]
                                  : null,
                              shape: ToothBorder(connection.path!),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
