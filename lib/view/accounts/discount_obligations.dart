import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

class DiscountObligations extends StatefulWidget {
  const DiscountObligations({Key? key}) : super(key: key);

  @override
  State<DiscountObligations> createState() => _DiscountObligationsState();
}

class _DiscountObligationsState extends State<DiscountObligations> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "سيارات",
      "2": "متداول",
      "3": "٣٠٠٠٠",
    },
    {
      "1": "سيارات",
      "2": "متداول",
      "3": "٣٠٠٠٠",
    },
    {
      "1": "سيارات",
      "2": "متداول",
      "3": "٣٠٠٠٠",
    },
    {
      "1": "سيارات",
      "2": "متداول",
      "3": "٣٠٠٠٠",
    },
  ];

  List<String> columnData = [
    "القيمة",
    "الالتزام",
    "الالتزام",
  ];
  double total = 0;
  Map<String, Map<String, dynamic>> result = {};
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('liabilities')
        .get()
        .then((value) => value.docs.forEach((element) {
              setState(() {
                result[element.id] = element.data();
                total = total + int.parse(element.data()['amount']);
              });
            }));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    return SafeArea(
        child: Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          DefaultContainer(title: 'الخصوم و الالتزامات'),
                          const SizedBox(
                            height: 50,
                          ),
                          DefaultTable(
                              columnData: columnData,
                              size: getProportionateScreenWidth(40),
                              color: ColorManager.second,
                              rows: [
                                ...result.keys
                                    .map((data) => DataRow(cells: [
                                          DataCell(Text(
                                            (result[data]?['amount'])
                                                .toString(),
                                            style: style,
                                          )),
                                          DataCell(Text(
                                            'ايرادي',
                                            style: style,
                                          )),
                                          DataCell(Text(
                                            (result[data]?['name']).toString(),
                                            style: style,
                                          )),
                                        ]))
                                    .toList(),
                                DataRow(
                                    color: MaterialStateProperty.all(
                                        ColorManager.primary),
                                    cells: [
                                      DataCell(Text(
                                        total.toString(),
                                        style: TextStyle(
                                            color: ColorManager.white,
                                            fontSize:
                                                getProportionateScreenWidth(5),
                                            fontWeight: FontWeight.w800),
                                      )),
                                      DataCell(Text(
                                        '',
                                        style: style,
                                      )),
                                      DataCell(
                                          Container(
                                            color: ColorManager.primary,
                                            child: Text(
                                              'الاجمالي',
                                              style: TextStyle(
                                                  color: ColorManager.white,
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          5),
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          placeholder: true),
                                    ])
                              ]),
                          const SizedBox(
                            height: 50,
                          ),
                          // Botton(
                          //   bgColor: Colors.black,
                          //   color: Colors.white,
                          //   title: 'المزيد',
                          //   onTap: () {},
                          // )
                        ],
                      ),
                    ),
                  ),
                  DefaultAppBar()
                ],
              )),
          Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                  ),
                  child: DropDownList())),
        ],
      ),
    ));
  }
}
