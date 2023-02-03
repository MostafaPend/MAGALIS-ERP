import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:universal_html/html.dart' as html;
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

class PayCovenant extends StatefulWidget {
  String? amount;
  String? date;
  String? description;
  String? status;
  String? receiver;
  String? notes;
  String? treasury;
  bool isEdit;
  bool isFromAnotherPage;
  String? id;
  PayCovenant(
      {Key? key,
      this.amount,
      this.date,
      this.description,
      this.receiver,
      this.status,
      this.notes,
      this.treasury,
      this.id,
      this.isFromAnotherPage = false,
      this.isEdit = true})
      : super(key: key);

  @override
  State<PayCovenant> createState() => _PayCovenantState();
}

class _PayCovenantState extends State<PayCovenant> {
  String? status;
  String? treasury;
  String? receiver;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController notesTextController = TextEditingController();
  TextEditingController descController = TextEditingController();

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

  void initState() {
    super.initState();

    treasury = widget.treasury;
    receiver = widget.receiver;
    status = widget.status;
    descController.text = widget.description ?? "";
    amountController.text = widget.amount ?? "";
    notesTextController.text = widget.notes ?? "";

    // TODO: implement initState
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

  String? treasuryId;
  int? minus;
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
                          DefaultContainer(
                              title:
                                  widget.isFromAnotherPage ? 'تعديل' : 'صرف'),
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
                                    ' التاريخ',
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
                            ],
                          ),
                          const SizedBox(
                            height: 20,
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
                                  selectTalab: treasury,
                                  onchanged: () => (val) {
                                    setState(() {
                                      treasury = val;
                                    });
                                  },
                                  label: 'الخزينه',
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
                                    "موسي",
                                    "خالد",
                                  ],
                                  selectTalab: receiver,
                                  onchanged: () => (val) {
                                    setState(() {
                                      receiver = val;
                                    });
                                  },
                                  label: 'متحصل العهده',
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
                                      controller: amountController,
                                      hint: '',
                                      label: '',
                                      readOnly: !widget.isEdit,
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
                              Container(
                                width: MediaQuery.of(context).size.width <= 708
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "نقديه",
                                    "عينيه",
                                  ],
                                  selectTalab: status,
                                  onchanged: () => (val) {
                                    setState(() {
                                      status = val;
                                    });
                                  },
                                  label: 'نوع العهده',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
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
                                      readOnly: !widget.isEdit,
                                      controller: notesTextController,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'وصف',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: getProportionateScreenWidth(90),
                                    height: getProportionateScreenHeight(250),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: ColorManager.primary,
                                          width: 2),
                                    ),
                                    child: TextFormField(
                                      readOnly: !widget.isEdit,
                                      controller: descController,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Botton(
                            bgColor: Colors.black,
                            color: Colors.white,
                            title: widget.isFromAnotherPage ? 'تعديل' : 'صرف',
                            onTap: () async {
                              // chose == "عينيه"
                              //     ? FirebaseFirestore.instance
                              //         .collection('finance')
                              //         .add({
                              //         'quantity': controller1.text,
                              //         'date': now,
                              //         'item': now,
                              //         'description': controller2.text,
                              //         'status': typeOrder,
                              //         'receiver': '',
                              //         'reason': '',
                              //         'warehouse': '',
                              //         'notes': notesTextController.text,
                              //       })
                              //     :
                              setState(() {
                                compareTreasury(
                                    treasury, int.parse(amountController.text));
                              });
                              if ( amountController.text == '' ||
                                        descController.text == '' ||
                                        status == '' ||
                                        notesTextController.text == '' ||
                                        receiver == '') {
                                
                              } else {
                                if (compare == true) {
                                   if (widget.id == null) {
                                await FirebaseFirestore.instance
                                    .collection("addcashcustody")
                                    .add({
                                  'amount': amountController.text,
                                  'date': orderDate,
                                  'description': descController.text,
                                  'status': status,
                                  'receiver': receiver,
                                  'notes': notesTextController.text,
                                  'treasury': treasury,
                                });
                              } else {
                                await FirebaseFirestore.instance
                                    .collection("addcashcustody")
                                    .doc(widget.id)
                                    .update({
                                  'amount': amountController.text,
                                  'date': orderDate,
                                  'description': descController.text,
                                  'status': status,
                                  'receiver': receiver,
                                  'notes': notesTextController.text,
                                  'treasury': treasury,
                                });
                              }
                                } else {
                                   final snackBar = SnackBar(
                                          content: Text(
                                              'هذا المبلغ غير متوفر في الوقت الحالي لدى ' +
                                                  treasury.toString()),
//
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                }
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
