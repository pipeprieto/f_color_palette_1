import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../utils/color_utils.dart';
import '../widgets/color_palette.dart';

class ColorSelectionPage extends StatelessWidget {
  const ColorSelectionPage({Key? key}) : super(key: key);
  //List<String> baseColors;
  void showDialog() {
    Get.dialog(const AlertDialog(
      title: Text('Flutter'),
      content: Text('Dialog'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Color palette app'),
          actions: [
            IconButton(onPressed: showDialog, icon: Icon(Icons.info_outline))
          ],
        ),
        // https://colorhunt.co/
        body: (Center(
            child: SingleChildScrollView(
          child: Column(children: [
            ColorPalette(
                baseColor: ["#C0B236", "#D9CB50", "#F0E161", "#FFF38C"]),
            ColorPalette(
                baseColor: ["#8FE3CF", "#256D85", "#2B4865", "#002B5B"]),
            ColorPalette(
                baseColor: ["#000000", "#59CE8F", "#E8F9FD", "#FF1E00"])
          ]),
        )
            //"SingleChildScrollView -> Column -> [ColorPalette, ColorPalette] ",
            )));
  }

  // está es la función que será llamada con cada click a un ColorPalette
  void showColor(String value) {
    Clipboard.setData(ClipboardData(text: value));
    Get.snackbar(
      'Color palette',
      'Valor copiado',
      backgroundColor: ColorUtils.FromHex(value),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
