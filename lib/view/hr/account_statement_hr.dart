import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/utils/statements.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountStatement extends StatefulWidget {
  const AccountStatement({Key? key}) : super(key: key);

  @override
  State<AccountStatement> createState() => _AccountStatementState();
}

class _AccountStatementState extends State<AccountStatement> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String? month;
  DateTime orderDate = DateTime.now();

  List data = [
    {
      "1": "كامل شلتوت",
      "2": "المصنع",
      "3": "مدير",
      "4": "متباين",
      "5": "٥٠٠٠",
      "6": "٤٠٠٠",
      "7": "٩٠٠٠",
    },
    {
      "1": "كامل شلتوت",
      "2": "المصنع",
      "3": "مدير",
      "4": "متباين",
      "5": "٥٠٠٠",
      "6": "٤٠٠٠",
      "7": "٩٠٠٠",
    },
  ];

  List<String> columnData = [
    "الراتب المستحق",
    "السلف",
    "اجمالي الراتب",
    "الشهر",
    "المستوى الوظيفي",
    "الادارة",
    "اسم الموظف",
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(context: context, initialDate: orderDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate) {
      setState(() {
        orderDate = pickedDate;
      });
    }
  }

  List<String> dbDataId = [];
  List<String> dataId = [];
  List<String> dataIdUnPaginated = [];
  Map<String, Map<String, dynamic>> result = {};
  double total = 0;

  void performSearch(String query, int date) {
    setState(() {
      dataId = hrSearch(query, result, date);
      print(dataId);
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getRevenue();
    FirebaseFirestore.instance.collection('addemployee').get().then((value) => value.docs.forEach((element) {
      setState(() {
        result[element.id] = element.data();

        dbDataId.add(element.id);
        dataId.add(element.id);
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
                              DefaultContainer(title: 'كشف المرتبات'),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        ' البحث',
                                        style: getSemiBoldStyle(color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(70),
                                        height: 60,
                                        child: DefaultInputForm(
                                          controller: controller1,
                                          perFix: const Icon(Icons.search),
                                          hint: '',
                                          label: '',
                                          onChanged: (v) {
                                            performSearch(v.toCapitalized(), int.parse(month??'') );
                                          },
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
                                  // Column(
                                  //   children: [
                                  //     Text(
                                  //       ' التاريخ',
                                  //       style: getSemiBoldStyle(color: ColorManager.black),
                                  //     ),
                                  //     const SizedBox(
                                  //       height: 10,
                                  //     ),
                                  //     SizedBox(
                                  //       width: getProportionateScreenWidth(40),
                                  //       height: 60,
                                  //       child: ElevatedButton(
                                  //         onPressed: () => _selectDate(context),
                                  //         style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                                  //         child: Text(
                                  //           "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                  //           style: const TextStyle(
                                  //             color: Colors.black,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   width: getProportionateScreenWidth(20),
                                  // ),
                                  Column(
                                    children: [
                                      Text(
                                        'راتب شهر',
                                        style: style,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(40),
                                        height: 60,
                                        child: DefaultInputForm(
                                          hint: '',
                                          label: '',
                                          onChanged: (v) {
                                            setState(() {
                                              month = v;
                                            });
                                          },
                                          onTab: () {},
                                          validate: () {},
                                          onSave: () {},
                                          passFun: () {},
                                          color: Colors.white70,
                                          obscureText: false,
                                          controller: controller2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 90,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 71),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: List.generate(
                                          data.length,
                                              (index) => Column(
                                            children: [
                                              SizedBox(
                                                  width: getProportionateScreenWidth(40),
                                                  child: dropDown(
                                                    const [
                                                      ' صرف المرتب',
                                                      ' صرف سلفة ',
                                                    ],
                                                    selectTalab: index == selectedIndex ? chose1 : chose2,
                                                    onchanged: () => (val) {
                                                      setState(() {
                                                        selectedIndex = index;
                                                        chose1 = val;
                                                      });
                                                    },
                                                    label: 'خيارات',
                                                    foColor: Colors.white,
                                                    bgColor: ColorManager.primary,
                                                    dpColor: ColorManager.primary,
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                  DefaultTable(columnData: columnData, size: getProportionateScreenWidth(15), color: ColorManager.second, rows: [
                                    ...dataId
                                        .map((data) => DataRow(cells: [
                                      DataCell(Text(
                                        result[data]!['variableSalary'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        result[data]!['loan'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        result[data]!['totalSalary'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        DateFormat('yyyy-MM-dd').format(((result[data]?['date']) as Timestamp).toDate()).toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        result[data]!['level'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        result[data]!['department'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        result[data]!['name'],
                                        style: style,
                                      )),
                                    ]))
                                        .toList(),
                                    DataRow(color: MaterialStateProperty.all(ColorManager.primary), cells: [
                                      DataCell(Text(
                                        " 25000",
                                        style:
                                        TextStyle(color: ColorManager.white, fontSize: getProportionateScreenWidth(5), fontWeight: FontWeight.w800),
                                      )),
                                      DataCell(Text(
                                        " 2500",
                                        style:
                                        TextStyle(color: ColorManager.white, fontSize: getProportionateScreenWidth(5), fontWeight: FontWeight.w800),
                                      )),
                                      DataCell(Text(
                                        " 250000",
                                        style:
                                        TextStyle(color: ColorManager.white, fontSize: getProportionateScreenWidth(5), fontWeight: FontWeight.w800),
                                      )),
                                      DataCell(Text(
                                        '',
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        '',
                                        style: style,
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
                                                  color: ColorManager.white, fontSize: getProportionateScreenWidth(5), fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          placeholder: true),
                                    ])
                                  ]),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Botton(
                                bgColor: Colors.black,
                                color: Colors.white,
                                title: 'المزيد',
                                onTap: () {},
                              )
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