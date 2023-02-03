import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/controller/store_controller/add_store_controller.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/store/fiber_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class StoreDetails extends StatefulWidget {
  StoreDetails({Key? key, this.title}) : super(key: key);
  String? title = '';

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  var storeName;

  int ordersNumber = 50;

  TextEditingController controller1 = TextEditingController();

  List<String> columnData = [
    "التكلفة االاجمالية",
    "تكلفة الوحدة",
    "الكمية",
    "وحدة القياس",
    "اسم الصنف",
  ];

  List<String> dataTable = [
    '٧٢٠٠',
    'االاجمالي',
  ];

  List<String> dbDataId = [];
  List<String> dataId = [];
  Map<String, Map<String, dynamic>> result = {};
  double total = 0;

  void performSearch(String query) {
    setState(() {
      dataId = searchByWord(query, result);
      //print(dataId);
      total = dataId.fold(
          0,
              (previousValue, element) =>
          previousValue +
              int.parse(
                  result[element]?['amount'] * result[element]?['amount']));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('warehouses')
        .doc(widget.title)
        .collection('Materials')
        .get()
        .then((value) => value.docs.forEach((element) {
      setState(() {
        result[element.id] = element.data();
        dbDataId.add(element.id);
        dataId.add(element.id);
        total = total +
            (element.data()['quantity'] * element.data()['price']);
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    var pro = Provider.of<AddStoreController>(context);
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      DefaultContainer(title: 'تفاصيل  ${widget.title}'),
                      const SizedBox(
                        height: 50,
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
                              onChanged: (v) {
                                setState(() {
                                  if (v.isNotEmpty) {
                                    performSearch(v.toCapitalized());
                                    ordersNumber = dataId.length;
                                  } else {
                                    dataId = dbDataId;
                                  }
                                });
                              },
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: MediaQuery.of(context).size.width <= 500
                                ? const EdgeInsets.only(top: 30)
                                : const EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(
                                  dataId.take(ordersNumber).length,
                                      (index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        // margin:EdgeInsets.only(bottom: 3.5) ,

                                        child: DefaultBotton(
                                          top: MediaQuery.of(context)
                                              .size
                                              .width <=
                                              500
                                              ? getProportionateScreenWidth(8)
                                              : getProportionateScreenWidth(3),
                                          right: getProportionateScreenWidth(3),
                                          title: 'تفاصيل',
                                          color: ColorManager.white,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        FiperDetails(
                                                          storeName:
                                                          widget.title!,
                                                          pName: pro
                                                              .rowMaterial[
                                                          index]['name'],
                                                        )));
                                          },
                                        ),
                                      ),
                                      Container(
                                        height: 5,
                                        width: 5,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(3),
                          ),
                          Column(
                            children: [
                              DefaultTable(
                                  columnData: columnData,
                                  size: getProportionateScreenWidth(15),
                                  color: ColorManager.second,
                                  rows: [
                                    ...dataId.take(ordersNumber).map((data) {
                                      storeName = result[data]!["name"];
                                      return DataRow(cells: [
                                        DataCell(Text(
                                          (result[data]!['quantity'] *
                                              result[data]!["price"])
                                              .toString(),
                                        )),
                                        DataCell(Text(
                                          result[data]!['price'].toString(),
                                        )),
                                        DataCell(Text(
                                          result[data]!['quantity'].toString(),
                                        )),
                                        DataCell(Text(
                                          result[data]!['measurement'],
                                        )),
                                        DataCell(Text(
                                          result[data]!['name'],
                                        )),
                                      ]);
                                    }).toList(),
                                    DataRow(
                                        color: MaterialStateProperty.all(
                                            ColorManager.primary),
                                        cells: [
                                          DataCell(Text(
                                            total.toString(),
                                            style: TextStyle(
                                                color: ColorManager.white,
                                                fontSize:
                                                getProportionateScreenWidth(5),
                                                fontWeight: FontWeight.w800),
                                          )),
                                          DataCell(Text(
                                            '',
                                            style: style,
                                          )),
                                          DataCell(Text(
                                            '',
                                            style: style,
                                          )),
                                          DataCell(Text(
                                            '',
                                            style: style,
                                          )),
                                          DataCell(
                                              Container(
                                                color: ColorManager.primary,
                                                child: Text(
                                                  'الاجمالي',
                                                  style: TextStyle(
                                                      color: ColorManager.white,
                                                      fontSize:
                                                      getProportionateScreenWidth(
                                                          5),
                                                      fontWeight: FontWeight.w800),
                                                ),
                                              ),
                                              placeholder: true),
                                        ])
                                  ]),

                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 40),
                                decoration: BoxDecoration(
                                  color: ordersNumber < pro.rowMaterial.length
                                      ? Color(0xff82225E)
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextButton(
                                  child: Text(
                                    'المزيد',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (ordersNumber < pro.rowMaterial.length) {
                                        ordersNumber = ordersNumber + 10;
                                      }
                                    });
                                  },
                                )),
                          ),
                          ordersNumber > 50
                              ? Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 40),
                                decoration: BoxDecoration(
                                  color: ordersNumber < pro.rowMaterial.length
                                      ? Color(0xff82225E)
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextButton(
                                  child: Text(
                                    'اقل',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      ordersNumber = ordersNumber - 10;
                                    });
                                  },
                                )),
                          )
                              : SizedBox(),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: InkWell(
                            onTap: () {
                              QR.navigator.popUntilOrPush('/home');
                            },
                            child: Image.asset(ImageAssets.iconDropDown2)),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: InkWell(
                            onTap: () {
                              QR.navigator.popUntilOrPush('/home');
                            },
                            child: Image.asset(ImageAssets.iconDropDown52)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}