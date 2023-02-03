import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erb_system/controller/category/category_controller.dart';
import 'package:erb_system/controller/purchase_controller/pruchase_controller.dart';
import 'package:erb_system/controller/suppliers/add_suppliers.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/resources/value_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:erb_system/view/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

class ConfirmPurchase extends StatefulWidget {
  const ConfirmPurchase({Key? key}) : super(key: key);

  @override
  State<ConfirmPurchase> createState() => _ConfirmPurchase();
}

class _ConfirmPurchase extends State<ConfirmPurchase> {
  DateTime orderDate = DateTime.now();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
   TextEditingController quantity = TextEditingController();
  String? chose1;

  int? selectedIndex;
  List data = [];
  List finalData = [];
  String ? bank;

  List<String> columnData = [
    "صوره الصنف",
    "الاجمالي",
    "السعر",
    "الوحده",
    "الكميه المطلوبه",
    "اسم الصنف",
  ];

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    var pro = Provider.of<PurchaseController>(context);
    controller2.text = pro.sfess.toString();
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
                              DefaultContainer(title: 'اضافه فاتوره مشتريات'),
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
                                      SizedBox(
                                        width: getProportionateScreenWidth(40),
                                        height: 60,
                                        child: ElevatedButton(
                                          onPressed: () => {},
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                          child: Text(
                                            pro.date!,
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
                                      const [ 'تم الطلب'],
                                      selectTalab: 'تم الطلب',
                                      onchanged: () => (val) {
                                        setState(() {

                                        });
                                      },
                                      label: 'تم الطلب',
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
                                      Text(pro.supplierName!),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: getProportionateScreenWidth(35),
                                        height: getProportionateScreenHeight(132),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 2,
                                            )),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'اضافة صورة',
                                              style: style,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child:Image.asset(
                                                ImageAssets.iconDropDown20,
                                                width:
                                                getProportionateScreenWidth(35),
                                                height:
                                                getProportionateScreenHeight(
                                                    85),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      DefaultTable(
                                          columnData: columnData,
                                          size: getProportionateScreenWidth(15),
                                          color: ColorManager.primary,
                                          rows: [
                                            ...pro.products!
                                                .map((data) => DataRow(cells: [
                                              DataCell(Image.network(
                                                data['image'],
                                                width: 50,
                                                height: 50,
                                              )),
                                              DataCell(Text(
                                                data['totalprice'],
                                                style: style,
                                              )),
                                              DataCell(Text(
                                                data['price'],
                                                style: style,
                                              )),
                                              DataCell(Text(
                                                data['unit'],
                                                style: style,
                                              )),
                                              DataCell(Text(
                                                data['requirequantity'].toString(),
                                                style: style,
                                              )),
                                              DataCell(Text(
                                                data['name'],
                                                style: style,
                                              )),
                                            ]))
                                                .toList(),
                                          ]),

                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: SizedBox(
                                        width: getProportionateScreenWidth(59),
                                        height: getProportionateScreenHeight(50),
                                        child: dropDown(
                                          const [
                                            'companytreasury',
                                            'bankalahly',
                                            'bankmasr',
                                          ],
                                          selectTalab: chose1,
                                          onchanged: () => (val) {

                                            setState(() {
                                              chose1 = val;
                                              bank = val;
                                            });
                                          },
                                          label: 'الخزينه',
                                          foColor: Colors.white,
                                          bgColor: ColorManager.primary,
                                          dpColor: ColorManager.primary,
                                        )),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'الشحن',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(60),
                                        height: 60,
                                        child: DefaultInputForm(
                                          controller: controller2,
                                          hint: '',
                                          label: '',
                                          onTab: () {},
                                          validate: () {},
                                          onSave: () {},
                                          passFun: () {},
                                          color: Colors.white70,
                                          obscureText: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'المبلغ المتبقي',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(60),
                                        height: 60,
                                        child: Text(controller5.text==""
                                            ?pro.rbalance!.toString()
                                            :(pro.rbalance!-int.parse(controller5.text)).toString()),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'الاجملي',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(60),
                                        height: 60,
                                        child: Text(pro.payment!.toString()),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'المبلغ المدفوع 2',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(60),
                                        height: 60,
                                        child: TextFormField(
                                          controller: controller5,
                                          style: TextStyle(
                                              fontSize:
                                              getProportionateScreenWidth(4)),
                                          onChanged: (v) {
                                            setState(() {
                                              if (v.isNotEmpty) {
                                              } else {

                                              }
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintStyle:
                                            const TextStyle(fontSize: 14),
                                            label: Container(
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  '',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(
                                                    AppSize.s15),
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1.2)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(
                                                    AppSize.s15),
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 1.2)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                  AppSize.s15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black, width: 1.2),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'المبلغ المدفوع ١',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(60),
                                        height: 60,
                                        child: Text(pro.podownpayment!.toString()),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Botton(
                                color: ColorManager.white,
                                title: 'تآكيد',
                                onTap: () async{
                                  showLoaderDialog(context);
                                  print("3");
                                  await FirebaseFirestore.instance.collection('addpurchasing').doc(pro.poID!).update(
                                      {
                                      "postatus":"تم الاستلام",
                                        "recevingDate":DateTime.now().toIso8601String().toString(),
                                        "trasury":bank!,
                                        "podownpayment":controller5.text==""
                                            ?pro.podownpayment!
                                            :int.parse(controller5.text)+pro.podownpayment!,
                                        "remainbalance":controller5.text=="" ?pro.rbalance!
                                            :pro.rbalance! - int.parse(controller5.text),
                                      });
                                  pro.products!.forEach((element) async {
                                    print("quantity ${element["requirequantity"]}");
                                    DocumentSnapshot rr = await FirebaseFirestore.instance.collection('warehouses')
                                        .doc('مخزن مواد خام').collection("Materials").doc(element["name"]).get();



                                    await FirebaseFirestore.instance
                                        .collection('warehouses')
                                        .doc('مخزن مواد خام')
                                        .collection("Reports")
                                        .add(
                                      {
                                        'quantity': int.parse(element["requirequantity"]),
                                        'afterQuantity': rr["quantity"]+int.parse(element["requirequantity"]),
                                        'beforeQuantity': rr["quantity"],
                                        'date': DateTime.now().toIso8601String(),
                                        'totalcost': int.parse(element['price'])*rr["quantity"],
                                        'name':element['name'],
                                        'type': "Purchase",
                                        'unitcost': element['price'],
                                        "id":pro.poID!,
                                      },
                                    );



                                      await FirebaseFirestore.instance.collection('addpurchasing').doc(pro.poID!).update({
                                        'recevingDate': DateTime.now().toIso8601String().toString(),
                                      });
                                      await FirebaseFirestore.instance
                                          .collection('warehouses')
                                          .doc('مخزن مواد خام')
                                          .collection("Materials")
                                          .doc(element["name"])
                                          .set(
                                        {'quantity': FieldValue.increment(int.parse(element["requirequantity"]))},
                                        SetOptions(merge: true),
                                      );

                                      await FirebaseFirestore.instance
                                          .collection("Materials")
                                          .doc(element["name"])
                                          .set(
                                        {'quantity': FieldValue.increment(int.parse(element["requirequantity"]))},
                                        SetOptions(merge: true),
                                      );

                                  });
                                  print("2");

                                  await FirebaseFirestore.instance
                                      .collection('treasuryactions')
                                      .doc(bank!)
                                      .get()
                                      .then((value1) async {
                                    print("2");
                                    FirebaseFirestore.instance
                                        .collection('treasuryactions')
                                        .doc(bank!)
                                        .collection("Reports")
                                        .add(
                                      {
                                        'afterQuantity': controller5.text ==""?value1["balance"]:value1["balance"]-int.parse(controller5.text),
                                        'beforeQuantity': value1["balance"],
                                        'date': DateTime.now().toIso8601String(),
                                        'totalcost': controller5.text ==""?"":int.parse(controller5.text),
                                        'type': "Purchase",
                                        "actionTaker":"ADMIN",
                                        "id":pro.poID,
                                      },
                                    );
                                    await FirebaseFirestore.instance
                                        .collection('treasuryactions')
                                        .doc(bank!)
                                        .set(
                                      {'balance': controller5.text=="" ?value1['balance']:value1['balance']-int.parse(controller5.text) },
                                      SetOptions(merge: true),
                                    );
                                  }).then((value2) async {
                                    print("3");
                                    await FirebaseFirestore.instance
                                        .collection('suppliers')
                                        .doc(pro.supplierName!)
                                        .get()
                                        .then((value3) async {
                                      print("4");
                                      await FirebaseFirestore.instance.collection('suppliers').doc(pro.supplierName!).set(
                                        {'balance':  controller5.text=="" ?value3['balance']:value3['balance']-int.parse(controller5.text)},
                                        SetOptions(merge: true),
                                      );
                                    });
                                  }).then((value) async {
                                    print("5");
                                    await FirebaseFirestore.instance
                                        .collection('warehouses')
                                        .doc('مخزن مواد خام')
                                        .get()
                                        .then((val) async {

                                      await FirebaseFirestore.instance
                                          .collection('warehouses')
                                          .doc('مخزن مواد خام')
                                          .set(
                                        {'balance': val['balance']},
                                        SetOptions(merge: true),
                                      );
                                    });
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  HomePage()),
                                  );
                                  try{

                                  }catch(e){
                                    print(e.toString());
                                  }
                                },
                                bgColor: ColorManager.black,
                              )
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
