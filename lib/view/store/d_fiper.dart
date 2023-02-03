import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class DDetails extends StatelessWidget {
  DDetails({Key? key}) : super(key: key);
  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "3000",
      "8": "موظف احمد",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "3000",
      "8": "موظف احمد",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "3000",
      "8": "موظف احمد",
    },
  ];

  List<String> columnData = [
    "الموظف المسؤل",
    "التكلفة االجمالية",
    "تكلفة الوحدة",
    "وحدة القياس",
    "الكمية",
    "المرجع",
    "الحركة",
    "التاريخ",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        DefaultContainer(title: 'كل صرف التالف للفايبر'),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTable(
              columnData: columnData,
              size: getProportionateScreenWidth(10),
              color: ColorManager.second,
              rows: data
                  .map((data) => DataRow(cells: [
                DataCell(Text(
                  data['8'],
                )),
                DataCell(Text(
                  data['7'],
                )),
                DataCell(Text(
                  data['6'],
                )),
                DataCell(Text(
                  data['5'],
                )),
                DataCell(Text(
                  data['4'],
                )),
                DataCell(Text(
                  data['3'],
                )),
                DataCell(Text(
                  data['2'],
                )),
                DataCell(Text(
                  data['1'],
                )),
              ]))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}
