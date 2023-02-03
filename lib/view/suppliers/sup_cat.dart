import 'package:erb_system/controller/suppliers/add_suppliers.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class SupCat extends StatelessWidget {
  SupCat({Key? key}) : super(key: key);
  List data = [
    {
      "1": "قماش",
      "2": "10",
    },
    {
      "1": "حديد",
      "2": "12",
    },
  ];

  List<String> columnData = [
    "عدد الموردين",
    "الفئه",
  ];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AddSuppliersController>(context);
    SizeConfig.init(context);
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        FutureBuilder(
                            future: pro.getSupplierType(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List tData = snapshot.data as List;
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 70),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: List.generate(
                                            tData.length,
                                            (index) => Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: DefaultBotton(
                                                        title: 'تفاصيل',
                                                        top: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <=
                                                                500
                                                            ? getProportionateScreenWidth(
                                                                8)
                                                            : getProportionateScreenWidth(
                                                                3),
                                                        right:
                                                            getProportionateScreenWidth(
                                                                3),
                                                        color:
                                                            ColorManager.white,
                                                        onTap: () {
                                                          QR.to('/cat_details');
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    DefaultTable(
                                      columnData: columnData,
                                      size: getProportionateScreenWidth(10),
                                      color: ColorManager.second,
                                      rows: tData
                                          .map((data) => DataRow(cells: [
                                                DataCell(Text(
                                                  '',
                                                )),
                                                DataCell(Text(
                                                  data['type'],
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
