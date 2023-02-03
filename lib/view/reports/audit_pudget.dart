import 'package:erb_system/merge_table/merge_table.dart';
import 'package:erb_system/merge_table/src/datas/m_row.dart';
import 'package:erb_system/merge_table/src/datas/merge_table_alignment.dart';
import 'package:erb_system/merge_table/src/merge_table.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

import '../../resources/style_manager.dart';

class Auditbudget extends StatefulWidget {
  Auditbudget({Key? key}) : super(key: key);

  @override
  State<Auditbudget> createState() => _AuditbudgetState();
}

class _AuditbudgetState extends State<Auditbudget> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  String? state;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  TextEditingController controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: orderDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate) {
      setState(() {
        orderDate = pickedDate;
      });
    }
  }

  Future<void> _select1Date(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: stateDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != stateDate) {
      setState(() {
        stateDate = pickedDate;
      });
    }
  }

  List data = [
    {
      "1": "البنك الاهلي",
      "2": "-200",
      "3": "100",
      "4": "1000",
      "5": "-200",
      "6": "100",
      "7": "1000"
    },
    {
      "1": "البنك الاهلي",
      "2": "-200",
      "3": "100",
      "4": "1000",
      "5": "-200",
      "6": "100",
      "7": "1000"
    },
    {
      "1": "البنك الاهلي",
      "2": "-200",
      "3": "100",
      "4": "1000",
      "5": "-200",
      "6": "100",
      "7": "1000"
    },
    {
      "1": "البنك الاهلي",
      "2": "-200",
      "3": "100",
      "4": "1000",
      "5": "-200",
      "6": "100",
      "7": "1000"
    },
    {
      "1": "البنك الاهلي",
      "2": "-200",
      "3": "100",
      "4": "1000",
      "5": "-200",
      "6": "100",
      "7": "1000"
    },
    {
      "1": "البنك الاهلي",
      "2": "-200",
      "3": "100",
      "4": "1000",
      "5": "-200",
      "6": "100",
      "7": "1000"
    },
    {
      "1": "البنك الاهلي",
      "2": "-200",
      "3": "100",
      "4": "1000",
      "5": "-200",
      "6": "100",
      "7": "1000"
    },
    {
      "1": "البنك الاهلي",
      "2": "-200",
      "3": "100",
      "4": "1000",
      "5": "-200",
      "6": "100",
      "7": "1000"
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 5,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            DefaultContainer(
                              title: 'ميزانيه المراجعه',
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      ' البحث',
                                      style: getSemiBoldStyle(
                                          color: ColorManager.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(70),
                                      height: 60,
                                      child: DefaultInputForm(
                                        controller: controller,
                                        perFix: const Icon(Icons.search),
                                        hint: '',
                                        label: '',
                                        onTab: () {},
                                        validate: () {},
                                        onSave: () {},
                                        passFun: () {},
                                        color: Colors.white70,
                                        obscureText: false,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(20),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'الي تاريخ',
                                      style: getSemiBoldStyle(
                                          color: ColorManager.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(40),
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed: () => _select1Date(context),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white)),
                                        child: Text(
                                          "${stateDate.year.toString()}/${stateDate.month.toString().padLeft(2, '0')}/${stateDate.day.toString().padLeft(2, '0')}",
                                          style: const TextStyle(
                                            color: Color(0xff82225E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(20),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'من تاريخ ',
                                      style: getSemiBoldStyle(
                                          color: ColorManager.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(40),
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed: () => _selectDate(context),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white)),
                                        child: Text(
                                          "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                          style: const TextStyle(
                                            color: Color(0xff82225E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: getProportionateScreenWidth(250),
                                  child: MergeTable(
                                    borderColor: Colors.black,
                                    alignment: MergeTableAlignment.center,
                                    columns: [
                                      MMergedColumns(
                                        header: "رصيد اخر المده",
                                        columns: ["دائن", "مدين"],
                                      ),
                                      MMergedColumns(
                                        header: "الحركه",
                                        columns: ["دائن", "مدين"],
                                      ),
                                      MMergedColumns(
                                        header: "رصيد اول المده",
                                        columns: ["دائن", "مدين"],
                                      ),
                                      MColumn(header: 'اسم الحساب'),
                                    ],
                                    rows: [
                                      ...data
                                          .map(
                                            (e) => [
                                              MMergedRows([
                                                Text(
                                                  e['2'],
                                                  style: style,
                                                ),
                                                Text(
                                                  e['3'],
                                                  style: style,
                                                ),
                                              ]),
                                              MMergedRows([
                                                Text(
                                                  e['4'],
                                                  style: style,
                                                ),
                                                Text(
                                                  e['5'],
                                                  style: style,
                                                ),
                                              ]),
                                              MMergedRows([
                                                Text(
                                                  e['6'],
                                                  style: style,
                                                ),
                                                Text(
                                                  e['7'],
                                                  style: style,
                                                ),
                                              ]),
                                              MRow(
                                                Text(
                                                  e['1'],
                                                  style: style,
                                                ),
                                              ),
                                            ],
                                          )
                                          .toList(),
                                    ],
                                    color: ColorManager.second,
                                    size: getProportionateScreenWidth(5),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const DefaultRow(),
                    ],
                  ),
                ),
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
    ));
  }
}
