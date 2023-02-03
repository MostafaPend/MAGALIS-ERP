import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../resources/assets_manager.dart';

class HomeTap extends StatefulWidget {
  HomeTap({Key? key}) : super(key: key);

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  String? chose1;
  String? chose2;
  int? selectedIndex;
  List purchaseData = [];
  List ids = [];
  List<String> title = [
    'المشتريات',
    'المصروفات',
    'الطلبات',
    'حساب المندوبين \nوشركات الشحن',
    'تقرير المخزون',
    'الاشعارات',
  ];

  List<String> image = [
    ImageAssets.iconDropDown7,
    ImageAssets.iconDropDown17,
    ImageAssets.iconDropDown16,
    ImageAssets.iconDropDown6,
    ImageAssets.iconDropDown3,
    ImageAssets.iconDropDown52,
  ];

  List data = [
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": false
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": true
    },
    {
      "first_name": "Suprem",
      "last_name": "Nandal",
      "email": "suprem.nandal@gmail.com",
      "phone": "+911234567890",
      "Quantity": "١٠",
      "cost": "2000 جنيه",
      "verified": false
    },
  ];

  List<String> columnData = [
    "تاريخ الاستيلام",
    "وحده القياس",
    "الكميه",
    "الصنف",
  ];

  List<String> columnData1 = [
    "المبالغ المستحقه",
    "عدد الطلبات",
    "الفئه",
    "اسم الشركة او المندوب",
  ];
  List<String> columnData2 = [
    "التاريخ",
    "وحده القياس",
    "الحد الادني",
    "الكميه المتاحه",
    "النوع",
    "الصنف",
  ];
  List<String> navPage = [
    "/purchases",
    "/expenses",
    "/Talabat",
    "/Talabat",
    "/Talabat",
    "/Talabat",
  ];
  String wareHouse = "";
  List material = [];
  List customer = [];
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("warehouses").get().then((value) {
      value.docs.forEach((element) {
        setState(() {
          wareHouse = "";
          if (element.id == 'مخزن مواد خام') {
            wareHouse = element.id;
          }
          print(wareHouse);
          // wareHouse.forEach((element) {
          //   print(element);
          // });
          // print(wareHouse);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            DefaultContainer(
              title: "الصفحه الرئيسيه",
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 660,
              height: 400,
              child: GridView.count(
                childAspectRatio: 1.3,
                crossAxisCount: 3,
                crossAxisSpacing: 50,
                mainAxisSpacing: 50,
                padding: const EdgeInsets.all(10.0),
                children: List.generate(
                    title.length,
                        (index) => InkWell(
                      onTap: () {
                        QR.to(navPage[index]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.circular(15)),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                title[index],
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context)
                                        .size
                                        .width <=
                                        500
                                        ? getProportionateScreenWidth(8)
                                        : getProportionateScreenWidth(5),
                                    color: Colors.white),
                              ),
                              Image.asset(image[index],
                                  width:
                                  MediaQuery.of(context).size.width <=
                                      600
                                      ? getProportionateScreenWidth(40)
                                      : getProportionateScreenWidth(80),
                                  height: MediaQuery.of(context)
                                      .size
                                      .width <=
                                      600
                                      ? getProportionateScreenHeight(40)
                                      : getProportionateScreenHeight(80))
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ),
            DefaultContainer(title: ' استلام الخامات'),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 71),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        data.length,
                            (index) => Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                              MediaQuery.of(context).size.width <= 776
                                  ? const EdgeInsets.only(
                                  top: 10, bottom: 15)
                                  : const EdgeInsets.only(top: 5),
                              child: DefaultBotton(
                                top:
                                MediaQuery.of(context).size.width <= 500
                                    ? getProportionateScreenWidth(8)
                                    : getProportionateScreenWidth(3),
                                right: getProportionateScreenWidth(3),
                                title: 'تفاصيل',
                                color: ColorManager.white,
                                onTap: () {},
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("addpurchasing")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox();
                      } else {
                        for (var document in snapshot.data!.docs) {
                          // purchaseData.clear();
                          if (document['postatus'] == "تم الاستلام") {
                            var x = FirebaseFirestore.instance
                                .collection("addpurchasing")
                                .doc(document.id)
                                .collection('rawmaterials')
                                .get()
                                .then((value) {
                              for (var element1 in value.docs) {
                                setState(() {
                                  if (purchaseData.length > 10) {
                                    return;
                                  }
                                  purchaseData.add(element1.data());
                                });
                                break;
                              }
                            });
                          }
                        }
                        return DefaultTable(
                            columnData: columnData,
                            size: getProportionateScreenWidth(3),
                            color: ColorManager.second,
                            rows: [
                              ...purchaseData
                                  .map((data) => DataRow(cells: [
                                DataCell(Center(
                                  child: Text(
                                    data['price'],
                                    style: style,
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    data['unit'],
                                    style: style,
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    data['requirequantity'],
                                    style: style,
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    data['name'],
                                    style: style,
                                  ),
                                )),
                              ]))
                                  .toList(),
                            ]);
                      }
                    }),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Botton(
              color: ColorManager.white,
              title: 'المزيد',
              onTap: () {},
              bgColor: ColorManager.primary,
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultContainer(title: "تنبيهات الحد الادني للمخزون"),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 71),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        data.length,
                            (index) => Column(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width <=
                                    1207
                                    ? getProportionateScreenWidth(70)
                                    : getProportionateScreenWidth(50),
                                child: dropDown(
                                  const [
                                    'تاكيد امر الشراء',
                                    'ارسال اشعار عند الاستلام'
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
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Materials")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox();
                      } else {
                        for (var element in snapshot.data!.docs) {
                          if (element['type'] == 'مخزن مواد خام') {
                            var x = FirebaseFirestore.instance
                                .collection("warehouses")
                                .doc('مخزن مواد خام')
                                .collection('Materials')
                                .doc(element.id)
                                .snapshots();
                            x.forEach((element1) {
                              if (element1['quantity'] <=
                                  element['minimumquantity']) {
                                if (material.length >= 2) {
                                  return;
                                }
                                // material.remove(element.data());
                                material.add(element.data());
                              }
                            });
                          }
                        }
                        return DefaultTable(
                            columnData: columnData2,
                            size: getProportionateScreenWidth(3),
                            color: ColorManager.second,
                            rows: [
                              ...material
                                  .map((data) => DataRow(cells: [
                                DataCell(Text(
                                  data['date'],
                                  style: style,
                                )),
                                DataCell(Text(
                                  data['measurement'],
                                  style: style,
                                )),
                                DataCell(Text(
                                  int.parse(data['minimumquantity']
                                      .toString())
                                      .toString(),
                                  style: style,
                                )),
                                DataCell(Text(
                                  int.parse(data['quantity'].toString())
                                      .toString(),
                                  style: style,
                                )),
                                DataCell(Text(
                                  data['type'],
                                  style: style,
                                )),
                                DataCell(Text(
                                  data['name'],
                                  style: style,
                                )),
                              ]))
                                  .toList(),
                            ]);
                      }
                    }),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Botton(
              color: ColorManager.white,
              title: 'المزيد',
              onTap: () {},
              bgColor: ColorManager.primary,
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultContainer(title: "حساب المندوبين وشركات الشحن"),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 71),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        data.length,
                            (index) => Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: DefaultBotton(
                                top:
                                MediaQuery.of(context).size.width <= 500
                                    ? getProportionateScreenWidth(8)
                                    : getProportionateScreenWidth(3),
                                right: getProportionateScreenWidth(3),
                                title: 'تفاصيل',
                                color: ColorManager.white,
                                onTap: () {},
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("courriers")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox();
                      } else {
                        customer.clear();
                        for (var element in snapshot.data!.docs) {
                          customer.add(element.data());
                        }
                        return DefaultTable(
                            columnData: columnData1,
                            size: getProportionateScreenWidth(10),
                            color: ColorManager.second,
                            rows: [
                              ...customer
                                  .map((data) => DataRow(cells: [
                                DataCell(Text(
                                  int.parse(data['ordertobecollected']
                                      .toString())
                                      .toString(),
                                  style: style,
                                )),
                                DataCell(Text(
                                  int.parse(data['balance'].toString())
                                      .toString(),
                                  style: style,
                                )),
                                DataCell(Text(
                                  data['couriertype'],
                                  style: style,
                                )),
                                DataCell(Text(
                                  data['name'],
                                  style: style,
                                )),
                              ]))
                                  .toList(),
                            ]);
                      }
                    }),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Botton(
              color: ColorManager.white,
              title: 'المزيد',
              onTap: () {},
              bgColor: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}
