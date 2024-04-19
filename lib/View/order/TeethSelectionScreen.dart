import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:project_lambda_dental/shared/component/components.dart';
import 'package:xml/xml.dart';

import '../../shared/component/constants.dart';

typedef Data = ({Size size, Map<int, Tooth> teeth});

class TeethSelectionScreen extends StatefulWidget {
  const TeethSelectionScreen({
    super.key,
    required this.asset,
    required this.idToString,
  });
  final String asset;
  final String Function(int id) idToString;

  @override
  State<TeethSelectionScreen> createState() => _TeethState();
}

class _TeethState extends State<TeethSelectionScreen> {
  Data data = (size: Size.zero, teeth: {});

  @override
  void initState() {
    super.initState();
    loadTeeth(widget.asset).then((value) {
      setState(() => data = value);
    });
  }

  void _showAlertDialog(BuildContext context, Tooth tooth) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        //title: const Text('Alert'),
        content: const Text('Choose the treatment :'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              _showAlertDialog2(context, tooth);
            },
            child: const Text('Crown'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              _showAlertDialog2(context, tooth);
            },
            child: const Text('Pontic'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              _showAlertDialog2(context, tooth);
            },
            child: const Text('Implant'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              _showAlertDialog2(context, tooth);
            },
            child: const Text('Veneer'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              _showAlertDialog2(context, tooth);
            },
            child: const Text('Inlay'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              _showAlertDialog2(context, tooth);
            },
            child: const Text('Denture'),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog2(BuildContext context, Tooth tooth) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        //title: const Text('Alert'),
        content: const Text('Choose the treatment :'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              setState(() => tooth.selected = !tooth.selected);
            },
            child: const Text('Zircon'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              setState(() => tooth.selected = !tooth.selected);
            },
            child: const Text('Metal'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              setState(() => tooth.selected = !tooth.selected);
            },
            child: const Text('Wax'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              setState(() => tooth.selected = !tooth.selected);
            },
            child: const Text('Acrylic PMMA'),
          ),
          // CupertinoDialogAction(
          //   isDestructiveAction: true,
          //   onPressed: () {
          //     Get.offAndToNamed('/');
          //   },
          //   child: const Text('Done'),
          // ),
        ],
      ),
    );
  }

  _showClearDialog(BuildContext context, Tooth tooth) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
                //title: const Text('Alert'),
                content: const Text('Clear the selected tooth?'),
                actions: <CupertinoDialogAction>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() => tooth.selected = !tooth.selected);
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
                        child: Tooltip(
                          message: 'tooth\n${widget.idToString(key)}',
                          textAlign: TextAlign.center,
                          preferBelow: false,
                          decoration: const BoxDecoration(
                            color: Colors.black87,
                            border: Border.symmetric(
                                horizontal: BorderSide(color: Colors.white54)),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 750),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: tooth.selected
                                  ? Colors.teal.shade400
                                  : Colors.white,
                              shadows: tooth.selected
                                  ? [
                                      const BoxShadow(
                                          blurRadius: 4, offset: Offset(0, 6))
                                    ]
                                  : null,
                              shape: ToothBorder(tooth.path),
                            ),
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(
                                splashColor: tooth.selected
                                    ? Colors.white
                                    : Colors.teal.shade400,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  if (!tooth.selected)
                                    _showAlertDialog(context, tooth);
                                  else
                                    _showClearDialog(context, tooth);

                                  print(
                                      'tooth ${widget.idToString(key)} pressed (id $key)');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    // selected teeth list
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 125, vertical: 150),
                      child: Center(
                        child: Builder(builder: (context) {
                          final selected = data.teeth.entries
                              .where((e) => e.value.selected)
                              .map((e) => Text(widget.idToString(e.key)))
                              .toList();
                          return DefaultTextStyle(
                            style: Theme.of(context).textTheme.headlineMedium!,
                            textAlign: TextAlign.center,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: selected.isNotEmpty ? 1 : 0,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  border: Border.symmetric(
                                      horizontal: BorderSide(
                                          width: 3, color: Colors.black26)),
                                ),
                                // child: ListView(
                                //   shrinkWrap: true,
                                //   children: selected,
                                // ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            defaultButton(text: 'Send', function: () {})
          ],
        ),
      ),
    );
  }

  Future<Data> loadTeeth(String asset) async {
    final xml = await rootBundle.loadString(asset);

    final doc = XmlDocument.parse(xml);
    final viewBox = doc.rootElement.getAttribute('viewBox')!.split(' ');
    final w = double.parse(viewBox[2]);
    final h = double.parse(viewBox[3]);

    final teeth = doc.rootElement.findAllElements('path');
    //print('loaded ${teeth.length} paths');
    return (
      size: Size(w, h),
      teeth: <int, Tooth>{
        for (final tooth in teeth)
          int.parse(tooth.getAttribute('id')!):
              Tooth(parseSvgPathData(tooth.getAttribute('d')!)),
      },
    );
  }
}

class Tooth {
  Tooth(Path originalPath) {
    rect = originalPath.getBounds();
    path = originalPath.shift(-rect.topLeft);
  }

  late final Path path;
  late final Rect rect;
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
