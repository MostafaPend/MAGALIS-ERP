import 'package:erb_system/controller/category/category_controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';

class Nyotins extends StatefulWidget {
  const Nyotins({Key? key}) : super(key: key);

  @override
  State<Nyotins> createState() => _NyotinsState();
}

class _NyotinsState extends State<Nyotins> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;

  List data = [
    {
      "1": "كيلو",
    },
    {
      "1": "كيلو",
    },
  ];

  List<String> columnData = [
    "اسم الوحده",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var pro = Provider.of<CategoryController>(context);

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
                        DefaultContainer(title: 'وحدات القياس'),
                        const SizedBox(
                          height: 50,
                        ),
                        FutureBuilder(
                            future: pro.getMeasurements(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List mData = snapshot.data as List;
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
                                            mData.length,
                                            (index) => Column(
                                                  children: [
                                                    SizedBox(
                                                        width:
                                                            getProportionateScreenWidth(
                                                                40),
                                                        child: dropDown(
                                                          const [
                                                            'تعديل',
                                                            'حذف',
                                                          ],
                                                          selectTalab: index ==
                                                                  selectedIndex
                                                              ? chose1
                                                              : chose2,
                                                          onchanged: () =>
                                                              (val) {
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
                                      size: getProportionateScreenWidth(30),
                                      color: Colors.grey.shade800,
                                      rows: mData
                                          .map((data) => DataRow(cells: [
                                                DataCell(Text(
                                                  data['name'],
                                                )),
                                              ]))
                                          .toList(),
                                    ),
                                  ],
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            })
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
    )));
  }
}
