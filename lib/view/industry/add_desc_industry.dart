import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erb_system/controller/category/category_controller.dart';
import 'package:erb_system/resources/assets_manager.dart';
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
import 'package:provider/provider.dart';

import '../../controller/manufacturing/manufacturing_controller.dart';

class AddDescIndustry extends StatefulWidget {
  const AddDescIndustry({Key? key}) : super(key: key);

  @override
  State<AddDescIndustry> createState() => _AddDescIndustryState();
}

class _AddDescIndustryState extends State<AddDescIndustry> {
  String? chose;
  String? chose1;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controllerz = TextEditingController();
  String? catName;
  int? catPrice;
  String? catMeasurement;
  String? catType;
  String? image;
  int totalTotal = 0;
  int totalQuantity = 0;
  String? bank;
  String? supName;

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

  List data = [];
  List finalData = [];
  int check = 0;

  List<String> columnData = [
    "صوره الصنف",
    "التكلفه الاجماليه",
    "التكلفه",
    "الوحده",
    "الكميه المطلوبه",
    "النوع",
    " الصنف",
  ];

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
                              DefaultContainer(title: 'اضافه وصفه'),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  chose != null
                                      ? Consumer<CategoryController>(
                                    builder: (context, valu, child) {
                                      return FutureBuilder(
                                          future: valu
                                              .getMaterialsWareHouse(chose!),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              List sup =
                                              snapshot.data as List;

                                              return SizedBox(
                                                width:
                                                getProportionateScreenWidth(
                                                    50),
                                                height: 60,
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
                                                          (index) =>
                                                      sup[index]['name']),
                                                  dropdownDecoratorProps:
                                                  const DropDownDecoratorProps(
                                                    dropdownSearchDecoration:
                                                    InputDecoration(
                                                      hintText: "اسم المنتج",
                                                    ),
                                                  ),
                                                  onChanged: (v) async {
                                                    setState(() {
                                                      controller1.text = v!;
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
                                    width: getProportionateScreenWidth(50),
                                    height: getProportionateScreenHeight(90),
                                    padding: const EdgeInsets.only(top: 35),
                                    child: dropDown(
                                      const [
                                        'مخزن منتج تحت التشغيل',
                                        'مخزن منتج تام'
                                      ],
                                      selectTalab: chose,
                                      onchanged: () => (val) {
                                        setState(() {
                                          chose = val;
                                        });
                                      },
                                      label: 'نوع المنتج',
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 90,
                              ),
                              Column(
                                children: [
                                  check == 1
                                      ? DefaultTable(
                                    columnData: columnData,
                                    size: getProportionateScreenWidth(25),
                                    color: ColorManager.primary,
                                    rows: data
                                        .map((data) => DataRow(cells: [
                                      DataCell(Image.asset(
                                        ImageAssets.iconDropDown23,
                                        width: 50,
                                        height: 50,
                                      )),
                                      DataCell(Text(
                                        data['totalPrice'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['price'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['measurement']
                                            .toString(),
                                        style: style,
                                      )),
                                      DataCell(
                                        Text(
                                          "0",
                                          style: style,
                                        ),
                                      ),
                                      DataCell(Text(
                                        data['name'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['name'].toString(),
                                        style: style,
                                      )),
                                    ]))
                                        .toList(),
                                  )
                                      : DefaultTable(
                                    columnData: columnData,
                                    size: getProportionateScreenWidth(25),
                                    color: ColorManager.primary,
                                    rows: finalData
                                        .map((data) => DataRow(cells: [
                                      DataCell(Image.asset(
                                        ImageAssets.iconDropDown23,
                                        width: 50,
                                        height: 50,
                                      )),
                                      DataCell(Text(
                                        data['totalPrice'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['price'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['measurement']
                                            .toString(),
                                        style: style,
                                      )),
                                      DataCell(
                                        Text(
                                          data['quantity'].toString(),
                                          style: style,
                                        ),
                                      ),
                                      DataCell(Text(
                                        data['name'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['name'].toString(),
                                        style: style,
                                      )),
                                    ]))
                                        .toList(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Consumer<CategoryController>(
                                      builder: (context, valu, child) {
                                        return FutureBuilder(
                                            future: valu.getMaterials(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                List sup = snapshot.data as List;

                                                return SizedBox(
                                                  width:
                                                  getProportionateScreenWidth(
                                                      50),
                                                  height: 60,
                                                  child: check == 0
                                                      ? DropdownSearch<String>(
                                                    popupProps:
                                                    PopupProps.menu(
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
                                                        ['name']),
                                                    dropdownDecoratorProps:
                                                    const DropDownDecoratorProps(
                                                      dropdownSearchDecoration:
                                                      InputDecoration(
                                                        hintText: "اسم الصنف",
                                                      ),
                                                    ),
                                                    onChanged: (v) async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                          'Materials')
                                                          .doc(v)
                                                          .get()
                                                          .then((value) {
                                                        catPrice =
                                                        value['price'];
                                                        catName = v;

                                                        catMeasurement = value[
                                                        'measurement'];
                                                        catType =
                                                        value['type'];
                                                        image =
                                                        value['image'];
                                                        data.add({
                                                          "name": v,
                                                          'quantity': 0,
                                                          "measurement": value[
                                                          'measurement'],
                                                          'price':
                                                          value['price'],
                                                          'totalPrice': 0,
                                                          'image': "",
                                                          'type':
                                                          value['type'],
                                                        });
                                                      });

                                                      setState(() {
                                                        check = 1;
                                                      });
                                                    },
                                                  )
                                                      : Container(
                                                    width: 400,
                                                    height: 100,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 200,
                                                          child:
                                                          TextFormField(
                                                            controller:
                                                            controllerz,
                                                            style: TextStyle(
                                                                fontSize:
                                                                getProportionateScreenWidth(
                                                                    4)),
                                                            onChanged: (v) {},
                                                            decoration:
                                                            InputDecoration(
                                                              border:
                                                              InputBorder
                                                                  .none,
                                                              hintStyle:
                                                              const TextStyle(
                                                                  fontSize:
                                                                  14),
                                                              label:
                                                              Container(
                                                                  alignment:
                                                                  Alignment
                                                                      .center,
                                                                  child:
                                                                  const Text(
                                                                    '',
                                                                    textAlign:
                                                                    TextAlign.center,
                                                                    style:
                                                                    TextStyle(color: Colors.white),
                                                                  )),
                                                              filled: true,
                                                              fillColor:
                                                              Colors
                                                                  .white,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Botton(
                                                          color: ColorManager
                                                              .white,
                                                          title: 'اضافه',
                                                          onTap: () {
                                                            setState(() {
                                                              totalTotal = totalTotal +
                                                                  (int.parse(controllerz
                                                                      .text) *
                                                                      catPrice!);
                                                              finalData.add({
                                                                "name":
                                                                catName,
                                                                'quantity': int.parse(
                                                                    controllerz
                                                                        .text),
                                                                "measurement":
                                                                catMeasurement,
                                                                'price':
                                                                catPrice,
                                                                'totalPrice':
                                                                int.parse(
                                                                    controllerz.text) *
                                                                    catPrice!,
                                                                'image':
                                                                " 'image",
                                                              });
                                                              check = 0;
                                                            });
                                                          },
                                                          bgColor:
                                                          ColorManager
                                                              .black,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return const CircularProgressIndicator();
                                              }
                                            });
                                      },
                                    ),
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
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
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
                                      controller3.text == ""
                                          ? SizedBox(
                                        width:
                                        getProportionateScreenWidth(60),
                                        height: 60,
                                        child: Text(
                                          totalTotal.toString(),
                                          style: style,
                                        ),
                                      )
                                          : SizedBox(
                                        width:
                                        getProportionateScreenWidth(60),
                                        height: 60,
                                        child: Text(
                                          (totalTotal +
                                              int.parse(controller3.text))
                                              .toString(),
                                          style: style,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                  chose1 == "ثابت" || chose1 == null
                                      ? Container()
                                      : Column(
                                    children: [
                                      Text(
                                        'التكلفه المتغيره',
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width:
                                        getProportionateScreenWidth(60),
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: SizedBox(
                                        width: getProportionateScreenWidth(40),
                                        height: getProportionateScreenHeight(50),
                                        child: dropDown(
                                          const [
                                            'ثابت',
                                            'متغير',
                                          ],
                                          selectTalab: chose1,
                                          onchanged: () => (val) {
                                            setState(() {
                                              chose1 = val;
                                            });
                                          },
                                          label: 'نوع التكلفه',
                                          foColor: Colors.white,
                                          bgColor: ColorManager.primary,
                                          dpColor: ColorManager.primary,
                                        )),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Botton(
                                color: ColorManager.white,
                                title: 'تاكيد',
                                onTap: () {
                                  if (chose1 == null || chose == null) {
                                    //print("NO");
                                  } else {
                                    if (chose1 == "ثابت") {
                                      pro.addManufacturing(
                                          chose1!,
                                          controller1.text,
                                          chose!,
                                          0,
                                          totalTotal,
                                          finalData);
                                    } else {
                                      pro.addManufacturing(
                                          chose1!,
                                          controller1.text,
                                          chose!,
                                          int.parse(controller3.text),
                                          totalTotal,
                                          finalData);
                                    }
                                  }
                                },
                                bgColor: ColorManager.black,
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