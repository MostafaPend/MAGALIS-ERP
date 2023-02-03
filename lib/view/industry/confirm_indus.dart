import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erb_system/controller/category/category_controller.dart';
import 'package:erb_system/controller/manufacturing/manufacturing_controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmIndus extends StatefulWidget {
  const ConfirmIndus({Key? key}) : super(key: key);

  @override
  State<ConfirmIndus> createState() => _ConfirmIndusState();
}

class _ConfirmIndusState extends State<ConfirmIndus> {
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  List items = [];
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller2.addListener(() {
      setState(() {
        finalPrice = totalPrice * int.parse(controller2.text);
      });
    });
  }

  int totalPrice = 0;
  int finalPrice = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    var pro = Provider.of<ManufacturingController>(context);
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
                              DefaultContainer(title: 'تأكيد امر التصنيع'),
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
                                        'اجمالي التكلفه',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(50),
                                        height: 60,
                                        child: Center(
                                            child: Text(
                                              (finalPrice.toString()),
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'الكميه',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
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
                                          color: Colors.white70,
                                          obscureText: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                  chose1 != null
                                      ? Consumer<ManufacturingController>(
                                    builder: (context, valu, child) {
                                      return FutureBuilder(
                                          future:
                                          valu.getManfuctureType(chose1!),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              List sup =
                                              snapshot.data as List;

                                              return SizedBox(
                                                width:
                                                getProportionateScreenWidth(
                                                    40),
                                                height: 75,
                                                child: DropdownSearch<String>(
                                                  popupProps: PopupProps.menu(
                                                    showSelectedItems: true,
                                                    showSearchBox: true,
                                                    searchFieldProps:
                                                    TextFieldProps(
                                                        cursorColor:
                                                        ColorManager
                                                            .primary),
                                                    // disabledItemFn:
                                                    //     (String s) =>
                                                    //         s.startsWith('I'),
                                                  ),
                                                  items: List.generate(
                                                      sup.length,
                                                          (index) => sup[index]
                                                      ['productname']),
                                                  dropdownDecoratorProps:
                                                  const DropDownDecoratorProps(
                                                    dropdownSearchDecoration:
                                                    InputDecoration(
                                                      hintText: "اسم المنتج",
                                                    ),
                                                  ),
                                                  onChanged: (v) async {
                                                    //print(v);
                                                    QuerySnapshot qn =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                        "manufacturing")
                                                        .doc(v)
                                                        .collection(
                                                        "billofmaterial")
                                                        .get();

                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                        "manufacturing")
                                                        .doc(v)
                                                        .get()
                                                        .then((value) {
                                                      setState(() {
                                                        controller3.text = v!;
                                                        items = qn.docs;
                                                        totalPrice = value[
                                                        'totalCost'];
                                                        //print(totalPrice.toString());
                                                      });
                                                    });
                                                  },
                                                ),
                                              );
                                            } else {
                                              return const CircularProgressIndicator();
                                            }
                                          });
                                    },
                                  )
                                      : Container(),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                  Container(
                                    width: 250,
                                    height: getProportionateScreenHeight(90),
                                    padding: const EdgeInsets.only(top: 35),
                                    child: dropDown(
                                      const [
                                        'مخزن منتج تحت التشغيل',
                                        'مخزن منتج تام'
                                      ],
                                      selectTalab: chose1,
                                      onchanged: () => (val) {
                                        setState(() {
                                          chose1 = val;
                                        });
                                      },
                                      label: 'نوع المنتج',
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(1),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 90,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                      Text(
                                        'اضافه خاصه للعميل',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(50),
                                        height: 60,
                                        child: DefaultInputForm(
                                          controller: controller4,
                                          hint: '',
                                          label: '',
                                          onTab: () {},
                                          validate: () {},
                                          onSave: () {},
                                          passFun: () {},
                                          perFix: const Icon(Icons.search),
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
                                    width: getProportionateScreenWidth(40),
                                    height: getProportionateScreenHeight(90),
                                    padding: const EdgeInsets.only(top: 35),
                                    child: dropDown(
                                      const ['تم الانتهاء', 'في التصنيع'],
                                      selectTalab: chose2,
                                      onchanged: () => (val) {
                                        setState(() {
                                          chose2 = val;
                                        });
                                      },
                                      label: 'حاله التصنيع',
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(1),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              Botton(
                                color: ColorManager.white,
                                title: 'تاكيد',
                                onTap: () {
                                  if (chose2 != null || chose2 != "") {
                                    pro.addManufacturingOrder(
                                        "ADMIN",
                                        chose2!,
                                        controller3.text,
                                        chose1!,
                                        int.parse(controller2.text),
                                        finalPrice,
                                        items);
                                  } else {}
                                },
                                bgColor: ColorManager.primary,
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