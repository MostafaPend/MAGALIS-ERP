import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';


class IndustrySpecialAddition extends StatefulWidget {
  const IndustrySpecialAddition({Key? key}) : super(key: key);

  @override
  State<IndustrySpecialAddition> createState() =>
      _IndustrySpecialAdditionState();
}

class _IndustrySpecialAdditionState extends State<IndustrySpecialAddition> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;

  DateTime orderDate = DateTime.now();


  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",

    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
    },
  ];

  List<String> columnData = [
    "الوحده",
    "التكلفه",
    "اسم الاضافه",
  ];

  List<String> dbDataId = [];
  List<String> dataId = [];
  List<String> dataIdUnPaginated = [];
  Map<String, Map<String, dynamic>> result = {};
  double total = 0;

  void performSearch(String query) {
    setState(() {
      dataId = searchByWord(query, result);
      print(dataId);

    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('ordersources')
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
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    return SafeArea(
        child: Scaffold(
          body:
          Row(
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
                              DefaultContainer(title: 'الاضافات الخاصه للتصنيع'),
                              const SizedBox(
                                height: 50,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: List.generate(
                                          data.length,
                                              (index) => Column(
                                            children: [
                                              SizedBox(
                                                  width: getProportionateScreenWidth(45),
                                                  child: dropDown(
                                                    const [
                                                      'تعديل ',
                                                      'حذف ',
                                                    ],
                                                    selectTalab: index == selectedIndex
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
                                        size: getProportionateScreenWidth(80),
                                        color: ColorManager.second,
                                        rows: dataId
                                            .map((data) => DataRow(cells: [

                                          DataCell(Text(
                                            result[data]![
                                            'measurement'],
                                            style: style,
                                          )),
                                          DataCell(Text(
                                            result[data]![
                                            'measurement'],
                                            style: style,
                                          )),
                                          DataCell(Text(
                                            result[data]![
                                            'measurement'],
                                            style: style,
                                          )),
                                        ]))
                                            .toList(),
                                      ),
                                      SizedBox(height: 10,),
                                      InkWell(
                                        onTap: (){},
                                        child: Container(
                                          width:getProportionateScreenWidth(42),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(25)),
                                              border: Border.all(color: ColorManager.primary)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: ColorManager.primary,
                                              ),

                                              Text(
                                                'اضافه',
                                                style: TextStyle(
                                                    fontSize: getProportionateScreenWidth(5),
                                                    fontWeight: FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),                 DefaultAppBar()
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