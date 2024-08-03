import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:xml/xml.dart';

import '../../shared/component/constants.dart';

typedef Data = ({
  Size size,
  Map<int, Tooth> teeth,
  Map<int, ToothConnection> connections
});

class TeethSelectionScreen extends StatefulWidget {
  const TeethSelectionScreen({
    super.key,
    required this.asset,
    //required this.generateToothId,
  });
  final String asset;
  //final int Function(int id) generateToothId;

  @override
  State<TeethSelectionScreen> createState() => _TeethState();
}

class _TeethState extends State<TeethSelectionScreen> {
  Data data = (size: Size.zero, teeth: {}, connections: {});

  @override
  void initState() {
    super.initState();
    loadTeeth(widget.asset).then((value) {
      setState(() => data = value);
    });
  }

  Set<Tooth> getSelectedTeeth() {
    return data.teeth.values.where((tooth) => tooth.selected).toSet();
  }

  Set<ToothConnection> getSelectedConnections() {
    return data.connections.values
        .where((connection) => connection.selected)
        .toSet();
  }

  bool canEstablishConnection(ToothConnection connection) {
    final tooth1 = data.teeth.values
        .firstWhere((tooth) => tooth.id == connection.tooth1Id);
    final tooth2 = data.teeth.values
        .firstWhere((tooth) => tooth.id == connection.tooth2Id);
    return tooth1.selected &&
        tooth2.selected &&
        tooth1.material == tooth2.material;
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
              tooth.treatment = 'Crown';
              _showAlertDialog2(context, tooth);
            },
            child: Text('Crown'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              tooth.treatment = 'Pontic';
              _showAlertDialog2(context, tooth);
            },
            child: Text('Pontic'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              tooth.treatment = 'Implant';
              _showAlertDialog2(context, tooth);
            },
            child: Text('Implant'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              tooth.treatment = 'Veneer';
              _showAlertDialog2(context, tooth);
            },
            child: Text('Veneer'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              tooth.treatment = 'Inlay';
              _showAlertDialog2(context, tooth);
            },
            child: Text('Inlay'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              tooth.treatment = 'Denture';
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
              tooth.material = 'Zircon';
              setState(() => tooth.selected = !tooth.selected);
            },
            child: Text('Zircon'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              tooth.material = 'Metal';
              setState(() => tooth.selected = !tooth.selected);
            },
            child: Text('Metal'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              tooth.material = 'Wax';
              setState(() => tooth.selected = !tooth.selected);
            },
            child: Text('Wax'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              tooth.material = 'Acrylic PMMA';
              setState(() => tooth.selected = !tooth.selected);
            },
            child: Text('Acrylic PMMA'.tr),
          ),
        ],
      ),
    );
  }

  _showClearDialog(BuildContext context, Tooth tooth) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
                content: const Text('Clear the selected tooth?'),
                actions: <CupertinoDialogAction>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        tooth.selected = !tooth.selected;
                        for (final connection in data.connections.values) {
                          if (connection.tooth1Id == tooth.id ||
                              connection.tooth2Id == tooth.id) {
                            connection.selected = false;
                          }
                        }
                      });
                    },
                    child: const Text('Clear Tooth',
                        style: TextStyle(color: Colors.red)),
                  )
                ]));
  }

  @override
  Widget build(BuildContext context) {
    if (data.size == Size.zero) return const UnconstrainedBox();

    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
            icon: const Icon(Icons.menu),
            itemBuilder: (context) => [
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: const Text(
                              "Modify profile",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => ()),
                ]),
        elevation: 0,
        backgroundColor: cyan200,
        title: Text(
          'New Order'.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            icon: Icon(Icons.arrow_back),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FittedBox(
              child: SizedBox.fromSize(
                size: data.size,
                child: Stack(
                  children: [
                    // teeth
                    for (final MapEntry(key: key, value: tooth)
                        in data.teeth.entries)
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
                                      fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      ), // connections
                    for (final MapEntry(key: key, value: connection)
                        in data.connections.entries)
                      Positioned.fromRect(
                        rect: connection.rect,
                        child: Tooltip(
                          message:
                              'connection between tooth ${(connection.tooth1Id)} and tooth ${(connection.tooth2Id)}',
                          textAlign: TextAlign.center,
                          preferBelow: false,
                          decoration: const BoxDecoration(
                            color: Colors.black87,
                            border: Border.symmetric(
                                horizontal: BorderSide(color: Colors.white54)),
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
                                          blurRadius: 4, offset: Offset(0, 6))
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
                                  if (canEstablishConnection(connection)) {
                                    setState(() => connection.selected =
                                        !connection.selected);
                                    print(
                                        'connection ${(connection.tooth1Id)} - ${(connection.tooth2Id)} pressed (id $key)');
                                  } else {
                                    // Show a message or handle the case where the connection cannot be established
                                    print(
                                        'Cannot establish connection between ${(connection.tooth1Id)} and ${(connection.tooth2Id)}');
                                  }
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
                  final selectedTeeth = getSelectedTeeth();
                  for (Tooth t in selectedTeeth) {
                    print(t.id.toString() +
                        '\n' +
                        t.material! +
                        '\n' +
                        t.treatment!);
                  }
                  final selectedConnections = getSelectedConnections();
                  for (ToothConnection c in selectedConnections) {
                    print(c.id.toString() +
                        '\n' +
                        c.tooth1Id.toString() +
                        '\n' +
                        c.tooth2Id.toString());
                  }
                })
          ],
        ),
      ),
    );
  }
}

Future<Data> loadTeeth(String asset) async {
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
      // Example: Create connections based on some logic
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

class Tooth {
  Tooth(this.id, Path originalPath) {
    rect = originalPath.getBounds();
    path = originalPath.shift(-rect.topLeft);
  }

  final int id;
  late final Path path;
  late final Rect rect;
  bool selected = false;
  String? treatment;
  String? material;

  Color get color {
    switch (treatment) {
      case 'Crown':
        return cyan400;
      case 'Pontic':
        return Colors.pink.shade400;
      case 'Implant':
        return Colors.green.shade400;
      case 'Veneer':
        return Colors.orange.shade400;
      case 'Inlay':
        return Colors.purple.shade400;
      case 'Denture':
        return Colors.red.shade400;
      default:
        return Colors.white;
    }
  }

  void PrintToothDeets() {
    print('id = ' + id.toString());
    print('treatment = ' + treatment!);
    print('material = ' + material!);
  }
}

class ToothConnection {
  ToothConnection(
      this.id, this.tooth1Id, this.tooth2Id, this.rect, Path originalPath) {
    rect = originalPath.getBounds();
    path = originalPath.shift(-rect.topLeft);
  }

  final int id;
  final int tooth1Id;
  final int tooth2Id;
  Path? path;
  Rect rect;

  bool selected = false;
}

class ToothBorder extends ShapeBorder {
  const ToothBorder(this.path);

  final Path path;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      getOuterPath(rect);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return rect.topLeft == Offset.zero ? path : path.shift(rect.topLeft);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black54;
    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) => this;
}

int generateToothId(int id) {
  int number = switch (id) {
    < 8 => 8 - id + 10,
    < 16 => id - 8 + 1 + 20,
    < 24 => 24 - id + 30,
    < 32 => id - 24 + 1 + 40,
    _ => id
  };
  return number;
}

(int, int) generateConnectionIds(int id) {
  int id1 = switch (id) {
    < 107 => (18 - (id - 100)),
    == 107 => 11,
    <= 114 => (21 + (id - 108)),
    < 122 => (37 - (id - 115)),
    == 122 => 31,
    < 130 => (41 + (id - 123)),
    _ => id,
  };
  int id2 = switch (id) {
    < 107 => (17 - (id - 100)),
    == 107 => 21,
    <= 114 => (22 + (id - 108)),
    < 122 => (38 - (id - 115)),
    == 122 => 41,
    < 130 => (42 + (id - 123)),
    _ => id,
  };
  return (id1, id2);
}
