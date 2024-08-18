import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_lambda_dental/Cache/CacheHelper.dart';
import 'package:project_lambda_dental/Services/dio.dart';
import 'package:project_lambda_dental/View/case/TeethSelectionScreen.dart';

import '../../shared/component/constants.dart';

typedef Data = ({
  Size size,
  Map<int, Tooth> teeth,
  Map<int, ToothConnection> connections
});

class TeethController extends GetxController {
  Rx<Data> data = Rx<Data>((size: Size.zero, teeth: {}, connections: {}));

  void loadTeeth(String asset) async {
    data.value = await loadTeethData(asset);
    update();
  }

  Set<Tooth> getSelectedTeeth() {
    return data.value.teeth.values.where((tooth) => tooth.selected).toSet();
  }

  Set<ToothConnection> getSelectedConnections() {
    return data.value.connections.values
        .where((connection) => connection.selected)
        .toSet();
  }

  bool canEstablishConnection(ToothConnection connection) {
    final tooth1 = data.value.teeth.values
        .firstWhere((tooth) => tooth.id == connection.tooth1Id);
    final tooth2 = data.value.teeth.values
        .firstWhere((tooth) => tooth.id == connection.tooth2Id);
    return tooth1.selected &&
        tooth2.selected &&
        tooth1.material == tooth2.material;
  }

  void toggleToothSelection(Tooth tooth) {
    tooth.selected = !tooth.selected;
    update();
  }

  void setToothTreatment(Tooth tooth, String treatment) {
    tooth.treatment = treatment;
    update();
  }

  void setToothMaterial(Tooth tooth, String material) {
    tooth.material = material;
    update();
  }

  void toggleConnectionSelection(ToothConnection connection) {
    if (canEstablishConnection(connection)) {
      connection.selected = !connection.selected;
      update();
    } else {
      print(
          'Cannot establish connection between ${connection.tooth1Id} and ${connection.tooth2Id}');
    }
  }

  void clearTooth(Tooth tooth) {
    tooth.selected = false;
    tooth.treatment = null;
    tooth.material = null;
    for (final connection in data.value.connections.values) {
      if (connection.tooth1Id == tooth.id || connection.tooth2Id == tooth.id) {
        connection.selected = false;
      }
    }
    update();
  }

  Map<String, dynamic> convertSelectedTeethToApiFormat(
      Set<Tooth> selectedTeeth, Set<ToothConnection> selectedConnections) {
    // Define the order of treatments and materials as they appear in the popup menu
    const treatments = [
      'Crown',
      'Pontic',
      'Implant',
      'Veneer',
      'Inlay',
      'Denture'
    ];
    const materials = ['Zircon', 'Metal', 'Wax', 'Acrylic PMMA'];

    int count = 0;
    // Create the tcooth_number array
    List<List<int>> toothNumber = selectedTeeth.map((tooth) {
      int treatmentIndex = treatments.indexOf(tooth.treatment!) + 1;
      int materialIndex = materials.indexOf(tooth.material!) + 1;
      count++;
      return [tooth.id, treatmentIndex, materialIndex];
    }).toList();

    // Create the bridge array
    List<int> bridge = selectedTeeth.map((tooth) {
      count;
      bool isConnected = selectedConnections.any((connection) =>
          connection.tooth1Id == tooth.id || connection.tooth2Id == tooth.id);
      return isConnected ? 1 : 0;
    }).toList();

    // Create the final map to be sent to the API
    Map<String, dynamic> apiData = {
      'case_id': CacheHelper.get('case_id'),
      "tooth_number": toothNumber,
      "bridge": bridge,
    };

    return apiData;
  }

  void sendTeeth() {
    final selectedTeeth = getSelectedTeeth();
    final selectedConnections = getSelectedConnections();
    final apiData =
        convertSelectedTeethToApiFormat(selectedTeeth, selectedConnections);
    print(apiData.toString());
    String token = CacheHelper.get('token');
    DioHelper.postData('add_teeth', apiData, token: token).then((value) {
      print('message: ' + value?.data['message']);
    }).catchError((error) {
      print('error: ' + error.toString());
    });
  }
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
