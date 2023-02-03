import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/accounts/Settlement_company_account.dart';
import 'package:erb_system/view/accounts/cancel_order.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

class CustomerAccountDetails extends StatefulWidget {
  const CustomerAccountDetails({Key? key}) : super(key: key);

  @override
  State<CustomerAccountDetails> createState() => _CustomerAccountDetailsState();
}

class _CustomerAccountDetailsState extends State<CustomerAccountDetails> {
  String? chose;
  String? chose1;
  String? chose2;

  bool isVisible1 = false;
  bool isVisible2 = false;

  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "022",
      "5": "022",
      "6": "022",
      "7": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "022",
      "5": "022",
      "6": "022",
      "7": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "022",
      "5": "022",
      "6": "022",
      "7": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "022",
      "5": "022",
      "6": "022",
      "7": "022",
    },
  ];

  List<String> columnData = [
    "حاله الطلب",
    "تاريخ الشحن",
    "المبلغ المستحق",
    "المبلغ المدفوع",
    "قيمه الفاتوره",
    "عدد القطع",
    "تاريخ الطلب",
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
                          DefaultContainer(title: 'تفاصيل حساب عميل الشركه'),
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
                              Column(
                                children: [
                                  Text(
                                    'اسم العميل',
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
                                      controller: controller2,
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
                            ],
                          ),
                          const SizedBox(
                            height: 90,
                          ),
                          Stack(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 71),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: List.generate(
                                          data.length,
                                          (index) => Column(
                                                children: [
                                                  SizedBox(
                                                      width:
                                                          getProportionateScreenWidth(
                                                              40),
                                                      child: dropDown(
                                                        const [
                                                          'تسويه',
                                                          'الغاء',
                                                        ],
                                                        selectTalab: index ==
                                                                selectedIndex
                                                            ? chose1
                                                            : chose2,
                                                        onchanged: () => (val) {
                                                          if (val == 'تسويه') {
                                                            setState(() {
                                                              isVisible1 = true;
                                                            });
                                                          } else if (val ==
                                                              'الغاء') {
                                                            setState(() {
                                                              isVisible2 = true;
                                                            });
                                                          }
                                                          setState(() {
                                                            selectedIndex =
                                                                index;
                                                            chose1 = val;
                                                          });
                                                        },
                                                        label: 'خيارات',
                                                        foColor: Colors.white,
                                                        bgColor: ColorManager
                                                            .primary,
                                                        dpColor: ColorManager
                                                            .primary,
                                                      )),
                                                  const SizedBox(
                                                    height: 10,
                                                  )
                                                ],
                                              )),
                                    ),
                                  ),
                                  DefaultTable(
                                      columnData: columnData,
                                      size: getProportionateScreenWidth(10),
                                      color: ColorManager.primary,
                                      rows: [
                                        ...data
                                            .map((data) => DataRow(cells: [
                                                  DataCell(Text(
                                                    data['7'],
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    data['6'],
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    data['5'],
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    data['4'],
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    data['3'],
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    data['2'],
                                                    style: style,
                                                  )),
                                                  DataCell(Text(
                                                    data['1'],
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
                                                '',
                                                style: style,
                                              )),
                                              DataCell(Text(
                                                " 250",
                                                style: TextStyle(
                                                    color: ColorManager.white,
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            5),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              )),
                                              DataCell(Text(
                                                " 250",
                                                style: TextStyle(
                                                    color: ColorManager.white,
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            5),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              )),
                                              DataCell(Text(
                                                " 250",
                                                style: TextStyle(
                                                    color: ColorManager.white,
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            5),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              )),
                                              DataCell(Text(
                                                " 250",
                                                style: TextStyle(
                                                    color: ColorManager.white,
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            5),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              )),
                                              DataCell(
                                                  Container(
                                                    color: ColorManager.primary,
                                                    child: Text(
                                                      'الاجمالي',
                                                      style: TextStyle(
                                                          color: ColorManager
                                                              .white,
                                                          fontSize:
                                                              getProportionateScreenWidth(
                                                                  5),
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ),
                                                  placeholder: true),
                                            ])
                                      ]),
                                ],
                              ),
                              isVisible1
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SettlementCompanyAccount(),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isVisible1 = false;
                                            });
                                          },
                                          child: CircleAvatar(
                                            backgroundColor:
                                                ColorManager.primary,
                                            radius: 30,
                                            child:
                                                const Icon(Icons.close_rounded),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              isVisible2
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CancelOrder(),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isVisible2 = false;
                                            });
                                          },
                                          child: CircleAvatar(
                                            backgroundColor:
                                                ColorManager.primary,
                                            radius: 30,
                                            child:
                                                const Icon(Icons.close_rounded),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
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
