import 'package:erb_system/controller/category/category_controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';

class OrderBills extends StatefulWidget {
  const OrderBills({Key? key}) : super(key: key);

  @override
  State<OrderBills> createState() => _OrderBillsState();
}

class _OrderBillsState extends State<OrderBills> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;

  List data = [
    {
      "1": "",
    },
  ];

  List<String> columnData = [
    "رقم الطلب",
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
                        DefaultContainer(title: 'فواتير الطلبات'),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DefaultTable(
                                columnData: columnData,
                                size: getProportionateScreenWidth(30),
                                color: Colors.grey.shade800,
                                rows: [
                                  ...data
                                      .map((data) => DataRow(cells: [
                                            DataCell(
                                              SizedBox(
                                                width:
                                                    getProportionateScreenWidth(
                                                        40),
                                                height: 40,
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    prefixIcon: IconButton(
                                                      icon: const Icon(
                                                          Icons.search),
                                                      color: Colors.grey[500],
                                                      onPressed: () {},
                                                    ),
                                                    hintText: 'Search',
                                                    hintStyle: const TextStyle(
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]))
                                      .toList(),
                                  DataRow(cells: [
                                    DataCell(Row(
                                      children: [
                                        const Text('اضافه طلب'),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.add,
                                              color: ColorManager.primary,
                                            ))
                                      ],
                                    )),
                                  ])
                                ]),
                          ],
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.print,
                                  size: 45,
                                )),
                            SizedBox(
                              width: 40,
                            ),
                            DefaultContainer(title: 'طباعه')
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
    )));
  }
}
