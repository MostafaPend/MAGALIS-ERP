import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

class DocumentationDeliveryRequests extends StatefulWidget {
  DocumentationDeliveryRequests({Key? key}) : super(key: key);

  @override
  State<DocumentationDeliveryRequests> createState() =>
      _DocumentationDeliveryRequestsState();
}

class _DocumentationDeliveryRequestsState
    extends State<DocumentationDeliveryRequests> {
  String? chose;
  String? state;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

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
    },
  ];

  List<String> columnData = [
    "ملحوظات العميل",
    "رقم الهاتف",
    "العنوان بالتفصيل",
    "المنطقة",
    "المبلغ",
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 90),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  'سند تسليم طلبات',
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(6),
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.indigo,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {},
                                child: Icon(
                                  Icons.print,
                                  size: getProportionateScreenWidth(10),
                                  color: ColorManager.primary,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 32,
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
                                            DataCell(
                                              SizedBox(
                                                width:
                                                    getProportionateScreenWidth(
                                                        20),
                                                height: 40,
                                                child: TextFormField(
                                                  controller: controller1,
                                                  style: style,
                                                  decoration: InputDecoration(
                                                    prefixIcon: IconButton(
                                                      icon: const Icon(
                                                          Icons.search),
                                                      color: Colors.grey[500],
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
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
