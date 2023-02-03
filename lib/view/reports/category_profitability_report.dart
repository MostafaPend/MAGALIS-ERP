import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:flutter/material.dart';

class CategoryProfitabilityReport extends StatefulWidget {
  const CategoryProfitabilityReport({Key? key}) : super(key: key);

  @override
  State<CategoryProfitabilityReport> createState() =>
      _CategoryProfitabilityReportState();
}

class _CategoryProfitabilityReportState
    extends State<CategoryProfitabilityReport> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "كرسي",
      "2": "اثاث",
      "3": "فرخ ",
      "4": "٣٣",
      "5": "١٢٠٠٠٠",
      "6": "١٢٠",
      "7": "٣/١٢/٢٠٢٢",
      "8": "",
      "9": "",
      "10": "",
      "11": "",
      "12": "",
      "13": "",
      "14": "",
      "15": "تالف",
    },
    {
      "1": "كرسي",
      "2": "اثاث",
      "3": "فرخ ",
      "4": "٣٣",
      "5": "١٢٠٠٠٠",
      "6": "١٢٠",
      "7": "٣/١٢/٢٠٢٢",
      "8": "",
      "9": "",
      "10": "",
      "11": "",
      "12": "",
      "13": "",
      "14": "",
      "15": "تالف",
    },
    {
      "1": "كرسي",
      "2": "اثاث",
      "3": "فرخ ",
      "4": "٣٣",
      "5": "١٢٠٠٠٠",
      "6": "١٢٠",
      "7": "٣/١٢/٢٠٢٢",
      "8": "",
      "9": "",
      "10": "",
      "11": "",
      "12": "",
      "13": "",
      "14": "",
      "15": "تالف",
    },
  ];

  List<String> columnData = [
    "البيان",
    "هامش ربح الصنف",
    "اجمالي ربح الصنف",
    "صافي ربح الصنف",
    "متوسط التكلفة",
    "متوسط سعر البيع",
    "رفض الاستلام بالقطع",
    "المرتجعات بالقطع",
    "التاريخ",
    "عدد الطلبات",
    "المبيعات بالقيمة",
    "المبيعات بالقطعة",
    "وحدة القياس",
    "نوع",
    "الصنف",
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
    TextStyle style = TextStyle(
        fontSize: MediaQuery.of(context).size.width <= 800
            ? getProportionateScreenWidth(3)
            : getProportionateScreenWidth(4));
    return SafeArea(
        child: Scaffold(
      body: Stack(
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
                  DefaultContainer(title: 'تقرير ربحية الصنف'),
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
                            style: getSemiBoldStyle(color: ColorManager.black),
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
                                      MaterialStateProperty.all(Colors.white)),
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
                            style: getSemiBoldStyle(color: ColorManager.black),
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
                                      MaterialStateProperty.all(Colors.white)),
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
                      DefaultTable(
                          columnData: columnData,
                          size: getProportionateScreenWidth(2),
                          color: ColorManager.second,
                          rows: [
                            ...data
                                .map((data) => DataRow(cells: [
                                      DataCell(Text(
                                        data['15'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['14'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['13'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['12'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['11'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['10'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['9'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['8'],
                                        style: style,
                                      )),
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
          DefaultRow(),
        ],
      ),
    ));
  }
}
