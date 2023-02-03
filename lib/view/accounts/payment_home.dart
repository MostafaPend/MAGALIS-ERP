import 'package:erb_system/controller/treasury/treasury_controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/accounts/payment_method/account_details.dart';
import 'package:erb_system/view/accounts/payment_method/deposit_traesury.dart';
import 'package:erb_system/view/accounts/payment_method/edit_treasury.dart';
import 'package:erb_system/view/accounts/payment_method/pay_from_treasury.dart';
import 'package:erb_system/view/accounts/payment_method/transfer_treasury.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class PaymentHome extends StatefulWidget {
  const PaymentHome({Key? key}) : super(key: key);

  @override
  State<PaymentHome> createState() => _PaymentHomeState();
}

class _PaymentHomeState extends State<PaymentHome> {
  String? chose;
  String? chose1;
  String? chose2;
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  int? selectedIndex;
  String? title;
  String? id;
  String? balance;

  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "022",
    },
  ];

  List<String> columnData = [
    "الاستخدام",
    "الرصد",
    "النوع",
    "الاسم",
  ];

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
        initialDate: orderDate1,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate1) {
      setState(() {
        orderDate1 = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<TreasuryController>(context);
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
                          DefaultContainer(
                              title: 'البنوك و الخزينه و وسائل الدفع'),
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
                                        color: ColorManager.black,
                                        fontSize:
                                            getProportionateScreenWidth(5)),
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
                                        color: ColorManager.black,
                                        fontSize:
                                            getProportionateScreenWidth(5)),
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
                                        color: ColorManager.black,
                                        fontSize:
                                            getProportionateScreenWidth(5)),
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
                                        "${orderDate1.year.toString()}/${orderDate1.month.toString().padLeft(2, '0')}/${orderDate1.day.toString().padLeft(2, '0')}",
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
                          FutureBuilder(
                              future: pro.getTreasury(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List treasury = snapshot.data as List;
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 71),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: List.generate(
                                              treasury.length,
                                              (index) => Column(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                              getProportionateScreenWidth(
                                                                  40),
                                                          child: dropDown(
                                                            const [
                                                              'تعديل',
                                                              ' تحويل',
                                                              ' مسحوبات',
                                                              ' ايداع',
                                                              ' كشف حساب',
                                                            ],
                                                            selectTalab: index ==
                                                                    selectedIndex
                                                                ? chose1
                                                                : chose2,
                                                            onchanged: () =>
                                                                (val) {
                                                              if (val ==
                                                                  'تعديل') {
                                                                setState(() {
                                                                  isVisible1 =
                                                                      true;
                                                                  title = treasury[
                                                                          index]
                                                                      ['name'];
                                                                  id = treasury[
                                                                          index]
                                                                      ['id'];
                                                                  balance = treasury[
                                                                              index]
                                                                          [
                                                                          'balance']
                                                                      .toString();
                                                                });
                                                              } else if (val ==
                                                                  ' تحويل') {
                                                                setState(() {
                                                                  isVisible2 =
                                                                      true;
                                                                });
                                                              } else if (val ==
                                                                  ' مسحوبات') {
                                                                setState(() {
                                                                  isVisible3 =
                                                                      true;
                                                                });
                                                              } else if (val ==
                                                                  ' ايداع') {
                                                                setState(() {
                                                                  isVisible4 =
                                                                      true;
                                                                });
                                                              } else if (val ==
                                                                  ' كشف حساب') {
                                                                print(treasury[
                                                                index]
                                                                ['id']);
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(builder: (context) =>  AccountsDetails(list: treasury[index]
                                                                  ['id'],)),
                                                                );

                                                              }
                                                              setState(() {
                                                                selectedIndex =
                                                                    index;
                                                                chose1 = val;
                                                              });
                                                            },
                                                            label: 'خيارات',
                                                            foColor:
                                                                Colors.white,
                                                            bgColor:
                                                                ColorManager
                                                                    .primary,
                                                            dpColor:
                                                                ColorManager
                                                                    .primary,
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
                                          Stack(
                                            children: [
                                              DefaultTable(
                                                  columnData: columnData,
                                                  size:
                                                      getProportionateScreenWidth(
                                                          30),
                                                  color: ColorManager.primary,
                                                  rows: [
                                                    ...treasury
                                                        .map((data) =>
                                                            DataRow(cells: [
                                                              DataCell(Text(
                                                                data['usage'],
                                                                style: style,
                                                              )),
                                                              DataCell(Text(
                                                                data['balance']
                                                                    .toString(),
                                                                style: style,
                                                              )),
                                                              DataCell(Text(
                                                                data['type'],
                                                                style: style,
                                                              )),
                                                              DataCell(Text(
                                                                data['name'],
                                                                style: style,
                                                              )),
                                                            ]))
                                                        .toList(),
                                                  ]),
                                              isVisible1
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        EditTreasury(
                                                          title: title,
                                                          id: id,
                                                          balance: balance,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              isVisible1 =
                                                                  false;
                                                            });
                                                          },
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                ColorManager
                                                                    .primary,
                                                            radius: 30,
                                                            child: const Icon(Icons
                                                                .close_rounded),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                              isVisible2
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        TransferTreasury(),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              isVisible2 =
                                                                  false;
                                                            });
                                                          },
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                ColorManager
                                                                    .primary,
                                                            radius: 30,
                                                            child: const Icon(Icons
                                                                .close_rounded),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                              isVisible3
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        PayFromTreasury(),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              isVisible3 =
                                                                  false;
                                                            });
                                                          },
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                ColorManager
                                                                    .primary,
                                                            radius: 30,
                                                            child: const Icon(Icons
                                                                .close_rounded),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                              isVisible4
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        DespositTreasury(),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              isVisible4 =
                                                                  false;
                                                            });
                                                          },
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                ColorManager
                                                                    .primary,
                                                            radius: 30,
                                                            child: const Icon(Icons
                                                                .close_rounded),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      42),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(25)),
                                                  border: Border.all(
                                                      color: ColorManager
                                                          .primary)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add,
                                                    color: ColorManager.primary,
                                                  ),
                                                  Text(
                                                    'اضافه نوع',
                                                    style: TextStyle(
                                                        fontSize:
                                                            getProportionateScreenWidth(
                                                                5),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              }),
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
