import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/merge_table/merge_table.dart';
import 'package:erb_system/merge_table/src/datas/m_row.dart';
import 'package:erb_system/merge_table/src/merge_table.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:flutter/material.dart';
import 'package:erb_system/merge_table/src/datas/merge_table_alignment.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../controller/Orders/orders_controller.dart';
import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';
import '../auth/component/text_fom_feild.dart';
import '../home/components/drop_down.dart';

class account_statement extends StatefulWidget {
  String id;
  account_statement({Key? key,required this.id}) : super(key: key);

  @override
  State<account_statement> createState() => _account_statementState();
}

class _account_statementState extends State<account_statement> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  String? chose;
  String? chose1;
  String? chose2;
  String? chose3;
  bool isVisible = false;
  String? state;
  DateTime orderDate = DateTime.now();
  int ? am;
  String ? orderNumber;
  String ? couriarName;
  String ? orderID;
  String ? paymentStatus;
  var ttPrice = 0;

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

  showLoaderDialog(BuildContext c){
    showDialog(
      barrierDismissible: false,
      context:c,
      builder:(c){
        return AlertDialog(
          backgroundColor: Colors.black,
          content: new Row(
            children: [
              Spacer(),
              Spacer(),
              CircularProgressIndicator(color: Colors.red,),
              Spacer(),
              Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." ,style: TextStyle(color: Colors.white),)),
              Spacer(),
              Spacer(),

            ],),
        );
      },
    );
  }

  List<String> columnData = [
   "",
    "المبلغ",
    "حاله الدفع",
    "تاريخ التحصيل",
    "تاريخ الشحن",
    "تاريخ الطلب",
    "رقم الموبيل",
    "اسم العميل",
    "رقم الطلب",
  ];

  List<String> dataTable = ["الطلبات"];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(6));
    var pro = Provider.of<AddOrderController>(context);
    var pros = Provider.of<Controller>(context);

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: FutureBuilder(
                  future: pro.getCouriersBalance(widget.id,state),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      ttPrice=0;
                      List sData = snapshot.data as List;
                      for(int i =0;i<sData.length;i++){
                        ttPrice = ttPrice + sData[i]["amount"] as int;
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          const SizedBox(
                            height: 20,
                          ),
                          DefaultContainer(
                            title: '${widget.id} كشف حساب',
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Column(
                                children: [
                                  Text(
                                    'المبلغ المتبقي',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black,
                                        fontSize: getProportionateScreenWidth(5)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(child: Text(ttPrice.toString()),)
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'عدد الطلبات تحت التحصيل',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black,
                                        fontSize: getProportionateScreenWidth(5)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(child: Text(sData.length.toString()),)
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Container(
                                width: getProportionateScreenWidth(60),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    'تم شحن',
                                    'تم التحصيل',
                                    'رفض استالم'
                                  ],
                                  selectTalab: state,
                                  onchanged: () => (val) {
                                    setState(() {
                                      state = val;
                                    });
                                  },
                                  label: 'الحالة',
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
                                    'التاريخ',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black,
                                        fontSize: getProportionateScreenWidth(5)),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(40),
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () => _selectDate(context),
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(Colors.white)),
                                      child: Text(
                                        "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                        style: TextStyle(
                                            color: Color(0xff82225E),
                                            fontSize: getProportionateScreenWidth(5)),
                                      ),
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
                            height: 64,
                          ),
                          sData.isEmpty?Container():Center(child: Stack(
                            children: [
                              Padding(padding: EdgeInsets.only(bottom: 25),
                                child: Center(child: SizedBox(
                                  width: getProportionateScreenWidth(250),
                                  child: MergeTable(
                                    borderColor: Colors.black,
                                    alignment: MergeTableAlignment.center,
                                    columns: [
                                      MMergedColumns(
                                        header: "الطلبات",
                                        columns: columnData,
                                      ),
                                    ],
                                    rows: sData
                                        .map(
                                          (e) => [
                                        MMergedRows([
                                          SizedBox(
                                              width:
                                              getProportionateScreenWidth(40),
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .width <=
                                                  800
                                                  ? 7
                                                  : 30,
                                              child: dropDown(
                                                const [
                                                  'تحصيل',
                                                  'رفض استلام',
                                                ],

                                                onchanged: () => (val) {
                                                  if (val == 'تحصيل') {
                                                    setState(() {
                                                      isVisible = true;
                                                    });
                                                  }
                                                  setState(() {
                                                    chose1 = val;
                                                    am = e["amount"];
                                                    couriarName = e["courrier"];
                                                    orderNumber = e["orderNumber"];
                                                    orderID = e.id;
                                                    paymentStatus =  e["paymentStatus"];
                                                  });
                                                },
                                                label: 'خيارات',
                                                foColor: Colors.white,
                                                bgColor: ColorManager.primary,
                                                dpColor: ColorManager.primary,
                                              )),
                                          Text(
                                            e['amount'].toString(),
                                            style: style,
                                          ),
                                          Text(
                                            e['paymentStatus'].toString(),
                                            style: style,
                                          ),

                                          Text(
                                            e['collectDate'].toString(),
                                            style: style,
                                          ),
                                          Text(
                                            e['shipDate'].toString(),
                                            style: style,
                                          ),
                                          Text(
                                            e['orderDate'].toString(),
                                            style: style,
                                          ),

                                          Text(e['phoneNumber'], style: style),
                                          Text(e['customerName'], style: style),
                                          Text(e['orderNumber'], style: style),
                                        ]),
                                      ],
                                    )
                                        .toList(),
                                    color: ColorManager.second,
                                    size: getProportionateScreenWidth(5),
                                  ),
                                ),),),
                              isVisible
                                  ? Container(
                                width: getProportionateScreenWidth(200),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    IconButton(
                                      iconSize: 25,
                                      icon: const Icon(
                                        Icons.close,
                                      ),
                                      // the method which is called
                                      // when button is pressed
                                      onPressed: () {
                                        setState(
                                              () {
                                            isVisible =false;
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(height: 10,),
                                    SizedBox(
                                        width:
                                        getProportionateScreenWidth(
                                            40),
                                        height: MediaQuery.of(context)
                                            .size
                                            .width <=
                                            800
                                            ? 7
                                            : 30,
                                        child: dropDown(
                                          const [
                                            'paymob',
                                            'bankalahly',
                                            'companytreasury',
                                            'bankmasr',
                                          ],
                                          selectTalab: chose3,
                                          onchanged: () => (val) {
                                            if (val == 'تحصيل') {
                                              setState(() {
                                                isVisible = true;
                                              });
                                            }
                                            setState(() {
                                              chose3 = val;
                                            });
                                          },
                                          label: "اختيار الخزينه",
                                          foColor: Colors.white,
                                          bgColor: ColorManager.primary,
                                          dpColor: ColorManager.primary,
                                        )),
                                    SizedBox(height: 10,),
                                    Botton(
                                      bgColor: Colors.black,
                                      color: Colors.white,
                                      title: 'تاكيد تحصيل',
                                      onTap: () async{
                                        showLoaderDialog(context);
                                        if(paymentStatus != "تم شحن"){

                                        }
                                        else{
                                          print("1");
                                          await FirebaseFirestore.instance.collection("supplychain").doc(orderNumber!).update(
                                              {
                                                "orderstatus":"تم التحصيل",
                                                "statusdate":DateTime.now().toString(),
                                              });
                                          print("2");

                                          await FirebaseFirestore.instance.collection("courrierbalanceaction").doc(orderID!).update(
                                              {
                                                "paymentStatus":"تم التحصيل",
                                                "collectDate":DateTime.now().toString(),
                                              });
                                          await  FirebaseFirestore.instance.collection('supplychain').doc(orderNumber!).collection("Tracking").add(
                                              {
                                                "by":pros.name,
                                                "type":"تم التحصيل",
                                                "date":DateTime.now().toIso8601String().toString(),

                                              });

                                          print("3");
                                          await FirebaseFirestore.instance.collection("courriers").doc(couriarName!).update(
                                              {
                                                "balance":FieldValue.increment(-am!),
                                              });
                                          print("4");
                                          await FirebaseFirestore.instance.collection("treasuryactions").doc(chose3.toString()).update(
                                              {
                                                "balance":FieldValue.increment(am!),
                                              });
                                          pro.notifyListeners();

                                          QR.to("/home");
                                        }
                                      },
                                    )
                                  ],
                                ),
                              )
                                  : Container()
                            ],
                          ),),


                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ),
          ),
          const DefaultRow(),
        ],
      ),
    );
  }
}
