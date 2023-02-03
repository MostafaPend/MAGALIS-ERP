import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultBotton extends StatelessWidget {
  DefaultBotton(
      {Key? key,
        required this.color,
        required this.title,
        required this.onTap,
        this.check,
        this.top,
        this.right})
      : super(key: key);
  double? top = 8;
  double? right = 8;
  String title;
  Color color;
  Function() onTap;
  bool? check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:  Color(0xff82225E),
      ),

      child: Center(
        child: GestureDetector(
            onTap: () => onTap(),

            child: Text(title, style: getSemiBoldStyleAR(color: color,fontSize:15))),
      ),
    );
  }
}