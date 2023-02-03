import 'dart:io';

import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../size_config.dart';

class PriceQuotation extends StatefulWidget {
  @override
  State<PriceQuotation> createState() => _PriceQuotationState();
}

class _PriceQuotationState extends State<PriceQuotation> {
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

  List data = [
    {
      "1": "            ",
      "2": "                        ",
    },
  ];

  List<String> columnData = [
    "Payment terms",
    "Payment method",
  ];
  List data1 = [
    {
      "1": "            ",
      "2": "                        ",
      "3": "                        ",
    },
  ];

  List<String> columnData1 = [
    "Product",
    "Price",
    "Description",
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    // var format = DateFormat.yMd('ar');

    return Scaffold(
      body: Row(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
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
                                    'Price Quotation',
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
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.indigo,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.print,
                                    size: getProportionateScreenWidth(10),
                                    color: ColorManager.primary,
                                  ),
                                )
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
                                            "Date:",
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
                                            getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller1,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'DD',
                                                hintStyle:
                                                TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "/",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width:
                                            getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller2,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'MM',
                                                hintStyle:
                                                TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "/",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width:
                                            getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller3,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'YYYY',
                                                hintStyle:
                                                TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Valid till :",
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
                                            getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller1,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'DD',
                                                hintStyle:
                                                TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "/",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width:
                                            getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller2,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'MM',
                                                hintStyle:
                                                TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "/",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width:
                                            getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller3,
                                              style: style,
                                              decoration: const InputDecoration(
                                                hintText: 'YYYY',
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
                                            "Quote for :",
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
                            Row(
                              children: [
                                DefaultTable(
                                    columnData: columnData1,
                                    size: getProportionateScreenWidth(60),
                                    color: ColorManager.primary,
                                    rows: [
                                      ...data1
                                          .map((data) => DataRow(cells: [
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: getProportionateScreenWidth(35),
                                      height: getProportionateScreenHeight(140),
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
                                            'Add Photo',
                                            style: style,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                _pickImage();
                                              },
                                              child: _pickedImage == null
                                                  ? Image.asset(
                                                ImageAssets
                                                    .iconDropDown20,
                                                width:
                                                getProportionateScreenWidth(
                                                    35),
                                                height:
                                                getProportionateScreenHeight(
                                                    85),
                                              )
                                                  : Image.memory(webImage)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DefaultTable(
                                columnData: columnData,
                                size: getProportionateScreenWidth(80),
                                color: ColorManager.primary,
                                rows: [
                                  ...data
                                      .map((data) => DataRow(cells: [
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
                              height: 32,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.arrow_forward_outlined),
                                    Text(
                                      'We hope you are satisfied with your purchase. Thank you for putting your trust and confidence in our company.',
                                      style: style,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.arrow_forward_outlined),
                                    Text(
                                      'For more information, email us on info@magalis-egypt.com',
                                      style: style,
                                    ),
                                  ],
                                ),
                              ],
                            )
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