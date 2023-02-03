import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:universal_html/html.dart' as html;
import 'package:erb_system/utils/pop_up.dart' as popUp;
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

class Production extends StatefulWidget {
  const Production({Key? key}) : super(key: key);

  @override
  State<Production> createState() => _ProductionState();
}

class _ProductionState extends State<Production> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController popUpController = TextEditingController();

  List data = [
    {
      "1": "كيلو",
    },
    {
      "1": "كيلو",
    },
  ];

  List<String> columnData = [
    "اسم الوحده",
  ];
  List<String> dbDataId = [];
  List<String> dataId = [];
  List<String> dataIdUnPaginated = [];
  Map<String, Map<String, dynamic>> result = {};
  double total = 0;

  void performSearch(String query) {
    setState(() {
      dataId = searchByWord(query, result);
      // print(dataId);
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('procutionlines')
        .get()
        .then((value) => value.docs.forEach((element) {
      setState(() {
        result[element.id] = element.data();

        dbDataId.add(element.id);
        dataId.add(element.id);
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                                DefaultContainer(title: 'فروع الانتاج'),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 71),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: List.generate(
                                            dataId.length,
                                                (index) => Column(
                                              children: [
                                                SizedBox(
                                                    width: 200,
                                                    child: dropDown(
                                                      const [
                                                        'تعديل',
                                                        'حذف',
                                                      ],
                                                      selectTalab:
                                                      index == selectedIndex
                                                          ? chose1
                                                          : chose2,
                                                      onchanged: () => (val) {
                                                        setState(() {
                                                          selectedIndex = index;
                                                          chose1 = val;
                                                        });
                                                      },
                                                      label: 'خيارات',
                                                      foColor: Colors.white,
                                                      bgColor: ColorManager.primary,
                                                      dpColor: ColorManager.primary,
                                                    )),
                                                const SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        DefaultTable(
                                          columnData: columnData,
                                          color: Colors.grey.shade800,
                                          rows: dataId
                                              .map((data) => DataRow(cells: [
                                            DataCell(
                                                Text(result[data]?['name'])),
                                          ]))
                                              .toList(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            popUp.showPopUp(
                                                context,
                                                'title',
                                                'اضف الفرع',
                                                    () async{


                                                  await FirebaseFirestore.instance
                                                      .collection('procutionlines')
                                                      .add({
                                                    'name': popUp.text,

                                                  });
                                                  html.window.location.reload();
                                                },
                                                'اضافة',
                                                popUpController);
                                          },
                                          child: Container(
                                            width: getProportionateScreenWidth(42),
                                            decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(25)),
                                                border: Border.all(
                                                    color: ColorManager.primary)),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  color: ColorManager.primary,
                                                ),
                                                Text(
                                                  'اضافه فرع ',
                                                  style: TextStyle(
                                                    fontSize:
                                                    getProportionateScreenWidth(5),
                                                    fontWeight: FontWeight.w500,
                                                    // color: ColorManager.primary
                                                  ),
                                                )
                                              ],
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
            )));
  }
}