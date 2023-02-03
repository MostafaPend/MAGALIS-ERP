import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../size_config.dart';

class PriceQuotation1 extends StatefulWidget {
  @override
  State<PriceQuotation1> createState() => _PriceQuotation1State();
}

class _PriceQuotation1State extends State<PriceQuotation1> {
  DateTime now = DateTime.now();
  String? categoryValue;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();
  TextEditingController controller9 = TextEditingController();
  DateTime orderDate = DateTime.now();
  Uint8List webImage = Uint8List(8);
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  List data = [
    {
      "1": "            ",
      "2": "                        ",
    },
  ];

  List<String> columnData = [
    "Payment terms",
    "Payment method",
  ];
  List data1 = [
    {
      "1": "            ",
      "2": "                        ",
      "3": "                        ",
    },
  ];

  List<String> columnData1 = [
    "Product",
    "Price",
    "Description",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    // var format = DateFormat.yMd('ar');

    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                    'Price Quotation',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(6),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 32.0, left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(40),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller1,
                                              style: style,
                                              decoration: InputDecoration(
                                                prefixIcon: IconButton(
                                                  icon:
                                                      const Icon(Icons.search),
                                                  color: Colors.grey[500],
                                                  onPressed: () {},
                                                ),
                                                hintText: 'Search',
                                                hintStyle: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Date:",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                50,
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller2,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'DD',
                                                hintStyle:
                                                    TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "/",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller3,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'MM',
                                                hintStyle:
                                                    TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "/",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller4,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'YYYY',
                                                hintStyle:
                                                    TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Valid till :",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                50,
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller5,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'DD',
                                                hintStyle:
                                                    TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "/",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller6,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'MM',
                                                hintStyle:
                                                    TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "/",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller7,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'YYYY',
                                                hintStyle:
                                                    TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                DefaultTable(
                                    columnData: columnData1,
                                    size: getProportionateScreenWidth(60),
                                    color: ColorManager.primary,
                                    rows: [
                                      ...data1
                                          .map((data) => DataRow(cells: [
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
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 71, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: List.generate(
                                        data1.length,
                                        (index) => Column(
                                              children: [
                                                SizedBox(
                                                    width:
                                                        getProportionateScreenWidth(
                                                            40),
                                                    child: dropDown(
                                                      const [
                                                        ' Details',
                                                        ' Print',
                                                        ' Edit',
                                                        ' Duplicate',
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
                                                      label: 'Options',
                                                      foColor: Colors.white,
                                                      bgColor:
                                                          ColorManager.primary,
                                                      dpColor:
                                                          ColorManager.primary,
                                                    )),
                                              ],
                                            )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
