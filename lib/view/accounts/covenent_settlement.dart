import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class CovenantSettlement extends StatefulWidget {
  const CovenantSettlement({Key? key}) : super(key: key);

  @override
  State<CovenantSettlement> createState() => _CovenantSettlementState();
}

class _CovenantSettlementState extends State<CovenantSettlement> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "100",
      "5": "كيلو",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "100",
      "5": "كيلو",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "100",
      "5": "كيلو",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "100",
      "5": "كيلو",
    },
  ];

  List<String> columnData = [
    "بواسطة",
    "السبب",
    "المبلغ",
    "متحصل العهدة",
    "التاريخ",
  ];

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

  Future<void> _select1Date(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: orderDate1,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate1) {
      setState(() {
        orderDate1 = pickedDate;
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
    resultAfterRemove.forEach((key, value)async {
      if (value.values.any((v) => v.toString().contains(treasury!))) {
      
         
          treasuryId = key;
          plus = resultAfterRemove[key]?['balance'] + amount;
          print(plus);
          await FirebaseFirestore.instance
              .collection('treasuryactions')
              .doc(key)
              .update({
            "balance": plus,
            "id": resultAfterRemove[key]?['id'],
            "name": resultAfterRemove[key]?['name'],
            "type": resultAfterRemove[key]?['type'],
            "usage": resultAfterRemove[key]?['usage'],
          });
        
      }
    });
  }

  String? treasuryId;
  int? plus;
  bool compare = false;
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
                          DefaultContainer(title: 'تسويه العهده'),
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
                                    ' البحث',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(70),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller1,
                                      perFix: const Icon(Icons.search),
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
                                    'الي التاريخ',
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
                                  Text(
                                    'من التاريخ',
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
                                      onPressed: () => _select1Date(context),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Text(
                                        "${orderDate1.year.toString()}/${orderDate1.month.toString().padLeft(2, '0')}/${orderDate1.day.toString().padLeft(2, '0')}",
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
                            ],
                          ),
                          const SizedBox(
                            height: 90,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width <= 708
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "خزينه المصنع",
                                    "فودافون كاش",
                                    "البنك الاهلي",
                                  ],
                                  selectTalab: chose1,
                                  onchanged: () => (val) {
                                    setState(() {
                                      chose1 = val;
                                    });
                                  },
                                  label: 'الرد الي الخزينه',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width <= 708
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "تحويل الي مشتريات",
                                    "تحويل الي مصروفات",
                                    "رد الي الخزينه",
                                  ],
                                  selectTalab: chose2,
                                  onchanged: () => (val) {
                                    setState(() {
                                      chose2 = val;
                                    });
                                  },
                                  label: 'حاله التسويه',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'مبلغ العهده',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black,
                                        fontSize:
                                            getProportionateScreenWidth(5)),
                                  ),
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
                                      color: Colors.grey,
                                      obscureText: false,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: getProportionateScreenWidth(90),
                                height: getProportionateScreenHeight(250),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: ColorManager.primary, width: 2),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.more_horiz,
                                          color: ColorManager.primary,
                                        ),
                                        Text(
                                          'ملحوظات',
                                          style: style,
                                        ),
                                        Icon(
                                          Icons.close,
                                          color: ColorManager.primary,
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: ColorManager.primary,
                                      thickness: 2,
                                    ),
                                    TextFormField(
                                      controller: controller3,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: getProportionateScreenWidth(90),
                                height: getProportionateScreenHeight(250),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: ColorManager.primary, width: 2),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.more_horiz,
                                          color: ColorManager.primary,
                                        ),
                                        Text(
                                          'تتبع',
                                          style: style,
                                        ),
                                        Icon(
                                          Icons.close,
                                          color: ColorManager.primary,
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: ColorManager.primary,
                                      thickness: 2,
                                    ),
                                    TextFormField(
                                      controller: controller4,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Botton(
                            bgColor: Colors.black,
                            color: Colors.white,
                            title: 'تسويه',
                            onTap: () async{
                              setState(() {
                                if (controller2.text == '' || chose1 == '') {
                              } else {
                                
                                  compareTreasury(
                                      chose1, int.parse(controller2.text));
                                      
                              
                                
                                
                               
                                
                              }
                              html.window.location.reload();
                              });
                              if (controller2.text == '' || chose1 == '') {
                              } else {
                                
                                  await compareTreasury(
                                      chose1, int.parse(controller2.text));
                                      
                              
                                
                                
                               
                                
                              }
                             

                            },
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
