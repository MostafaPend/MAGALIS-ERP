import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

class FollowUsersDetails extends StatefulWidget {
  const FollowUsersDetails({Key? key}) : super(key: key);

  @override
  State<FollowUsersDetails> createState() => _FollowUsersDetailsState();
}

class _FollowUsersDetailsState extends State<FollowUsersDetails> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  List userAction = [];
  DateTime orderDate = DateTime.now();
  TextEditingController controller1 = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: orderDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate) {
      setState(() {
        orderDate = pickedDate;
        print(orderDate);
      });
    }
  }

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "022",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "022",
    },
  ];

  List<String> columnData = [
    "التوقيت",
    "الحركه",
    "التاريخ",
    "المستخدم",
  ];

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
                          DefaultContainer(title: 'تتبع المستخدمين'),
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
                                      onChanged: (value) {
                                        // setState(() {
                                        //   controller1.text = value;
                                        // });
                                      },
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
                                      onPressed: () {
                                        _selectDate(context);
                                      },
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
                            height: 10,
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("actions")
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const LinearProgressIndicator();
                                } else {
                                  userAction.clear();
                                  for (var document in snapshot.data!.docs) {
                                    DateTime x = DateTime.parse(
                                        document['date'].toString());
                                    var date = "${x.year}-${x.month}-${x.day}";
                                    var toDate =
                                        "${orderDate.year}-${orderDate.month}-${orderDate.day}";
                                    if (date == toDate) {
                                      userAction.add(document.data());
                                      print(userAction);
                                    } else {}
                                  }
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DefaultTable(
                                          columnData: columnData,
                                          size: getProportionateScreenWidth(40),
                                          color: ColorManager.second,
                                          rows: [
                                            ...userAction
                                                .map((data) => DataRow(cells: [
                                                      DataCell(Center(
                                                        child: Text(
                                                          data[
                                                              'actionreference'],
                                                          style: style,
                                                        ),
                                                      )),
                                                      DataCell(Center(
                                                        child: Text(
                                                          data['actiontype'],
                                                          style: style,
                                                        ),
                                                      )),
                                                      DataCell(Center(
                                                        child: Text(
                                                          data['date'],
                                                          style: style,
                                                        ),
                                                      )),
                                                      DataCell(Center(
                                                        child: Text(
                                                          data['actiontaker'],
                                                          style: style,
                                                        ),
                                                      )),
                                                    ]))
                                                .toList(),
                                          ]),
                                    ],
                                  );
                                }
                              }),
                          const SizedBox(
                            height: 50,
                          ),
                          Botton(
                            bgColor: Colors.black,
                            color: Colors.white,
                            title: 'المزيد',
                            onTap: () {},
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
