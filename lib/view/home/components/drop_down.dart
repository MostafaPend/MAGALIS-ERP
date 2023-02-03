import 'package:erb_system/size_config.dart';
import 'package:flutter/material.dart';

class dropDown extends StatelessWidget {
  const dropDown(this.items,
      {this.width = 150,
      this.height = 40,
      this.bgColor,
      this.foColor,
      this.label,
      required this.onchanged,
      this.dpColor,
      this.borderWidth = 0,
      this.borderColor,
      this.radius = 10,
      this.selectTalab});

  final List<String> items;
  final double width;
  final double height;
  final double borderWidth;
  final Color? borderColor;
  final Color? dpColor;
  final Color? bgColor;
  final Color? foColor;
  final double radius;
  final String? selectTalab;
  final String? label;
  final Function() onchanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
          child: Container(
        width: double.infinity,
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(radius)),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon:  Icon(
                Icons.arrow_drop_down_outlined,
                color: Colors.white,
                size: getProportionateScreenWidth(6),
              ),
              items: items
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Container(
                          // padding: const EdgeInsets.all(8),

                          child: Text(
                            e,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              color: foColor,
                              fontSize: getProportionateScreenWidth(4),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              value: selectTalab,
              onChanged: onchanged(),
              hint: Text(
                '$label',
                style: TextStyle(color: foColor),
              ),
              borderRadius: BorderRadius.circular(radius),
              dropdownColor: dpColor,
              style: TextStyle(
                color: Color(0xff82225E),
                fontSize: getProportionateScreenWidth(4),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
