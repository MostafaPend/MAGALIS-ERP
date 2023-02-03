import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:flutter/material.dart';

class Botton extends StatelessWidget {
  Botton(
      {Key? key,
      required this.color,
      required this.title,
      required this.onTap,
      required this.bgColor,
      this.check,
      this.top,
      this.right})
      : super(key: key);
  double? top = 8;
  double? right = 8;
  String title;
  Color color;
  Color bgColor;
  Function() onTap;
  bool? check = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onTap(),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(bgColor)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(title,
              style: getSemiBoldStyleAR(
                  color: color, fontSize: getProportionateScreenWidth(5))),
        ));
  }
}
