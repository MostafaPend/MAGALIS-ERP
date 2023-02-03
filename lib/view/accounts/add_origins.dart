import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class AddOrigins extends StatefulWidget {
  const AddOrigins({Key? key}) : super(key: key);

  @override
  State<AddOrigins> createState() => _AddOriginsState();
}

class _AddOriginsState extends State<AddOrigins> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  String? selectTalab;
  String? treasuryId;
  int? minus;
  bool compare = false;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  DateTime orderDate = DateTime.now();

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

  Future<void> compareTreasury(String? treasury, int amount) async {
    Map<String, Map<String, dynamic>> resultAfterRemove = {};
    await FirebaseFirestore.instance
        .collection('treasuryactions')
        .get()
        .then((value) => value.docs.forEach((element) {
              resultAfterRemove[element.id] = element.data();
            }));
    resultAfterRemove.forEach((key, value) {
      if (value.values.any((v) => v.toString().contains(treasury!))) {
        if (resultAfterRemove[key]?['balance'] < amount) {
          compare = false;
        } else {
          compare = true;
          treasuryId = key;
          minus = resultAfterRemove[key]?['balance'] - amount;
          FirebaseFirestore.instance
              .collection('treasuryactions')
              .doc(key)
              .update({
            "balance": minus,
            "id": resultAfterRemove[key]?['id'],
            "name": resultAfterRemove[key]?['name'],
            "type": resultAfterRemove[key]?['type'],
            "usage": resultAfterRemove[key]?['usage'],
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
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
                          DefaultContainer(title: 'اضافة اصل'),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text('المبلغ المدفوع', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller1,
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
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
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
                                  Text('اسم الاصل', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
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
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text('قيمة الاصل الفعلية', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller3,
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
                              Container(
                                width: MediaQuery.of(context).size.width <= 500
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "خزينة المصنع",
                                    "البنك الاهلي",
                                    ' فودافون كاش',
                                    "بنك مصر",
                                  ],
                                  selectTalab: selectTalab,
                                  onchanged: () => (val) {
                                    setState(() {
                                      selectTalab = val;
                                    });
                                  },
                                  label: 'الخزينة',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(128),
                          ),
                          Botton(
                            bgColor: Colors.black,
                            color: Colors.white,
                            title: 'اضافة',
                            onTap: () {
                              setState(() {
                                compareTreasury(
                                    selectTalab, int.parse(controller1.text));
                              });
                              if (controller1.text == '' ||
                                  controller2.text == '' ||
                                  controller3.text == '' ||
                                  selectTalab == '') {
                              } else {
                                if (compare == true) {
                                  FirebaseFirestore.instance
                                      .collection('assets')
                                      .add({
                                    'name': controller2.text,
                                    'amount': controller1.text,
                                    'date': orderDate,
                                    'currentvalue': controller3.text,
                                    'formtreasury': selectTalab,
                                  });
                                  setState(() {
                                    html.window.location.reload();
                                  });
                                } else { final snackBar = SnackBar(
                                          content: Text(
                                              'هذا المبلغ غير متوفر في الوقت الحالي لدى ' +
                                                  selectTalab.toString()),
//
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);}
                              }
                            },
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
