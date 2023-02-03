import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_expenses.dart';

class TypesExpenses extends StatefulWidget {
  const TypesExpenses({Key? key}) : super(key: key);

  @override
  State<TypesExpenses> createState() => _TypesExpensesState();
}

class _TypesExpensesState extends State<TypesExpenses> {
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
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
    },
  ];

  List<String> columnData = [
    "بيان",
    "النوع",
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
  Map<String, Map<String, dynamic>> result = {};
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    startDate = DateTime(now.year, now.month, now.day);
    endDate = startDate.add(const Duration(days: 1));
    FirebaseFirestore.instance
        .collection('finance')
        .get()
        .then((value) => value.docs.forEach((element) {
              setState(() {
                result[element.id] = element.data();
                dataId.add(element.id);
              });
            }));
  }

  void performSearch(String query) {
    setState(() {
      dataId = search(query, result, Timestamp.fromDate(startDate),
          Timestamp.fromDate(endDate));
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
                          DefaultContainer(title: 'انواع المصروفات'),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 71),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                      dataId.length,
                                      (index) => Column(
                                            children: [
                                              SizedBox(
                                                  width:
                                                      getProportionateScreenWidth(
                                                          40),
                                                  child: dropDown(
                                                    const [
                                                      ' تعديل',
                                                      'حذف',
                                                    ],
                                                    selectTalab:
                                                        index == selectedIndex
                                                            ? chose1
                                                            : chose2,
                                                    onchanged: () => (val) {
                                                      setState(() {
                                                       
                                                        // ?
                                                       if ( val == ' تعديل') {
                                                         Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    AddExpenses(
                                                                      id: dataId[
                                                                          index],
                                                                      expensetype: (result[dataId[index]]
                                                                              ?[
                                                                              'expensetype'])
                                                                          .toString(),
                                                                      amount: (result[dataId[index]]
                                                                              ?[
                                                                              'amount'])
                                                                          .toString(),
                                                                      notes: (result[dataId[index]]
                                                                              ?[
                                                                              'notes'])
                                                                          .toString(),
                                                                      treasury: (result[dataId[index]]
                                                                              ?[
                                                                              'treasury'])
                                                                          .toString(),
                                                                      description: (result[dataId[index]]
                                                                              ?[
                                                                              'description'])
                                                                          .toString(),
                                                                      date: DateFormat(
                                                                              'yyyy-MM-dd')
                                                                          .format(
                                                                              ((result[dataId[index]]?['date']) as Timestamp).toDate())
                                                                          .toString(),
                                                                      isEdit: val ==
                                                                              'تفاصيل'
                                                                          ? false
                                                                          : true,
                                                                      isFromAnotherPage:
                                                                          true,
                                                                    )));
                                                       } else {
                                                             FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'finance')
                                                                .doc(dataId[
                                                                    index])
                                                                .delete();
                                                        dataId.remove(
                                                            dataId[index]);
                                                       } 
                                                  

                                                        print(dataId);

                                                        selectedIndex = index;
                                                        chose1 = val;
                                                      });
                                                    },
                                                    label: 'خيارات',
                                                    foColor: Colors.white,
                                                    bgColor:
                                                        ColorManager.primary,
                                                    dpColor:
                                                        ColorManager.primary,
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          )),
                                ),
                              ),
                              Column(
                                children: [
                                  DefaultTable(
                                      columnData: columnData,
                                      size: getProportionateScreenWidth(30),
                                      color: ColorManager.primary,
                                      rows: [
                                        ...dataId
                                            .map((data) => DataRow(cells: [
                                                  DataCell(Text(
                                                    (result[data]
                                                            ?['description'])
                                                        .toString(),
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    (result[data]
                                                            ?['expensetype'])
                                                        .toString(),
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    'مصروف',
                                                    style: style,
                                                  )),
                                                ]))
                                            .toList(),
                                      ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // InkWell(
                                  //   onTap: () {},
                                  //   child: Container(
                                  //     width: getProportionateScreenWidth(42),
                                  //     decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(25)),
                                  //         border: Border.all(
                                  //             color: ColorManager.primary)),
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.center,
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.center,
                                  //       children: [
                                  //         Icon(
                                  //           Icons.add,
                                  //           color: ColorManager.primary,
                                  //         ),
                                  //         Text(
                                  //           'اضافه نوع',
                                  //           style: TextStyle(
                                  //               fontSize:
                                  //                   getProportionateScreenWidth(
                                  //                       5),
                                  //               fontWeight: FontWeight.w500),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
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
