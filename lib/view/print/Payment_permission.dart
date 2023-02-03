import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../size_config.dart';

class PaymentPermission extends StatefulWidget {
  @override
  State<PaymentPermission> createState() => _PaymentPermissionState();
}

class _PaymentPermissionState extends State<PaymentPermission> {
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

  List data = [
    {
      "1": "            ",
      "2": "                        ",
    },
  ];

  List<String> columnData = [
    "   البيان",
    "   ت",
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
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
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
                                DefaultContainer(title: 'اذن استيلام'),
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
                                  onPressed: () {
                                    printDoc();
                                  },
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(15),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller1,
                                              style: style,
                                              decoration: const InputDecoration(
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
                                            "الموافق",
                                            style: style,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                25,
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(40),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller4,
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
                                            "انه في يوم",
                                            style: style,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
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
                                            "استلمت انا",
                                            style: style,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(60),
                                            height: 40,
                                            child: TextFormField(
                                              controller: controller6,
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
                                            " احمل بطاقة رقم قومي",
                                            style: style,
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
                                size: getProportionateScreenWidth(80),
                                color: Colors.black,
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
                              height: 20,
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: getProportionateScreenWidth(60),
                                  height: 40,
                                  child: TextFormField(
                                    controller: controller7,
                                    style: style,
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 50,
                                ),
                                Text(
                                  "التوقيع",
                                  style: style,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 25,
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(60),
                                  height: 40,
                                  child: TextFormField(
                                    controller: controller8,
                                    style: style,
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 50,
                                ),
                                Text(
                                  "الاسم",
                                  style: style,
                                ),
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

  Future<void> printDoc() async {
    final doc = pw.Document();
    final font = await rootBundle.load("assets/NotoNaskhArabic-Regular.ttf");
    final ttf = pw.Font.ttf(font);
    doc.addPage(pw.Page(
        textDirection: pw.TextDirection.rtl,
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context ctx) {
          return pw.Row(
            children: [
              pw.Expanded(
                  flex: 5,
                  child: pw.Stack(
                    children: [
                      pw.SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: pw.Padding(
                          padding: const pw.EdgeInsets.all(16.0),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Container(
                                    padding: const pw.EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 90),
                                    decoration: pw.BoxDecoration(
                                      color: PdfColors.black,
                                      borderRadius:
                                          pw.BorderRadius.circular(15),
                                    ),
                                    child: pw.Text(
                                      'اذن استيلام',
                                      maxLines: 2,
                                      style: pw.TextStyle(
                                          font: ttf,
                                          fontSize:
                                              getProportionateScreenWidth(6),
                                          color: PdfColors.white),
                                    ),
                                  ),
                                  pw.SizedBox(
                                    width: getProportionateScreenWidth(5),
                                  ),
                                ],
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                    top: 32.0, left: 16, right: 16),
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.end,
                                  children: [
                                    pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.end,
                                      children: [
                                        pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.end,
                                          children: [
                                            pw.SizedBox(
                                              width:
                                                  getProportionateScreenWidth(
                                                      15),
                                              height: 40,
                                              child: pw.TextField(name: ''),
                                            ),
                                            pw.Text(
                                              "/",
                                            ),
                                            pw.SizedBox(
                                              width:
                                                  getProportionateScreenWidth(
                                                      15),
                                              height: 40,
                                              child: pw.TextField(name: ''),
                                            ),
                                            pw.Text(
                                              "/",
                                            ),
                                            pw.SizedBox(
                                              width:
                                                  getProportionateScreenWidth(
                                                      15),
                                              height: 40,
                                              child: pw.TextField(name: ''),
                                            ),
                                            pw.Text("الموافق",
                                                style: pw.TextStyle(font: ttf)),
                                            pw.SizedBox(
                                              width:
                                                  getProportionateScreenWidth(
                                                      40),
                                              height: 40,
                                              child: pw.TextField(name: ""),
                                            ),
                                            pw.Text("انه في يوم",
                                                style: pw.TextStyle(font: ttf)),
                                          ],
                                        ),
                                        pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.end,
                                          children: [
                                            pw.SizedBox(
                                              width:
                                                  getProportionateScreenWidth(
                                                      60),
                                              height: 40,
                                              child: pw.TextField(name: ""),
                                            ),
                                            pw.Text("استلمت انا",
                                                style: pw.TextStyle(font: ttf)),
                                          ],
                                        ),
                                        pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.end,
                                          children: [
                                            pw.SizedBox(
                                              width:
                                                  getProportionateScreenWidth(
                                                      60),
                                              height: 40,
                                              child: pw.TextField(name: ''),
                                            ),
                                            pw.Text(" احمل بطاقة رقم قومي",
                                                style: pw.TextStyle(font: ttf)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(
                                height: 20,
                              ),
                              pw.Table(
                                  border: const pw.TableBorder(
                                      top: pw.BorderSide(
                                          color: PdfColors.black, width: 1),
                                      right: pw.BorderSide(
                                          color: PdfColors.black, width: 1),
                                      bottom: pw.BorderSide(
                                          color: PdfColors.black, width: 1),
                                      left: pw.BorderSide(
                                          color: PdfColors.black, width: 1),
                                      horizontalInside: pw.BorderSide(
                                          color: PdfColors.black, width: 1),
                                      verticalInside: pw.BorderSide(
                                          color: PdfColors.black, width: 1)),
                                  children: [
                                    pw.TableRow(
                                        decoration: const pw.BoxDecoration(
                                            color: PdfColors.black),
                                        children: [
                                          pw.Text('   البيان',
                                              style: pw.TextStyle(
                                                  font: ttf,
                                                  color: PdfColors.white)),
                                          pw.Text('   ت',
                                              style: pw.TextStyle(
                                                  font: ttf,
                                                  color: PdfColors.white)),
                                        ]),
                                    pw.TableRow(children: [
                                      pw.Text('',
                                          style: pw.TextStyle(
                                              font: ttf,
                                              color: PdfColors.white)),
                                      pw.Text('1',
                                          style: pw.TextStyle(
                                              font: ttf,
                                              color: PdfColors.white)),
                                    ]),
                                    pw.TableRow(children: [
                                      pw.Text('',
                                          style: pw.TextStyle(
                                              font: ttf,
                                              color: PdfColors.white)),
                                      pw.Text('2',
                                          style: pw.TextStyle(
                                              font: ttf,
                                              color: PdfColors.white)),
                                    ]),
                                    pw.TableRow(children: [
                                      pw.Text('',
                                          style: pw.TextStyle(
                                              font: ttf,
                                              color: PdfColors.white)),
                                      pw.Text('3',
                                          style: pw.TextStyle(
                                              font: ttf,
                                              color: PdfColors.white)),
                                    ]),
                                  ]),
                              pw.SizedBox(
                                height: 20,
                              ),
                              pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    height: 40,
                                    child: pw.TextField(name: ''),
                                  ),
                                  pw.SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 50,
                                  ),
                                ],
                              ),
                              pw.SizedBox(
                                height: 32,
                              ),
                              pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.end,
                                children: [
                                  pw.SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    height: 40,
                                    child: pw.TextField(name: ''),
                                  ),
                                  pw.SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 50,
                                  ),
                                  pw.Text("التوقيع",
                                      style: pw.TextStyle(font: ttf)),
                                  pw.SizedBox(
                                    width: 100,
                                  ),
                                  pw.Text("الاسم",
                                      style: pw.TextStyle(font: ttf)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          );
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }
}
