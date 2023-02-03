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

class ShippingMethods extends StatefulWidget {
  ShippingMethods({Key? key}) : super(key: key);

  @override
  State<ShippingMethods> createState() => _ShippingMethodsState();
}

class _ShippingMethodsState extends State<ShippingMethods> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  String? state;
  DateTime orderDate = DateTime.now();

  List data = [
    {"1": "١", "2": "Small products"},
    {"1": "٢", "2": "Huge products"},
  ];

  List<String> columnData = [
    "الاسم",
    // "طريقة",
  ];
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
        .collection('shippingtypes')
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
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    return Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                              title: 'طرق الشحن',
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                            'type'],
                                            style: style,
                                          )),
                                          // DataCell(Text(
                                          //   data['1'],
                                          //   style: style,
                                          // )),
                                        ]))
                                            .toList(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 32,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: getProportionateScreenWidth(45),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
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
                                      'اضافه طريقة ',
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
        ));
  }
}