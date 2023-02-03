import 'package:erb_system/size_config.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manger.dart';

class DefaultTable extends StatelessWidget {
  DefaultTable(
      {Key? key,
      required this.columnData,
      required this.rows,
      this.icon,
      this.color,
      this.size});

  List<String> columnData;
  List<DataRow> rows;
  Widget? icon;
  double? size = 56;
  Color? color = ColorManager.second;

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columnSpacing: size,
        headingRowHeight: 80,
        border: const TableBorder(
            top: BorderSide(color: Colors.black, width: 1),
            right: BorderSide(color: Colors.black, width: 1),
            bottom: BorderSide(color: Colors.black, width: 1),
            left: BorderSide(color: Colors.black, width: 1),
            horizontalInside: BorderSide(color: Colors.black, width: 1),
            verticalInside: BorderSide(color: Colors.black, width: 1)),
        headingRowColor: MaterialStateProperty.all(color),
        columns: List.generate(
            columnData.length,
            (index) => DataColumn(
                label: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(columnData[index],
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionateScreenWidth(4))),
                    ),
                    icon ?? Container(),
                  ],
                ),
                tooltip: '')),
        rows: rows);
  }
}
