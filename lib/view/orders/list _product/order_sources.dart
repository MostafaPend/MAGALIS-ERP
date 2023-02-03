import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manger.dart';
import '../../../size_config.dart';
import '../../../view/home/components/default_table.dart';
import '../../../view/home/components/drop_down.dart';

class OrderSources extends StatefulWidget {
  OrderSources({Key? key}) : super(key: key);

  @override
  State<OrderSources> createState() => _OrderSourcesState();
}

class _OrderSourcesState extends State<OrderSources> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  String? state;
  DateTime orderDate = DateTime.now();

  List data = [
    {"1": "١", "2": "facebook"},
    {"1": "١", "2": "facebook"},
  ];

  List<String> columnData = [
    "مصدر",
  ];

  List<String> dataTable = ["الطلبات"];
  List<String> dbDataId = [];
  List<String> dataId = [];
  List<String> dataIdUnPaginated = [];
  Map<String, Map<String, dynamic>> result = {};
  double total = 0;

  void performSearch(String query) {
    setState(() {
      dataId = searchByWord(query, result);
      print(dataId);

    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('ordersources')
        .get()
        .then((value) => value.docs.forEach((element) {
      setState(() {
        result[element.id] = element.data();

        dbDataId.add(element.id);
        dataId.add(element.id);

      });
    }));
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            DefaultContainer(
                              title: 'مصادر الطلبات',
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 55),
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
                                                height: 36,
                                                child: dropDown(
                                                  const [
                                                    'تعديل',
                                                    'حذف',
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
                                                  bgColor: ColorManager.primary,
                                                  dpColor: ColorManager.primary,
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  width: 32,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: getProportionateScreenWidth(200),
                                      child: DefaultTable(
                                        color: ColorManager.second,
                                        columnData: columnData,
                                        rows: dataId
                                            .map((data) => DataRow(cells: [
                                          DataCell(Text(
                                            result[data]![
                                            'source'],

                                          )),
                                          // DataCell(Text(
                                          //  result[data]![
                                          //           'measurement'],

                                          // )),
                                        ]))
                                            .toList(),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: getProportionateScreenWidth(45),
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(25)),
                                            border: Border.all(
                                                color: ColorManager.primary)),
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
                                              'اضافه مصدر ',
                                              style: TextStyle(
                                                fontSize:
                                                getProportionateScreenWidth(5),
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
        ));
  }
}