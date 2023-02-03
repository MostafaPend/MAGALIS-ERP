
import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/store/store_transfer/damage_details_transfer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../resources/color_manger.dart';


class FiperTransferDetails extends StatelessWidget {
  FiperTransferDetails({Key? key}) : super(key: key);
  List data = [
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "PO2",
    },
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "PO2",
    },
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "PO1",
    },
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "PO1",
    },
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "MO4",
    },
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "D1",
    },
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "PO2",
    },
  ];
  List<String> columnData = [
    "رقم العملية",
    "القيمة الحالية",
    "التكلفة االجمالية",
    "تكلفة الوحدة",
    "الرصيد بعد",
    "الرصيد قبل",
    "الكمية",
    "الحركة",
    "التاريخ",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var pro = Provider.of<Controller>(context);
    TextStyle style=TextStyle(fontSize: getProportionateScreenWidth(5));
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    DefaultContainer(title: 'تفاصيل خام فايبر'),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                                data.length,
                                    (index) => Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: DefaultBotton(
                                        top:  MediaQuery.of(context).size.width<=500?getProportionateScreenWidth(8):getProportionateScreenWidth(3),
                                        right: getProportionateScreenWidth(3),
                                        title: 'تفاصيل',
                                        color: ColorManager.white,
                                        onTap: () {
                                            pro.changePage(ExchangePart());
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5),),
                        DefaultTable(
                          columnData: columnData,
                          size: getProportionateScreenWidth(2),
                          color: ColorManager.primary,
                          rows: data
                              .map((data) => DataRow(cells: [
                            DataCell(Text(
                              data['num_op'],style: style,
                            )),
                            DataCell(Text(
                              data['current_value'],style: style,
                            )),
                            DataCell(Text(
                              data['all_cost'],style: style,
                            )),
                            DataCell(Text(
                              data['cost'],style: style,
                            )),
                            DataCell(Text(
                              data['aftercost'],style: style,
                            )),
                            DataCell(Text(
                              data['verified'],style: style,
                            )),
                            DataCell(Text(
                              data['Quantity'],style: style,
                            )),
                            DataCell(Text(
                              data['last_name'],style: style,
                            )),
                            DataCell(Text(
                              data['first_name'],style: style,
                            )),
                          ]))
                              .toList(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: InkWell(
                          onTap: () {
                            QR.navigator.popUntilOrPush('/');
                          },
                          child: Image.asset(ImageAssets.iconDropDown2)),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: InkWell(
                          onTap: () {
                            QR.navigator.popUntilOrPush('/');
                          },
                          child: Image.asset(ImageAssets.iconDropDown52)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
