import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/suppliers/sup_pay.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class SupMoneyDetails extends StatefulWidget {
  String ? name;
  String ? type;
  String ? balance;
   SupMoneyDetails({Key? key,required this.name, required this.type,required this.balance}) : super(key: key);

  @override
  State<SupMoneyDetails> createState() => _SupMoneyDetailsState();
}

class _SupMoneyDetailsState extends State<SupMoneyDetails> {
  String? chose1;
  String? chose2;
  int? selectedIndex;

  Map<String, Map<String, dynamic>> result = {};
  List<String> dataId = [];
  List<String> dbDataId = [];

  List<String> columnData = [
    "رصيد بعد",
    "المدفوع",
    "رصيد قبل",
    "اجمالي الفاتوره",
    "المرجع",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.name);
    FirebaseFirestore.instance
        .collection("addpurchasing")
        .where("suppliername",isEqualTo: widget.name)
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
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  DefaultContainer(title: 'تفاصيل حساب المورد '),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'فئه المورد',
                              style:
                                  getSemiBoldStyleAR(color: ColorManager.black),
                            ),
                            DefaultContainer(title: widget.type!)
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 71),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              result.length,
                              (index) => Column(
                                    children: [
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(57),
                                          child: dropDown(
                                            const [
                                              'سداد المورد',
                                            ],
                                            selectTalab: index == selectedIndex
                                                ? chose1
                                                : chose2,
                                            onchanged: () => (val) {
                                              if (val == 'سداد المورد') {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                        context) =>
                                                            SupPay(
                                                              name:widget.name,
                                                              balance:widget.balance,

                                                            )));
                                              }
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
                      DefaultTable(
                        columnData: columnData,
                        size: getProportionateScreenWidth(2),
                        color: ColorManager.second,
                        rows: dataId
                            .map((data) => DataRow(cells: [
                                  DataCell(Text(
                                    result[data]!['podownpayment'].toString(),
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    result[data]!['podownpayment'].toString(),
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    result[data]!['podownpayment'].toString(),
                                    style: style,
                                  )),
                          DataCell(Text(
                            result[data]!['total'].toString(),
                            style: style,
                          )),
                          DataCell(Text(
                            result[data]!['id'],
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
            DefaultRow(),
          ],
        ),
      ),
    ));
  }
}
