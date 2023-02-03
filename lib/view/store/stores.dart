import 'package:erb_system/controller/store_controller/add_store_controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:erb_system/view/store/store_dtails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stock extends StatefulWidget {
  Stock({Key? key}) : super(key: key);

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  List<String> columnData = [
    "الرصيد",
    "المخزن",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var pro = Provider.of<AddStoreController>(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    return SafeArea(
        child: Scaffold(
            body: Row(
      children: [
        Expanded(
            flex: 5,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Padding(
                          padding: MediaQuery.of(context).size.width <= 500
                              ? const EdgeInsets.only(top: 200)
                              : const EdgeInsets.only(top: 220),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                pro.storeData.length,
                                (index) => Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: DefaultBotton(
                                            top: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    500
                                                ? getProportionateScreenWidth(8)
                                                : getProportionateScreenWidth(
                                                    2),
                                            right:
                                                getProportionateScreenWidth(5),
                                            title: 'تفاصيل',
                                            color: ColorManager.white,
                                            onTap: () {
                                              pro.getRowMaterials(
                                                  pro.storeData[index]['name']);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          StoreDetails(
                                                            title: pro
                                                                    .storeData[
                                                                index]['name'],
                                                          )));
                                              // QR.to('/store_dtails');
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DefaultContainer(title: 'المخازن'),
                            const SizedBox(
                              height: 80,
                            ),
                            DefaultTable(
                              columnData: columnData,
                              size: getProportionateScreenWidth(10),
                              color: ColorManager.second,
                              rows: pro.storeData
                                  .map((data) => DataRow(cells: [
                                        DataCell(Text(
                                          data['balance'].toString(),
                                          style: style,
                                        )),
                                        DataCell(Text(
                                          data['name'],
                                          style: style,
                                        )),
                                      ]))
                                  .toList(),
                            ),
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
