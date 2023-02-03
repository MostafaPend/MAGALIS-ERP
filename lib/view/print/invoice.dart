import 'dart:io';

import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../size_config.dart';

class Invoice extends StatefulWidget {
  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  DateTime now = DateTime.now();
  String? categoryValue;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();
  TextEditingController controller9 = TextEditingController();
  DateTime orderDate = DateTime.now();
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  List<String> columnData = [
    "Item Description",
    "QTY",
    "Price Per item ",
    "Amount",
  ];
  List data1 = [
    {
      "1": "            ",
      "2": "                        ",
      "3": "                        ",
      "4": "                        ",
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    // var format = DateFormat.yMd('ar');

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 90),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    'Invoice',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize:
                                        getProportionateScreenWidth(6),
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(5),
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    child: TextFormField()),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 32.0, left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Invoice to :",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                50,
                                          ),
                                          SizedBox(
                                            width:
                                            getProportionateScreenWidth(60),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller5,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintStyle:
                                                TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                50,
                                          ),
                                          Text(
                                            "Phone number :",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                50,
                                          ),
                                          SizedBox(
                                            width:
                                            getProportionateScreenWidth(60),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller5,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintStyle:
                                                TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Shopping Address :",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                50,
                                          ),
                                          SizedBox(
                                            width:
                                            getProportionateScreenWidth(60),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller5,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintStyle:
                                                TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DefaultTable(
                                columnData: columnData,
                                size: getProportionateScreenWidth(50),
                                color: ColorManager.primary,
                                rows: [
                                  ...data1
                                      .map((data) => DataRow(cells: [
                                    DataCell(Text(
                                      data['4'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['3'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['2'],
                                      style: style,
                                    )),
                                    DataCell(Text(
                                      data['1'],
                                      style: style,
                                    )),
                                  ]))
                                      .toList(),
                                ]),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Shopping Free'),
                                DefaultContainer(title: 'Total Amount : ')
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.arrow_forward_outlined,
                                        color: ColorManager.primary),
                                    Text(
                                      'We hope you are satisfied with your purchase. Thank you for putting your trust and confidence in our company.',
                                      style: style,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 90),
                              decoration: BoxDecoration(
                                color: ColorManager.primary,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    backgroundImage:
                                    AssetImage(ImageAssets.iconDropDown35),
                                  ),
                                  Text(
                                    'info@magalis-egypt.com',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize:
                                        getProportionateScreenWidth(6),
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: Colors.black,
                                    backgroundImage:
                                    AssetImage(ImageAssets.iconDropDown34),
                                  ),
                                  Text(
                                    '+00201118127345',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize:
                                        getProportionateScreenWidth(6),
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.print,
                                      size: 45,
                                    )),
                                SizedBox(
                                  width: 40,
                                ),
                                DefaultContainer(title: 'طباعه')
                              ],
                            ),
                          ],
                        ),
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
    );
  }

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        //print('No iamge has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        //print('No iamge has been picked');
      }
    } else {
      //print('Something Went Wrong');
    }
  }
}