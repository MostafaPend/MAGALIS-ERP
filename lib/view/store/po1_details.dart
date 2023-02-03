import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/store/PO_fiper.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class PO1Details extends StatelessWidget {
  PO1Details({Key? key}) : super(key: key);
  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "اسلام",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "3000",
      "8": "خزينة المنصع",
      "9": "موظف احمد",
    },
  ];

  List<String> columnData = [
    "الموظف المسؤل",
    "الخزينة",
    "التكلفة االجمالية",
    "تكلفة الوحدة",
    "وحدة القياس",
    "الكمية",
    " اسم المورد",
    "الحركة",
    "التاريخ",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style=TextStyle(fontSize: getProportionateScreenWidth(5));
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  DefaultContainer(title: 'تفاصيل PO1'),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      DefaultTable(
                        columnData: columnData,
                        size: getProportionateScreenWidth(10),
                        color: ColorManager.second,
                        rows: data
                            .map((data) => DataRow(cells: [
                                  DataCell(Text(
                                    data['9'],style: style,
                                  )),
                                  DataCell(Text(
                                    data['8'],style: style,
                                  )),
                                  DataCell(Text(
                                    data['7'],style: style,
                                  )),
                                  DataCell(Text(
                                    data['6'],style: style,
                                  )),
                                  DataCell(Text(
                                    data['5'],style: style,
                                  )),
                                  DataCell(Text(
                                    data['4'],style: style,
                                  )),
                                  DataCell(Text(
                                    data['3'],style: style,
                                  )),
                                  DataCell(Text(
                                    data['2'],style: style,
                                  )),
                                  DataCell(Text(
                                    data['1'],style: style,
                                  )),
                                ]))
                            .toList(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      width:getProportionateScreenWidth(70),
                      height: getProportionateScreenHeight(200),
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(15),
                        border: Border.all(color: Colors.black,width: 2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.more_horiz),
                              Text('ملحوظات',style: style,),
                              const Icon(Icons.close,)
                            ],),
                          const Divider(color: Colors.black,thickness: 2,),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            decoration: const InputDecoration(
                                border: InputBorder.none
                            ),
                          )
                        ],
                      ),
                    ),
                      const SizedBox(width: 10,),
                      Container(
                        width:getProportionateScreenWidth(35) ,
                        height:getProportionateScreenHeight(132) ,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('ارفاق ايصال الدفع',style: style,),
                            InkWell(
                                onTap: (){},
                                child: Image.asset(ImageAssets.iconDropDown20,width: getProportionateScreenWidth(35),height: getProportionateScreenHeight(85),))
                          ],
                        ),

                      ),

                  ],)

                ],
              ),
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
