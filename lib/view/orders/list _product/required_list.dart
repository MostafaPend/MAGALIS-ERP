import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manger.dart';
import '../../../resources/style_manager.dart';
import '../../../size_config.dart';
import '../../../view/home/components/default_table.dart';
import '../../../view/home/components/drop_down.dart';

class RequiredList extends StatefulWidget {
  RequiredList({Key? key}) : super(key: key);

  @override
  State<RequiredList> createState() => _RequiredListState();
}

class _RequiredListState extends State<RequiredList> {
  String? chose;
  String? state;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  String? chose1;
  String? chose2;
  int? selectedIndex;

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
      "1": "كرسي الما",
      "2": "٥",
      "3": "١٠٠",
      "4": "٤٠",
      "5": "متوفر ",
      "6": "صفر",
      "7": "٦٠"
    },
    {
      "1": "كرسي الما",
      "2": "٥",
      "3": "١٠٠",
      "4": "٤٠",
      "5": "متوفر ",
      "6": "صفر",
      "7": "٦٠"
    },
    {
      "1": "كرسي الما",
      "2": "٥",
      "3": "١٠٠",
      "4": "٤٠",
      "5": "متوفر ",
      "6": "صفر",
      "7": "٦٠"
    },
  ];

  List<String> columnData = [
    "المطلوب تصنيعه",
    "عدد العجز",
    "توفر الخامات",
    "رصيد المخزن",
    "عدد القطع المطلوبة",
    "عدد الطلبات",
    "اسم المنتج",
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          DefaultContainer(
                            title: 'قائمة المنتجات المطلوبة',
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: getProportionateScreenWidth(50),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const ['طلب جديد', 'طلب مؤكد'],
                                  selectTalab: state,
                                  onchanged: () => (val) {
                                    setState(() {
                                      state = val;
                                    });
                                  },
                                  label: 'حاله الطلب',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'تاريخ الحالة',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black,
                                        fontSize:
                                            getProportionateScreenWidth(5)),
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
                                    'تاريخ الطلب',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black,
                                        fontSize:
                                            getProportionateScreenWidth(5)),
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
                            height: 64,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                                          50),
                                                  child: dropDown(
                                                    const [
                                                      'تأكيد امرالتصنيع',
                                                      'تفاصيل الطلب',
                                                    ],
                                                    selectTalab:
                                                        index == selectedIndex
                                                            ? chose1
                                                            : chose2,
                                                    onchanged: () => (val) {
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
                              SizedBox(
                                width: getProportionateScreenWidth(10),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(200),
                                child: DefaultTable(
                                  color: ColorManager.primary,
                                  columnData: columnData,
                                  size: getProportionateScreenWidth(3),
                                  rows: data
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
                                ),
                              ),
                            ],
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
    );
  }
}
