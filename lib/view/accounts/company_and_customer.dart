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
import 'package:qlevar_router/qlevar_router.dart';

class CompanyAndCustomer extends StatefulWidget {
  const CompanyAndCustomer({Key? key}) : super(key: key);

  @override
  State<CompanyAndCustomer> createState() => _CompanyAndCustomerState();
}

class _CompanyAndCustomerState extends State<CompanyAndCustomer> {
  String? chose;
  String? chose1;
  String? chose2;

  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

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
    "تاريخ الشحن",
    "اجمالي الطلبات",
    "المبلغ المقدم",
    "المبلغ المستحق",
    "عدد الطلبات",
    "نوع العميل",
    "اسم العميل",
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
                          DefaultContainer(title: 'العملاء و الشركات'),
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
                                                  width:
                                                      getProportionateScreenWidth(
                                                          40),
                                                  child: dropDown(
                                                    const [
                                                      'تفاصيل الحساب',
                                                      'تحصيل',
                                                      'مرتجع',
                                                      'شحن الطلب',
                                                    ],
                                                    selectTalab:
                                                        index == selectedIndex
                                                            ? chose1
                                                            : chose2,
                                                    onchanged: () => (val) {
                                                      if (val ==
                                                          'تفاصيل الحساب') {
                                                        QR.to(
                                                            '/customer_account_details');
                                                      } else if (val ==
                                                          'تحصيل') {
                                                      } else if (val ==
                                                          'مسحوبات') {
                                                      } else if (val ==
                                                          'مرتجع') {
                                                      } else if (val ==
                                                          'شحن الطلب') {}
                                                      setState(() {
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
                                            " 250",
                                            style: TextStyle(
                                                color: ColorManager.white,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        5),
                                                fontWeight: FontWeight.w800),
                                          )),
                                          DataCell(Text(
                                            " 250",
                                            style: TextStyle(
                                                color: ColorManager.white,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        5),
                                                fontWeight: FontWeight.w800),
                                          )),
                                          DataCell(Text(
                                            " 250",
                                            style: TextStyle(
                                                color: ColorManager.white,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        5),
                                                fontWeight: FontWeight.w800),
                                          )),
                                          DataCell(Text(
                                            " 250",
                                            style: TextStyle(
                                                color: ColorManager.white,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        5),
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
                                                      fontWeight:
                                                          FontWeight.w800),
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
                            title: 'اضافة',
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
