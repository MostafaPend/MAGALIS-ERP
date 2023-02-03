import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/merge_table/merge_table.dart';
import 'package:erb_system/merge_table/src/datas/m_row.dart';
import 'package:erb_system/merge_table/src/datas/merge_table_alignment.dart';
import 'package:erb_system/merge_table/src/merge_table.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class StoreTransfer extends StatefulWidget {
  StoreTransfer({Key? key}) : super(key: key);

  @override
  State<StoreTransfer> createState() => _StoreTransferState();
}

class _StoreTransferState extends State<StoreTransfer> {
  String? chose;
  String? chose1;
  String? chose2;
  DateTime orderDate = DateTime.now();
  TextEditingController controller1 = TextEditingController();

  List data = [
    {"1": "فيبر", "2": "٢٠٠", "3": "كيلو", "4": "٣٠", "5": "٦٠٠٠"},
    {"1": "فيبر", "2": "٢٠٠", "3": "كيلو", "4": "٣٠", "5": "٦٠٠٠"},
    {"1": "فيبر", "2": "٢٠٠", "3": "كيلو", "4": "٣٠", "5": "٦٠٠٠"},
    {"1": "فيبر", "2": "٢٠٠", "3": "كيلو", "4": "٣٠", "5": "٦٠٠٠"},
    {"1": "فيبر", "2": "٢٠٠", "3": "كيلو", "4": "٣٠", "5": "٦٠٠٠"},
  ];

  List<String> columnData = [
    '',
    "اجمالي قيمة المخزون",
    "متوسط تكلفة الوحده",
    "وحدة القياس",
    "الكمية",
    "اسم الصنف",
  ];
  List data1 = [
    {"1": "كوفر ستاندرد", "2": "٢٠", "3": "قطعة", "4": "١٥٠", "5": "٣٠٠٠"},
    {"1": "كوفر ستاندرد", "2": "٢٠", "3": "قطعة", "4": "١٥٠", "5": "٣٠٠٠"},
    {"1": "كوفر ستاندرد", "2": "٢٠", "3": "قطعة", "4": "١٥٠", "5": "٣٠٠٠"},
    {"1": "كوفر ستاندرد", "2": "٢٠", "3": "قطعة", "4": "١٥٠", "5": "٣٠٠٠"},
    {"1": "كوفر ستاندرد", "2": "٢٠", "3": "قطعة", "4": "١٥٠", "5": "٣٠٠٠"},
  ];

  List<String> columnData1 = [
    '',
    "اجمالي قيمة المخزون",
    "متوسط تكلفة الوحده",
    "وحدة القياس",
    "الكمية",
    "اسم الصنف",
  ];
  List data2 = [
    {"1": " ستاندرد", "2": "٢٠", "3": "قطعة", "4": "٣٠٠", "5": "٩٠٠٠"},
    {"1": " ستاندرد", "2": "٢٠", "3": "قطعة", "4": "٣٠٠", "5": "٩٠٠٠"},
    {"1": " ستاندرد", "2": "٢٠", "3": "قطعة", "4": "٣٠٠", "5": "٩٠٠٠"},
    {"1": " ستاندرد", "2": "٢٠", "3": "قطعة", "4": "٣٠٠", "5": "٩٠٠٠"},
  ];

  List<String> columnData2 = [
    '',
    "اجمالي قيمة المخزون",
    "متوسط تكلفة الوحده",
    "وحدة القياس",
    "الكمية",
    "اسم الصنف",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(6));
    var pro = Provider.of<Controller>(context);
    return Scaffold(
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
                              height: 32,
                            ),
                            Column(
                              children: [
                                Text(
                                  'البحث',
                                  style: style,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(70),
                                  height: 60,
                                  child: DefaultInputForm(
                                    controller: controller1,
                                    perFix: IconButton(
                                      icon: const Icon(Icons.search),
                                      color: Colors.grey[500],
                                      onPressed: () {},
                                    ),
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
                            const SizedBox(
                              height: 32,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(200),
                              child: MergeTable(
                                borderColor: Colors.black,
                                alignment: MergeTableAlignment.center,
                                columns: [
                                  MMergedColumns(
                                    header: "مخزن مواد خام",
                                    columns: columnData,
                                  ),
                                ],
                                rows: data
                                    .map(
                                      (e) => [
                                    MMergedRows([
                                      SizedBox(
                                        width: getProportionateScreenWidth(70),
                                        child: dropDown(
                                          const [
                                            'تفاصيل',
                                            'صرف جزء تالف',
                                            'تعديل الرصيد',
                                          ],
                                          bgColor: ColorManager.primary,
                                          dpColor: ColorManager.primary,
                                          selectTalab: chose,
                                          foColor: Colors.white,
                                          label: 'خيارات',
                                          onchanged: () => (val) {
                                            if (val == 'تفاصيل') {
                                              QR.to('/fiber_details');
                                            } else if (val == 'صرف جزء تالف') {
                                              QR.to('/damage_details_transfer');
                                            } else if (val == 'تعديل الرصيد') {
                                              QR.to('/balance_modification');
                                            }
                                            setState(() {
                                              chose = val;
                                            });
                                          },
                                        ),
                                      ),
                                      Text(
                                        e['5'],
                                        style: style,
                                      ),
                                      Text(
                                        e['4'],
                                        style: style,
                                      ),
                                      Text(
                                        e['3'],
                                        style: style,
                                      ),
                                      Text(
                                        e['2'],
                                        style: style,
                                      ),
                                      Text(
                                        e['1'],
                                        style: style,
                                      ),
                                    ]),
                                  ],
                                )
                                    .toList(),
                                color: ColorManager.second,
                                size: getProportionateScreenWidth(5),
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Botton(
                                    color: Colors.white,
                                    title: 'المزيد',
                                    onTap: () {},
                                    bgColor: ColorManager.primary)
                              ],
                            ),
                            const SizedBox(
                              height: 64,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(260),
                              child: MergeTable(
                                borderColor: Colors.black,
                                alignment: MergeTableAlignment.center,
                                columns: [
                                  MMergedColumns(
                                    header: "مخزن منتجات تحت التشغيل",
                                    columns: columnData1,
                                  ),
                                ],
                                rows: data1
                                    .map(
                                      (e) => [
                                    MMergedRows([
                                      SizedBox(
                                        width: getProportionateScreenWidth(70),
                                        child: dropDown(
                                          const [
                                            'تفاصيل',
                                            'صرف جزء تالف',
                                            'تعديل الرصيد',
                                            'تحويل الي مواد خام',
                                          ],
                                          bgColor: ColorManager.primary,
                                          dpColor: ColorManager.primary,
                                          selectTalab: chose1,
                                          foColor: Colors.white,
                                          label: 'خيارات',
                                          onchanged: () => (val) {
                                            if (val == 'تفاصيل') {
                                              QR.to('/fiber_details');
                                            } else if (val == 'صرف جزء تالف') {
                                              QR.to('/damage_details_transfer');
                                            } else if (val == 'تعديل الرصيد') {
                                              QR.to('/balance_modification');
                                            } else if (val ==
                                                'تحويل الي مواد خام') {
                                              QR.to('/transfer_material');
                                            }
                                            setState(() {
                                              chose1 = val;
                                            });
                                          },
                                        ),
                                      ),
                                      Text(
                                        e['5'],
                                        style: style,
                                      ),
                                      Text(
                                        e['4'],
                                        style: style,
                                      ),
                                      Text(
                                        e['3'],
                                        style: style,
                                      ),
                                      Text(
                                        e['2'],
                                        style: style,
                                      ),
                                      Text(
                                        e['1'],
                                        style: style,
                                      ),
                                    ]),
                                  ],
                                )
                                    .toList(),
                                color: ColorManager.second,
                                size: getProportionateScreenWidth(5),
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Botton(
                                    color: Colors.white,
                                    title: 'المزيد',
                                    onTap: () {},
                                    bgColor: ColorManager.primary)
                              ],
                            ),
                            const SizedBox(
                              height: 64,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(280),
                              child: MergeTable(
                                borderColor: Colors.black,
                                alignment: MergeTableAlignment.center,
                                columns: [
                                  MMergedColumns(
                                    header: "مخزن منتجات تامه ",
                                    columns: columnData2,
                                  ),
                                ],
                                rows: data2
                                    .map(
                                      (e) => [
                                    MMergedRows([
                                      SizedBox(
                                        width: getProportionateScreenWidth(110),
                                        child: dropDown(
                                          const [
                                            'تفاصيل',
                                            'صرف جزء تالف',
                                            'تعديل الرصيد',
                                            'تحويل الي مواد خام',
                                            'تحويل منتج تحت التشغيل',
                                          ],
                                          bgColor: ColorManager.primary,
                                          dpColor: ColorManager.primary,
                                          selectTalab: chose2,
                                          foColor: Colors.white,
                                          label: 'خيارات',
                                          onchanged: () => (val) {
                                            if (val == 'تفاصيل') {
                                              QR.to('/fiber_details');
                                            } else if (val == 'صرف جزء تالف') {
                                              QR.to('/damage_details_transfer');
                                            } else if (val == 'تعديل الرصيد') {
                                              QR.to('/balance_modification');
                                            } else if (val ==
                                                'تحويل الي مواد خام') {
                                              QR.to('/transfer_material');
                                            } else if (val ==
                                                'تحويل الي منتج تحت التشغيل') {
                                              QR.to('/transfir_to_under_work');
                                            }
                                            setState(() {
                                              chose2 = val;
                                            });
                                          },
                                        ),
                                      ),
                                      Text(
                                        e['5'],
                                        style: style,
                                      ),
                                      Text(
                                        e['4'],
                                        style: style,
                                      ),
                                      Text(
                                        e['3'],
                                        style: style,
                                      ),
                                      Text(
                                        e['2'],
                                        style: style,
                                      ),
                                      Text(
                                        e['1'],
                                        style: style,
                                      ),
                                    ]),
                                  ],
                                )
                                    .toList(),
                                color: ColorManager.second,
                                size: getProportionateScreenWidth(5),
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Botton(
                                    color: Colors.white,
                                    title: 'المزيد',
                                    onTap: () {},
                                    bgColor: ColorManager.primary)
                              ],
                            ),
                            const SizedBox(
                              height: 14,
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
        ));
  }
}