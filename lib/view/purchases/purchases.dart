import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../controller/purchase_controller/pruchase_controller.dart';
import '../home/components/botton.dart';

class Purchases extends StatefulWidget {
  const Purchases({Key? key}) : super(key: key);

  @override
  State<Purchases> createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  DateTime orderDate = DateTime.now();

  List dataTable = [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.red,
            )),
        const Text('اضافه صنف')
      ],
    )
  ];
  List<String> columnData = [
    "",
    "تاريخ الاستلام",
    "تاريخ الطلب",
    "المتبقي",
    "المدفوع",
    "اجمالي الفاتوره",
    "حاله الشراء",
    "اسم المورد",
    "المرجع",
  ];
  List<String> dbDataId = [];
  List<String> dataId = [];
  List<String> dataIdUnPaginated = [];
  Map<String, Map<String, dynamic>> result = {};

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: orderDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate) {
      setState(() {
        orderDate = pickedDate;
      });
    }
  }

  void performSearch(
      String? searchWord,
      String? categoryType,
      String? production,
      ) {
    setState(() {
      dataId = categoryFilter(
          searchWord: searchWord ?? '',
          categoryType: categoryType ?? '',
          production: production ?? '',
          result: result);
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    controller1.addListener(() {
      setState(() {
        performSearch(controller1.text, "", "");
      });
    });
    FirebaseFirestore.instance
        .collection('addpurchasing')
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
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    var pro = Provider.of<PurchaseController>(context);
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
                          DefaultContainer(title: 'فواتير المشتريات'),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'التاريخ',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(40),
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () => _selectDate(context),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Text(
                                        "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                        style: TextStyle(
                                          color: ColorManager.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Container(
                                width: getProportionateScreenWidth(50),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const ['تم الطلب', 'تم الاستلام'],
                                  selectTalab: chose,
                                  onchanged: () => (val) {
                                    setState(() {
                                      performSearch(val.toString(),"","");
                                      chose = val;
                                    });
                                  },
                                  label: 'حاله الشراء',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'اسم المورد',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller1,
                                      hint: '',
                                      label: '',
                                      onTab: () {},
                                      validate: () {},
                                      onSave: () {},
                                      passFun: () {},
                                      perFix: Icon(Icons.search),
                                      color: Colors.white70,
                                      obscureText: false,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 90,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              DefaultTable(
                                columnData: columnData,
                                size: getProportionateScreenWidth(0.8),
                                color: ColorManager.second,
                                rows: dataId
                                    .map((data) => DataRow(cells: [
                                  DataCell(PopupMenuButton(
                                    iconSize:
                                    getProportionateScreenWidth(
                                        5),
                                    itemBuilder: (context) =>
                                    [
                                      PopupMenuItem(
                                        value: 6,
                                        child: Text('تفاصيل'),
                                        onTap: () async{

                                        },
                                      ),
                                      result[data]!["postatus"]=="تم الاستلام"
                                          ?PopupMenuItem(
                                        value: 6,
                                        child: Text(''),
                                        onTap: () async{
                                        },
                                      )
                                          :PopupMenuItem(
                                        value: 6,
                                        child: Text('تاكيد استلام'),
                                        onTap: () async{


                                          pro.date = result[data]!["date"].toString().substring(2,10);
                                          pro.payment = result[data]!["podownpayment"];
                                          pro.supplierName =result[data]!["suppliername"];
                                          pro.sfess = result[data]!["poshippingfees"];
                                          pro.payment = result[data]!["total"];
                                          pro.rbalance = result[data]!["total"]-result[data]!["podownpayment"];
                                          pro.podownpayment = result[data]!["podownpayment"];
                                          pro.poID = result[data]!["id"];
                                          var firestore = FirebaseFirestore.instance;
                                          QuerySnapshot qn = await firestore.collection("addpurchasing").doc(result[data]!["id"]).collection("rawmaterials").get();
                                          pro.products = qn.docs;
                                          print(qn.docs.length);
                                          print(result[data]!["id"]);
                                          QR.to(
                                              '/confirm_purchase');
                                        },
                                      ),
                                    ],
                                  )),



                                          DataCell(
                                              result[data]!["recevingDate"]==""?Text(""):Text(result[data]!["recevingDate"].toString().substring(2,10), style: style),
                                          ),
                                          DataCell(
                                              Text(result[data]!["date"].toString().substring(2,10), style: style)),
                                  DataCell(
                                      Text("${(result[data]!["total"]-result[data]!["podownpayment"]).toString()} جم", style: style)),
                                  DataCell(
                                              Text("${result[data]!["podownpayment"]} جم".toString(), style: style)),
                                  DataCell(
                                      Text("${result[data]!["total"].toString()} جم", style: style)),
                                  DataCell(
                                              Text(result[data]!["postatus"], style: style)),
                                          DataCell(
                                              Text(result[data]!["suppliername"], style: style)),
                                          DataCell(
                                              Text(result[data]!["id"], style: style)),

                                        ]))
                                    .toList(),
                              ),
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
                          const SizedBox(
                            height: 50,
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
      ),
    ));
  }
}
