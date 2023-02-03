import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erb_system/controller/sestem_admin_controller/system_controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Permission extends StatefulWidget {
  const Permission({Key? key}) : super(key: key);

  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  String? chose;
  String? chose1;
  String? chose2;
  String? userName;
  int? selectedIndex;
  bool expandFirstList = false;
  bool expandSecondList = false;
  bool expandThirdList = false;
  bool expandFourthList = false;
  bool expandFiveList = false;
  bool expandSixList = false;
  bool expandSevenList = false;
  bool expandEightList = false;
  bool expandNineList = false;
  bool expandTenList = false;
  bool expandElevenList = false;

  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();
  List<String> columnData = [
    "قراءة فقط",
    "تعديل ",
    " تعديل بعد الموافقة",
    "اخفاء",
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

  List permissionList = [];
  List permissionNames = [];
  List permissionNameInArabic = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    return SafeArea(
        child: Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc('oGk6wwreiXsuyevtqSxS')
              .collection("responsibilities")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const LinearProgressIndicator();
            } else {
              permissionNames.clear();
              for (var document in snapshot.data!.docs) {
                permissionList.add(document.data());
                permissionNames.add(document.id);
              }
              print(permissionNames);
              return Row(
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
                                DefaultContainer(title: 'الصلاحيات'),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Consumer<AddUserDataController>(
                                      builder: (context, valu, child) {
                                        return FutureBuilder(
                                            future: valu.getUser(),
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
                                                        hintText: "Enter Name",
                                                      ),
                                                    ),
                                                    onChanged: (v) {
                                                      setState(() {
                                                        userName = v;
                                                      });
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return const CircularProgressIndicator();
                                              }
                                            });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
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
                                  height: getProportionateScreenWidth(5),
                                ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceEvenly,
                                //   children: [
                                //     DefaultTable(
                                //       columnData: columnData,
                                //       size: getProportionateScreenWidth(15),
                                //       color: ColorManager.second,
                                //       rows: [
                                //         ...permissionNames
                                //             .map(
                                //               (data) => DataRow(
                                //                 cells: [
                                //                   DataCell(Checkbox(
                                //                     value: permissionList[0]
                                //                         ['read'],
                                //                     onChanged: (bool? value) {
                                //                       setState(() {
                                //                         permissionList[0]
                                //                                 ['read'] =
                                //                             !permissionList[0]
                                //                                 ['read'];
                                //                       });
                                //                     },
                                //                   )),
                                //                   DataCell(Center(
                                //                     child: Checkbox(
                                //                       value: permissionList[0]
                                //                           ['addwarehouse'],
                                //                       onChanged: (bool? value) {
                                //                         setState(() {
                                //                           permissionList[0][
                                //                                   'addwarehouse'] =
                                //                               !permissionList[0]
                                //                                   [
                                //                                   'addwarehouse'];
                                //                         });
                                //                       },
                                //                     ),
                                //                   )),
                                //                   DataCell(Checkbox(
                                //                     value: permissionList[0]
                                //                         ['readAfterApprovel'],
                                //                     onChanged: (bool? value) {
                                //                       setState(() {
                                //                         permissionList[0][
                                //                                 'readAfterApprovel'] =
                                //                             !permissionList[0][
                                //                                 'readAfterApprovel'];
                                //                       });
                                //                     },
                                //                   )),
                                //                   DataCell(
                                //                       Checkbox(
                                //                         value: hide,
                                //                         onChanged:
                                //                             (bool? value) {
                                //                           setState(() {
                                //                             hide = !hide;
                                //                             // permissionList[0]
                                //                             //         ['hide'] =
                                //                             //     !permissionList[
                                //                             //         0]['hide'];
                                //                           });
                                //                         },
                                //                       ), onTap: () {
                                //                     print('ddd');
                                //                   }),
                                //                   DataCell(
                                //                     Center(
                                //                       child: Text(
                                //                         data
                                //                             .toString()
                                //                             .toString(),
                                //                         style: style,
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //             )
                                //             .toList(),
                                //       ],
                                //     ),
                                //   ],
                                // ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Botton(
                                  bgColor: Colors.black,
                                  color: Colors.white,
                                  title: 'المزيد',
                                  onTap: () {},
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 30),
                                  child: ExpansionPanelList(
                                    expansionCallback:
                                        (int index, bool status) {
                                      if (index == 0) {
                                        setState(() {
                                          expandFirstList = !expandFirstList;
                                        });
                                      } else if (index == 1) {
                                        setState(() {
                                          expandSecondList = !expandSecondList;
                                        });
                                      } else if (index == 2) {
                                        setState(() {
                                          expandThirdList = !expandThirdList;
                                        });
                                      } else if (index == 3) {
                                        setState(() {
                                          expandFourthList = !expandFourthList;
                                        });
                                      } else if (index == 4) {
                                        setState(() {
                                          expandFiveList = !expandFiveList;
                                        });
                                      } else if (index == 5) {
                                        setState(() {
                                          expandSixList = !expandSixList;
                                        });
                                      } else if (index == 6) {
                                        setState(() {
                                          expandSevenList = !expandSevenList;
                                        });
                                      } else if (index == 7) {
                                        setState(() {
                                          expandEightList = !expandEightList;
                                        });
                                      } else if (index == 8) {
                                        setState(() {
                                          expandNineList = !expandNineList;
                                        });
                                      } else if (index == 9) {
                                        setState(() {
                                          expandTenList = !expandTenList;
                                        });
                                      } else if (index == 10) {
                                        setState(() {
                                          expandElevenList = !expandElevenList;
                                        });
                                      }
                                    },
                                    children: [
                                      ExpansionPanel(
                                        body: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                value: permissionList[0]
                                                    ['read'],
                                                onChanged: (value) {
                                                  setState(() {
                                                    permissionList[0]['read'] =
                                                        !permissionList[0]
                                                            ['read'];
                                                  });
                                                },
                                                title: Text(columnData[index]),
                                              );
                                            },
                                            itemCount: columnData.length,
                                            shrinkWrap: false,
                                          ),
                                        ),
                                        headerBuilder: (BuildContext context,
                                            bool isExpanded) {
                                          return Center(
                                            child: Text(
                                              permissionNames[0].toString(),
                                              style: myTextStyle(),
                                            ),
                                          );
                                        },
                                        isExpanded: expandFirstList,
                                      ),
                                      ExpansionPanel(
                                        body: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                value: true,
                                                onChanged: (value) {},
                                                title: Text(columnData[index]),
                                              );
                                            },
                                            itemCount: columnData.length,
                                            shrinkWrap: false,
                                          ),
                                        ),
                                        headerBuilder: (BuildContext context,
                                            bool isExpanded) {
                                          return Center(
                                            child: Text(
                                              permissionNames[1].toString(),
                                              style: myTextStyle(),
                                            ),
                                          );
                                        },
                                        isExpanded: expandSecondList,
                                      ),
                                      ExpansionPanel(
                                        body: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                value: true,
                                                onChanged: (value) {},
                                                title: Text(columnData[index]),
                                              );
                                            },
                                            itemCount: columnData.length,
                                            shrinkWrap: false,
                                          ),
                                        ),
                                        headerBuilder: (BuildContext context,
                                            bool isExpanded) {
                                          return Center(
                                            child: Text(
                                              permissionNames[2].toString(),
                                              style: myTextStyle(),
                                            ),
                                          );
                                        },
                                        isExpanded: expandThirdList,
                                      ),
                                      ExpansionPanel(
                                        body: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                value: true,
                                                onChanged: (value) {},
                                                title: Text(columnData[index]),
                                              );
                                            },
                                            itemCount: columnData.length,
                                            shrinkWrap: false,
                                          ),
                                        ),
                                        headerBuilder: (BuildContext context,
                                            bool isExpanded) {
                                          return Center(
                                            child: Text(
                                              permissionNames[3].toString(),
                                              style: myTextStyle(),
                                            ),
                                          );
                                        },
                                        isExpanded: expandFourthList,
                                      ),
                                      ExpansionPanel(
                                        body: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                value: true,
                                                onChanged: (value) {},
                                                title: Text(columnData[index]),
                                              );
                                            },
                                            itemCount: columnData.length,
                                            shrinkWrap: false,
                                          ),
                                        ),
                                        headerBuilder: (BuildContext context,
                                            bool isExpanded) {
                                          return Center(
                                            child: Text(
                                              permissionNames[4].toString(),
                                              style: myTextStyle(),
                                            ),
                                          );
                                        },
                                        isExpanded: expandFiveList,
                                      ),
                                      ExpansionPanel(
                                        body: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                value: true,
                                                onChanged: (value) {},
                                                title: Text(columnData[index]),
                                              );
                                            },
                                            itemCount: columnData.length,
                                            shrinkWrap: false,
                                          ),
                                        ),
                                        headerBuilder: (BuildContext context,
                                            bool isExpanded) {
                                          return Center(
                                            child: Text(
                                              permissionNames[5].toString(),
                                              style: myTextStyle(),
                                            ),
                                          );
                                        },
                                        isExpanded: expandSixList,
                                      ),
                                      ExpansionPanel(
                                        body: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                value: true,
                                                onChanged: (value) {},
                                                title: Text(columnData[index]),
                                              );
                                            },
                                            itemCount: columnData.length,
                                            shrinkWrap: false,
                                          ),
                                        ),
                                        headerBuilder: (BuildContext context,
                                            bool isExpanded) {
                                          return Center(
                                            child: Text(
                                              permissionNames[6].toString(),
                                              style: myTextStyle(),
                                            ),
                                          );
                                        },
                                        isExpanded: expandSevenList,
                                      ),
                                      ExpansionPanel(
                                        body: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                value: true,
                                                onChanged: (value) {},
                                                title: Text(columnData[index]),
                                              );
                                            },
                                            itemCount: columnData.length,
                                            shrinkWrap: false,
                                          ),
                                        ),
                                        headerBuilder: (BuildContext context,
                                            bool isExpanded) {
                                          return Center(
                                            child: Text(
                                              permissionNames[7].toString(),
                                              style: myTextStyle(),
                                            ),
                                          );
                                        },
                                        isExpanded: expandEightList,
                                      ),
                                      ExpansionPanel(
                                        body: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                value: true,
                                                onChanged: (value) {},
                                                title: Text(columnData[index]),
                                              );
                                            },
                                            itemCount: columnData.length,
                                            shrinkWrap: false,
                                          ),
                                        ),
                                        headerBuilder: (BuildContext context,
                                            bool isExpanded) {
                                          return Center(
                                            child: Text(
                                              permissionNames[8].toString(),
                                              style: myTextStyle(),
                                            ),
                                          );
                                        },
                                        isExpanded: expandNineList,
                                      ),
                                      ExpansionPanel(
                                        body: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                value: true,
                                                onChanged: (value) {},
                                                title: Text(columnData[index]),
                                              );
                                            },
                                            itemCount: columnData.length,
                                            shrinkWrap: false,
                                          ),
                                        ),
                                        headerBuilder: (BuildContext context,
                                            bool isExpanded) {
                                          return Center(
                                            child: Text(
                                              permissionNames[9].toString(),
                                              style: myTextStyle(),
                                            ),
                                          );
                                        },
                                        isExpanded: expandTenList,
                                      ),
                                      ExpansionPanel(
                                        body: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CheckboxListTile(
                                                value: true,
                                                onChanged: (value) {},
                                                title: Text(columnData[index]),
                                              );
                                            },
                                            itemCount: columnData.length,
                                            shrinkWrap: false,
                                          ),
                                        ),
                                        headerBuilder: (BuildContext context,
                                            bool isExpanded) {
                                          return Center(
                                            child: Text(
                                              permissionNames[10].toString(),
                                              style: myTextStyle(),
                                            ),
                                          );
                                        },
                                        isExpanded: expandElevenList,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        DefaultAppBar()
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: ColorManager.primary,
                          ),
                          child: DropDownList())),
                ],
              );
            }
          }),
    ));
  }

  myTextStyle() {
    return const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red);
  }
}
