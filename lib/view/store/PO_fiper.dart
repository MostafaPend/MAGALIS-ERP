import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class POFiper extends StatelessWidget {
  POFiper({Key? key}) : super(key: key);
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
    },    {
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
    return  Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              DefaultContainer(title: 'تفاصيل المشتريات PO للفايبر'),
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
                                padding: const EdgeInsets.only(top: 10),
                                child: DefaultBotton(
                                  top:  MediaQuery.of(context).size.width<=500?getProportionateScreenWidth(8):getProportionateScreenWidth(3),
                                  right: getProportionateScreenWidth(3),
                                  title: 'تفاصيل',
                                  color: ColorManager.white,
                                  onTap: () {},
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(5),),
                  DefaultTable(columnData: columnData,
                    size: getProportionateScreenWidth(5),
                    color: ColorManager.second,
                    rows:data.map((data) => DataRow(cells: [
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
                      )),  DataCell(Text(
                        data['3'],style: style,
                      )),  DataCell(Text(
                        data['2'],style: style,
                      )),  DataCell(Text(
                        data['1'],style: style,
                      )),
                    ]))
                        .toList(),),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Botton(
                color: ColorManager.white,
                title: 'المزيد',
                onTap: () {},
                bgColor: ColorManager.primary,
              ),
            ],
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
    );
  }
}
