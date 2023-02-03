import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:erb_system/view/print/print_takwid.dart';
import 'package:flutter/material.dart';

class CodingOrders extends StatefulWidget {
  CodingOrders({Key? key}) : super(key: key);

  @override
  State<CodingOrders> createState() => _CodingOrdersState();
}

class _CodingOrdersState extends State<CodingOrders> {
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
      "1": "068",
      "2": "٥",
      "3": "١٠٠",
      "4": "",
      "5": " ",
      "6": "",
      "7": "",
      "8": "",
      "9": "",
      "10": "",
      "11": "",
      "12": "٦٠",
      "13": "٦٠",
    },
    {
      "1": " 011",
      "2": "٥",
      "3": "١٠٠",
      "4": "",
      "5": "",
      "6": "",
      "7": "",
      "8": "",
      "9": "٦٠",
      "10": "٦٠",
      "11": "٦٠",
      "12": "٦٠",
      "13": "٦٠",
    },
  ];

  List<String> columnData = [
    "",
    "",
    "",
    "",
    "التكويد",
    "",
    "",
    "",
    "",
    "",
    "عدد الاكياس",
    "عدد القطع",
    "رقم الطلب",
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
                            title: 'تكويد الطلبات',
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
                                  const [
                                    'خزينة المصنع',
                                    'البنك الاهلي',
                                    'بنك مصر'
                                  ],
                                  selectTalab: state,
                                  onchanged: () => (val) {
                                    setState(() {
                                      state = val;
                                    });
                                  },
                                  label: 'شركة الشحن',
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
                                    ' التاريخ',
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
                            ],
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: getProportionateScreenWidth(200),
                                child: DefaultTable(
                                  color: ColorManager.primary,
                                  columnData: columnData,
                                  size: getProportionateScreenWidth(3),
                                  rows: data
                                      .map((data) => DataRow(cells: [
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
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: getProportionateScreenWidth(42),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                  border:
                                      Border.all(color: ColorManager.primary)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: ColorManager.primary,
                                  ),
                                  Text(
                                    'اضافه طلب ',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(5),
                                      fontWeight: FontWeight.w500,
                                      // color: ColorManager.primary
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 200,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PrintTakwid()));
                                  },
                                  icon: const Icon(
                                    Icons.print,
                                    size: 45,
                                  )),
                              SizedBox(
                                width: 40,
                              ),
                              DefaultContainer(title: 'طباعه التكويد')
                            ],
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
    );
  }
}
