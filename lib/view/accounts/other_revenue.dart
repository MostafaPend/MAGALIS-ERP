import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OtherRevenue extends StatefulWidget {
  const OtherRevenue({Key? key}) : super(key: key);

  @override
  State<OtherRevenue> createState() => _OtherRevenueState();
}

class _OtherRevenueState extends State<OtherRevenue> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

  DateTime endDate = DateTime.now();
  DateTime startDate = DateTime.now();

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كامل",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كامل",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كامل",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كامل",
    },
  ];

  List<String> columnData = [
    "بواسطة",
    "المبلغ",
    "نوع الايراد",
    "التاريخ",
    "الاسم",
  ];

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != endDate) {
      setState(() {
        endDate = pickedDate;
      });
    }
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != startDate) {
      setState(() {
        startDate = pickedDate;
      });
    }
  }

  List<String> dataId = [];
  double total = 0;
  Map<String, Map<String, dynamic>> result = {};
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    startDate = DateTime(now.year, now.month, now.day);
    endDate = startDate.add(const Duration(days: 1));
    FirebaseFirestore.instance
        .collection('addrevenue')
        .get()
        .then((value) => value.docs.forEach((element) {
              setState(() {
                result[element.id] = element.data();
                dataId.add(element.id);
                total = total + int.parse(element.data()['amount']);
              });
            }));
  }

  void performSearch(String query) {
    setState(() {
      dataId = search(query, result, Timestamp.fromDate(startDate),
          Timestamp.fromDate(endDate));
      total = dataId.fold(
          0,
          (previousValue, element) =>
              previousValue + int.parse(result[element]?['amount']));
    });
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
                          DefaultContainer(title: 'الايرادات الاخري'),
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
                                    ' ',
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
                                      controller: controller1,
                                      perFix: const Icon(Icons.search),
                                      hint: '',
                                      label: '',
                                      onChanged: performSearch,
                                      onTab: () {},
                                      onSave: () {},
                                      validate: () {},
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
                                    'الي التاريخ',
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
                                      onPressed: () => _selectEndDate(context),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Text(
                                        "${endDate.year.toString()}/${endDate.month.toString().padLeft(2, '0')}/${endDate.day.toString().padLeft(2, '0')}",
                                        style: const TextStyle(
                                          color: Colors.black,
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
                                    'من التاريخ',
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
                                      onPressed: () =>
                                          _selectStartDate(context),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Text(
                                        "${startDate.year.toString()}/${startDate.month.toString().padLeft(2, '0')}/${startDate.day.toString().padLeft(2, '0')}",
                                        style: const TextStyle(
                                          color: Colors.black,
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
                            height: 90,
                          ),
                          DefaultTable(
                              columnData: columnData,
                              size: getProportionateScreenWidth(40),
                              color: ColorManager.second,
                              rows: [
                                ...dataId
                                    .map((data) => DataRow(cells: [
                                          DataCell(Text(
                                            (result[data]?['byuser'])
                                                .toString(),
                                            style: style,
                                          )),
                                          DataCell(Text(
                                            (result[data]?['amount'])
                                                .toString(),
                                            style: style,
                                          )),
                                          DataCell(Text(
                                            (result[data]?['type']).toString(),
                                            style: style,
                                          )),
                                          DataCell(Text(
                                            DateFormat('yyyy-MM-dd')
                                                .format(((result[data]?['date'])
                                                        as Timestamp)
                                                    .toDate())
                                                .toString(),
                                            style: style,
                                          )),
                                          DataCell(Text(
                                            'ايراد',
                                            style: style,
                                          )),
                                        ]))
                                    .toList(),
                                DataRow(
                                    color: MaterialStateProperty.all(
                                        ColorManager.primary),
                                    cells: [
                                      DataCell(Text(
                                        '',
                                        style: style,
                                      )),
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
                          //   title: 'اضافة',
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
