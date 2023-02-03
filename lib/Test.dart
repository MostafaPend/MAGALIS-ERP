// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erb_system/controller/Orders/orders_controller.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/utils/city.dart';
import 'package:erb_system/utils/search.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../resources/color_manger.dart';

class Talabat extends StatefulWidget {
  @override
  State<Talabat> createState() => _TalabatState();
}

class _TalabatState extends State<Talabat> {
  DateTime now = DateTime.now();
  String? categoryValue;
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();

  // DateTime _dateTime = DateTime.now();
  String? selectTalab;
  String? stateTalab;
  String? shippingMethods;
  String? numLine;
  String? city;
  String? typeCustomer;
  String? governorate;
  String? cityMain;
  String? governorateMain;
  int ordersNumber = 30;
  int optionsNumber = 30;
  String? numLine1;
  int index = 1;
  List<String> ss = [];
  List<String> nn = [];
  String? typeOrder;
  String? order;
  DateTime endDate = DateTime.now();
  DateTime startDate = DateTime.now();
  String? id;

  bool decline = false;
  bool decline1 = false;
  bool visable = false;
  bool isSort = false;

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != endDate) {
      setState(() {
        endDate = pickedDate;
      });
    }
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != startDate) {
      setState(() {
        startDate = pickedDate;
      });
    }
  }

  Future<void> sortList() async {
    result.clear();
    dbDataId.clear();
    dataId.clear();
    optionsNumber = 0;
    await FirebaseFirestore.instance
        .collection("supplychain")
        .orderBy(
      'date'.toString(),
      descending: isSort,
    )
        .get()
        .then((value) => value.docs.forEach((element) {
      setState(() {
        // //apply sort
        result[element.id] = element.data();
        dbDataId.add(element.id);
        dataId.add(element.id);
        optionsNumber = dataId.length;
      });
    }));
  }

  List data = [];

  List data1 = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
    },
  ];

  List<String> columnData1 = [
    "صورةالمنتج",
    "اجماليسعر البيع",
    "سعر البيع",
    "الوحده",
    "الكميةالمطلوبة",
    "اسم المنتج",
  ];

  Map<String, Map<String, dynamic>> result = {};
  List<String> dataId = [];
  List<String> dbDataId = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = DateTime.now();
    startDate = DateTime(now.year, now.month, now.day);
    endDate = startDate.add(const Duration(days: 1));
    FirebaseFirestore.instance
        .collection("supplychain")
        .get()
        .then((value) => value.docs.forEach((element) {
      setState(() {
        result[element.id] = element.data();
        dbDataId.add(element.id);
        dataId.add(element.id);
        optionsNumber = dataId.length;
      });
    }));
  }

  void performSearch(String query) {
    setState(() {
      dataId = search(query, result, Timestamp.fromDate(startDate),
          Timestamp.fromDate(endDate));
    });
  }

  void performFilter(
      {required String city,
        required String orderStatus,
        required String orderOrigin,
        required String orderType,
        required String shipping,
        required String governorate,
        required String clientType}) {
    setState(() {
      print(orderStatus);
      dataId = filter(
          orderOrigin: orderOrigin,
          orderStatus: orderStatus,
          orderType: orderType,
          shipping: shipping,
          city: city,
          governorate: governorate,
          clientType: clientType,
          date: endDate.toString().substring(0, 10),
          result: result);
      optionsNumber = dataId.length;
    });
    optionsNumber = dataId.length;
    print(dataId.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    // var format = DateFormat.yMd('ar');
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var pro = Provider.of<AddOrderController>(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    DefaultContainer(
                      title: 'الطلبات',
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 20.0, left: 6, right: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('ordersources')
                                    .snapshots(),
                                builder:
                                    (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return const SizedBox();
                                  }
                                  var items = snapshot.data!.docs;
                                  ss.clear();
                                  for (int i = 0; i < items.length; i++) {
                                    ss.add(items[i]["source"]);
                                  }
                                  // if (!snapshot.hasData || ss.isEmpty) {
                                  //   return const Center(
                                  //     child: CircularProgressIndicator(
                                  //       color: Colors.red,
                                  //     ),
                                  //   );
                                  // }
                                  return Container(
                                    width:
                                    MediaQuery.of(context).size.width <= 760
                                        ? getProportionateScreenWidth(65)
                                        : getProportionateScreenWidth(43),
                                    height: getProportionateScreenHeight(90),
                                    padding: const EdgeInsets.only(top: 35),
                                    child: dropDown(
                                      ss,
                                      selectTalab: selectTalab,
                                      onchanged: () => (val) {
                                        setState(() {
                                          selectTalab = val;
                                        });
                                      },
                                      label: 'مصدر الطلب',
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
                                    ),
                                  );
                                },
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width <= 760
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "طلب جديد",
                                    "طلب مؤكد",
                                    "تم شحن",
                                    "تم التحصيل",
                                    "تم الاستلام",
                                    "تم الصيانة",
                                    "ملغى",
                                    "رفض الاستلام"
                                  ],
                                  selectTalab: stateTalab,
                                  onchanged: () => (val) {
                                    setState(() {
                                      stateTalab = val;
                                    });
                                  },
                                  label: 'حالة الطلب',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('shippingtypes')
                                    .snapshots(),
                                builder:
                                    (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                                  var items = snapshot.data!.docs;
                                  nn.clear();
                                  for (int i = 0; i < items.length; i++) {
                                    nn.add(items[i]["type"]);
                                  }
                                  if (!snapshot.hasData || nn.isEmpty) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.red,
                                      ),
                                    );
                                  }

                                  return Container(
                                    width: MediaQuery.of(context).size.width <=
                                        1458
                                        ? getProportionateScreenWidth(65)
                                        : getProportionateScreenWidth(43),
                                    height: getProportionateScreenHeight(90),
                                    padding: const EdgeInsets.only(top: 35),
                                    child: dropDown(
                                      nn,
                                      selectTalab: shippingMethods,
                                      onchanged: () => (val) {
                                        setState(() {
                                          shippingMethods = val;
                                        });
                                      },
                                      label: 'طرق الشحن',
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'تاريخ الطلب',
                                style: style,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(50),
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () => _selectEndDate(context),
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.white)),
                                  child: Text(
                                    "${endDate.year.toString()}/${endDate.month.toString().padLeft(2, '0')}/${endDate.day.toString().padLeft(2, '0')}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                        getProportionateScreenWidth(5)),
                                  ),
                                ),
                              ),
                              Text(
                                'تاريخ الحاله',
                                style: style,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(50),
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () => _selectStartDate(context),
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.white)),
                                  child: Text(
                                    "${startDate.year.toString()}/${startDate.month.toString().padLeft(2, '0')}/${startDate.day.toString().padLeft(2, '0')}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                        getProportionateScreenWidth(5)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width <= 880
                                    ? getProportionateScreenWidth(75)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(50),
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3,
                                        color: const Color(0xff82225E)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: DropdownSearch<String>(
                                    clearButtonProps:
                                    const ClearButtonProps(isVisible: true),
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      showSelectedItems: true,
                                      // disabledItemFn: (String s) =>
                                      //     s.startsWith('I'),
                                    ),
                                    items: governorates,
                                    dropdownDecoratorProps:
                                    DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          hintText: "المحافظة",
                                          border: InputBorder.none),
                                    ),
                                    onChanged: (v) {
                                      setState(() {
                                        governorateMain = v!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width <= 880
                                    ? getProportionateScreenWidth(75)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(50),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3,
                                          color: const Color(0xff82225E)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: DropdownSearch<String>(
                                      clearButtonProps: const ClearButtonProps(
                                          isVisible: true),
                                      popupProps: PopupProps.menu(
                                        showSearchBox: true,
                                        showSelectedItems: true,
                                        searchFieldProps: TextFieldProps(
                                            cursorColor: ColorManager.primary),
                                        // disabledItemFn: (String s) =>
                                        //     s.startsWith('I'),
                                      ),
                                      items: governorateCities(
                                          governorateMain ?? '') ??
                                          [],
                                      dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                        InputDecoration(
                                            hintText: "المدينة",
                                            border: InputBorder.none),
                                      ),
                                      onChanged: (v) {
                                        setState(() {
                                          cityMain = v!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width <= 880
                                    ? getProportionateScreenWidth(75)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(50),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3,
                                          color: const Color(0xff82225E)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        icon: const Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: Color(0xff82225E)),
                                        items: [
                                          "100 طلب",
                                          "200 طلب",
                                        ]
                                            .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ))
                                            .toList(),
                                        value: order,
                                        onChanged: (val) {
                                          setState(() {
                                            if (val == "100 طلب") {
                                              ordersNumber = 100;
                                            } else {
                                              ordersNumber = 200;
                                            }
                                            if (ordersNumber > dataId.length) {
                                              optionsNumber = dataId.length;
                                            } else {
                                              optionsNumber = ordersNumber;
                                            }
                                          });
                                        },
                                        hint: const Text(
                                          "عرض",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        dropdownColor: Colors.white,
                                        style: const TextStyle(
                                            color: Color(0xff82225E)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width <= 880
                                    ? getProportionateScreenWidth(75)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(50),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3,
                                        color: const Color(0xff82225E)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: const Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Color(0xff82225E)),
                                      items: [
                                        "الكل",
                                      ]
                                          .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ))
                                          .toList(),
                                      value: governorate,
                                      onChanged: (val) {
                                        setState(() {
                                          governorate = val;
                                        });
                                      },
                                      hint: const Text(
                                        "رقم الهاتف",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      dropdownColor: Colors.white,
                                      style: const TextStyle(
                                          color: Color(0xff82225E)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          decoration: BoxDecoration(
                                            color: Color(0xff82225E),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.search,
                                                color: Colors.white),
                                            onPressed: () {
                                              setState(() {
                                                performFilter(
                                                    clientType: typeCustomer ?? '',
                                                    city: cityMain ?? '',
                                                    orderOrigin: selectTalab ?? '',
                                                    orderStatus: stateTalab ?? '',
                                                    orderType: typeOrder ?? '',
                                                    shipping: shippingMethods ?? '',
                                                    governorate:
                                                    governorateMain ?? '');
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                            decoration: BoxDecoration(
                                              color: Color(0xff82225E),
                                              borderRadius:
                                              BorderRadius.circular(15),
                                            ),
                                            child: IconButton(
                                              icon: Icon(Icons.delete,
                                                  color: Colors.white),
                                              onPressed: () {
                                                setState(() {
                                                  dataId = dbDataId;
                                                  optionsNumber = dataId.length;
                                                });
                                              },
                                            )),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
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
                                    width: getProportionateScreenWidth(40),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller,
                                      perFix: IconButton(
                                        icon: const Icon(Icons.search),
                                        color: Colors.grey[500],
                                        onPressed: () {},
                                      ),
                                      hint: '',
                                      label: '',
                                      onChanged: (v) {
                                        setState(() {
                                          print(order);
                                          if (v.isNotEmpty) {
                                            performSearch(v);
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
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width <= 710
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "طلب جديد",
                                    "طلب استبدال",
                                    "طلب صيانة",
                                    "طلب مرتجع",
                                  ],
                                  selectTalab: typeOrder,
                                  onchanged: () => (val) {
                                    setState(() {
                                      typeOrder = val;
                                    });
                                  },
                                  label: 'نوع الطلب',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width <= 710
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 25),
                                child: dropDown(
                                  const ["افراد", "شركه"],
                                  selectTalab: typeCustomer,
                                  onchanged: () => (val) {
                                    setState(() {
                                      typeCustomer = val;
                                    });
                                  },
                                  label: "نوع العميل",
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width <= 710
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 25),
                                child: dropDown(
                                  const [
                                    "الخط الاول",
                                    "الخط الثاني",
                                    "الخط الثالث",
                                  ],
                                  selectTalab: numLine,
                                  onchanged: () => (val) {
                                    setState(() {
                                      numLine = val;
                                    });
                                  },
                                  label: "رقم الخط",
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        DefaultTable(
                          columnData: dataTable,
                          color: ColorManager.primary,
                          size: MediaQuery.of(context).size.width <= 690
                              ? getProportionateScreenWidth(.1)
                              : getProportionateScreenWidth(2),
                          icon: InkWell(
                            child: Image.asset(
                              ImageAssets.iconDropDown32,
                              width: getProportionateScreenWidth(10),
                              height: getProportionateScreenWidth(6),
                            ),
                            onTap: () async {
                              var myColumn = dataTable.where((element) =>
                              element.toString() == "خط التوزيع");
                              print(myColumn);
                              setState(() {
                                isSort = !isSort;
                                sortList();
                              });
                            },
                          ),
                          rows: dataId
                              .take(ordersNumber)
                              .map((data) => DataRow(cells: [
                            DataCell(PopupMenuButton(
                              iconSize: getProportionateScreenWidth(5),
                              itemBuilder: (context) => [
                                result[data]!['orderstatus'] ==
                                    "طلب جديد"
                                    ? PopupMenuItem(
                                  value: 1,
                                  child:
                                  const Text('تاكيد الطلب'),
                                  onTap: () async {
                                    try {
                                      print("JOKO");
                                      pro.id =
                                      result[data]!["id"];
                                      print("1");
                                      pro.customername = result[
                                      data]!["customername"];
                                      print("2");
                                      pro.address = result[data]![
                                      "address"];
                                      print("3");
                                      pro.notes =
                                      result[data]!["notes"];
                                      print("4");
                                      pro.city =
                                      result[data]!["city"];
                                      print("5");
                                      pro.downpayment = result[
                                      data]!["downpayment"];
                                      print("6");
                                      pro.date = DateFormat(
                                          'yyyy-MM-dd')
                                          .format(((result[data]![
                                      "date"])
                                      as Timestamp)
                                          .toDate())
                                          .toString();
                                      print("7");
                                      pro.government = result[
                                      data]!["government"];
                                      print("8");
                                      pro.netamount = result[
                                      data]!["netamount"];
                                      print("9");
                                      pro.orderstatus = result[
                                      data]!["orderstatus"];
                                      print("10");
                                      pro.ordersource = result[
                                      data]!["ordersource"];
                                      print("11");
                                      pro.totalinvoice = result[
                                      data]![
                                      "totalinvoiceamount"];
                                      print("12");
                                      pro.phoneNumber = result[
                                      data]!["phonenumber"];
                                      print("13");
                                      pro.phoneNumber1 = result[
                                      data]!["phonenumber1"];
                                      print("14");
                                      pro.shippingfees = result[
                                      data]!["shippingfees"];
                                      print("15");
                                      QuerySnapshot qn =
                                      await FirebaseFirestore
                                          .instance
                                          .collection(
                                          "supplychain")
                                          .doc(result[data]![
                                      "id"])
                                          .collection(
                                          "products")
                                          .get();
                                      pro.orders = qn.docs;
                                      QR.to('/ConfirmOrder');
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  },
                                )
                                    : result[data]!['orderstatus'] ==
                                    "طلب مؤكد"
                                    ? PopupMenuItem(
                                  value: 2,
                                  child:
                                  const Text('شحن الطلب'),
                                  onTap: () async {
                                    try {
                                      if (result[data]![
                                      "orderstatus"] ==
                                          "تم شحن" ||
                                          result[data]![
                                          "orderstatus"] ==
                                              "ملغى") {
                                        final snackBar =
                                        SnackBar(
                                          content: Text(
                                              'Order already shipped '),
                                        );

                                        ScaffoldMessenger.of(
                                            context)
                                            .showSnackBar(
                                            snackBar);
                                      } else {
                                        print("JOKO");
                                        pro.id = result[
                                        data]!["id"];
                                        print("1");
                                        pro.customername =
                                        result[data]![
                                        "customername"];
                                        print("2");
                                        pro.address = result[
                                        data]!["address"];
                                        print("3");
                                        pro.notes = result[
                                        data]!["notes"];
                                        print("4");
                                        pro.city = result[
                                        data]!["city"];
                                        print("5");
                                        pro.downpayment =
                                        result[data]![
                                        "downpayment"];
                                        print("6");
                                        pro.date = DateFormat(
                                            'yyyy-MM-dd')
                                            .format(((result[
                                        data]![
                                        "date"])
                                        as Timestamp)
                                            .toDate())
                                            .toString();
                                        print("7");
                                        pro.government =
                                        result[data]![
                                        "government"];
                                        print("8");
                                        pro.netamount =
                                        result[data]![
                                        "netamount"];
                                        print("9");
                                        pro.orderstatus =
                                        result[data]![
                                        "orderstatus"];
                                        print("10");
                                        pro.ordersource =
                                        result[data]![
                                        "ordersource"];
                                        print("11");
                                        pro.totalinvoice =
                                        result[data]![
                                        "totalinvoiceamount"];
                                        print("12");
                                        pro.phoneNumber =
                                        result[data]![
                                        "phonenumber"];
                                        print("13");
                                        pro.phoneNumber1 =
                                        result[data]![
                                        "phonenumber1"];
                                        print("14");
                                        pro.shippingfees =
                                        result[data]![
                                        "shippingfees"];
                                        pro.shippingtyp =
                                        result[data]![
                                        "shippingtype"];
                                        pro.routenumber =
                                        result[data]![
                                        "routenumber"];
                                        pro.courriers =
                                        result[data]![
                                        "courrier"];
                                        print("15");
                                        QuerySnapshot qn =
                                        await FirebaseFirestore
                                            .instance
                                            .collection(
                                            "supplychain")
                                            .doc(result[
                                        data]![
                                        "id"])
                                            .collection(
                                            "products")
                                            .get();
                                        pro.orders = qn.docs;
                                        QR.to('/LoadOrder');
                                      }
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  },
                                )
                                    : result[data]![
                                'orderstatus'] ==
                                    "تم شحن"
                                    ? PopupMenuItem(
                                  value: 3,
                                  child:
                                  Text('تحصيل الطلب'),
                                  onTap: () async {
                                    pro.id = result[
                                    data]!["id"];
                                    print("1");
                                    pro.customername =
                                    result[data]![
                                    "customername"];
                                    print("2");
                                    pro.address = result[
                                    data]!["address"];
                                    print("3");
                                    pro.notes = result[
                                    data]!["notes"];
                                    print("4");
                                    pro.city = result[
                                    data]!["city"];
                                    print("5");
                                    pro.downpayment =
                                    result[data]![
                                    "downpayment"];
                                    print("6");
                                    pro.date = DateFormat(
                                        'yyyy-MM-dd')
                                        .format(((result[
                                    data]![
                                    "date"])
                                    as Timestamp)
                                        .toDate())
                                        .toString();
                                    print("7");
                                    pro.government =
                                    result[data]![
                                    "government"];
                                    print("8");
                                    pro.netamount =
                                    result[data]![
                                    "netamount"];
                                    print("9");
                                    pro.orderstatus =
                                    result[data]![
                                    "orderstatus"];
                                    print("10");
                                    pro.ordersource =
                                    result[data]![
                                    "ordersource"];
                                    print("11");
                                    pro.totalinvoice =
                                    result[data]![
                                    "totalinvoiceamount"];
                                    print("12");
                                    pro.phoneNumber =
                                    result[data]![
                                    "phonenumber"];
                                    print("13");
                                    pro.phoneNumber1 =
                                    result[data]![
                                    "phonenumber1"];
                                    print("14");
                                    pro.shippingfees =
                                    result[data]![
                                    "shippingfees"];
                                    print("16");
                                    pro.shippingtyp =
                                    result[data]![
                                    "shippingtype"];
                                    print("17");
                                    pro.routenumber =
                                    result[data]![
                                    "routenumber"];
                                    print("18");
                                    pro.courriers =
                                    result[data]![
                                    "courrier"];
                                    print(result[data]![
                                    "id"]);
                                    QuerySnapshot qn =
                                    await FirebaseFirestore
                                        .instance
                                        .collection(
                                        "supplychain")
                                        .doc(result[
                                    data]![
                                    "id"])
                                        .collection(
                                        "products")
                                        .get();
                                    pro.orders = qn.docs;
                                    QR.to('/OrderShip');
                                  },
                                )
                                    : PopupMenuItem(
                                  value: 6,
                                  child: Text(
                                      'تفاصيل الطلب'),
                                  onTap: () async {
                                    pro.id = result[
                                    data]!["id"];
                                    print("1");
                                    pro.customername =
                                    result[data]![
                                    "customername"];
                                    print("2");
                                    pro.address = result[
                                    data]!["address"];
                                    print("3");
                                    pro.notes = result[
                                    data]!["notes"];
                                    print("4");
                                    pro.city = result[
                                    data]!["city"];
                                    print("5");
                                    pro.downpayment =
                                    result[data]![
                                    "downpayment"];
                                    print("6");
                                    pro.date = DateFormat(
                                        'yyyy-MM-dd')
                                        .format(((result[
                                    data]![
                                    "date"])
                                    as Timestamp)
                                        .toDate())
                                        .toString();
                                    print("7");
                                    pro.government =
                                    result[data]![
                                    "government"];
                                    print("8");
                                    pro.netamount =
                                    result[data]![
                                    "netamount"];
                                    print("9");
                                    pro.orderstatus =
                                    result[data]![
                                    "orderstatus"];
                                    print("10");
                                    pro.ordersource =
                                    result[data]![
                                    "ordersource"];
                                    print("11");
                                    pro.totalinvoice =
                                    result[data]![
                                    "totalinvoiceamount"];
                                    print("12");
                                    pro.phoneNumber =
                                    result[data]![
                                    "phonenumber"];
                                    print("13");
                                    pro.phoneNumber1 =
                                    result[data]![
                                    "phonenumber1"];
                                    print("14");
                                    pro.shippingfees =
                                    result[data]![
                                    "shippingfees"];
                                    print("16");
                                    pro.shippingtyp =
                                    result[data]![
                                    "shippingtype"];
                                    print("17");
                                    pro.routenumber =
                                    result[data]![
                                    "routenumber"];
                                    print("18");
                                    pro.courriers =
                                    result[data]![
                                    "courrier"];
                                    print("19");
                                    pro.orderstatusdate =
                                        result[data]![
                                        "statusdate"]
                                            .toString();
                                    print("20");
                                    pro.treasury =
                                    result[data]![
                                    "treasury"];
                                    print("21");
                                    QuerySnapshot qn =
                                    await FirebaseFirestore
                                        .instance
                                        .collection(
                                        "supplychain")
                                        .doc(result[
                                    data]![
                                    "id"])
                                        .collection(
                                        "products")
                                        .get();
                                    pro.orders = qn.docs;
                                    QR.to(
                                        '/CollectionOrderDetails');
                                  },
                                ),
                                result[data]!['orderstatus'] ==
                                    "تم التحصيل" ||
                                    result[data]!["orderstatus"] ==
                                        "ملغى"
                                    ? PopupMenuItem(
                                  value: 5,
                                  child: Text(' '),
                                  onTap: () async {},
                                )
                                    : PopupMenuItem(
                                  value: 4,
                                  child:
                                  const Text('الغاء الطلب'),
                                  onTap: () {
                                    if (result[data]![
                                    "orderstatus"] ==
                                        "ملغى") {
                                      final snackBar = SnackBar(
                                        content: Text(
                                            'Order already canceled '),
                                      );

                                      ScaffoldMessenger.of(
                                          context)
                                          .showSnackBar(snackBar);
                                    } else {
                                      setState(() {
                                        id = result[data]!["id"];
                                        decline = !decline;
                                      });
                                    }
                                  },
                                ),
                                result[data]!["orderstatus"] ==
                                    "ملغى" ||
                                    result[data]!["orderstatus"] ==
                                        "تم التحصيل"
                                    ? PopupMenuItem(
                                  value: 5,
                                  child: Text(' '),
                                  onTap: () async {},
                                )
                                    : PopupMenuItem(
                                  value: 5,
                                  child: Text('تعديل الطلب'),
                                  onTap: () async {
                                    pro.id = result[data]!["id"];
                                    print("1");
                                    pro.customername = result[
                                    data]!["customername"];
                                    print("2");
                                    pro.address =
                                    result[data]!["address"];
                                    print("3");
                                    pro.notes =
                                    result[data]!["notes"];
                                    print("4");
                                    pro.city =
                                    result[data]!["city"];
                                    print("5");
                                    pro.downpayment = result[
                                    data]!["downpayment"];
                                    print("6");
                                    pro.date = DateFormat(
                                        'yyyy-MM-dd')
                                        .format(((result[data]![
                                    "date"])
                                    as Timestamp)
                                        .toDate())
                                        .toString();
                                    print("7");
                                    pro.government = result[
                                    data]!["government"];
                                    print("8");
                                    pro.netamount = result[data]![
                                    "netamount"];
                                    print("9");
                                    pro.orderstatus = result[
                                    data]!["orderstatus"]
                                        .toString();
                                    print("10");
                                    pro.ordersource = result[
                                    data]!["ordersource"];
                                    print("11");
                                    pro.totalinvoice =
                                    result[data]![
                                    "totalinvoiceamount"];
                                    print("12");
                                    pro.phoneNumber = result[
                                    data]!["phonenumber"];
                                    print("13");
                                    pro.phoneNumber1 = result[
                                    data]!["phonenumber1"];
                                    print("14");
                                    pro.shippingfees = result[
                                    data]!["shippingfees"];
                                    print("16");
                                    pro.shippingtyp = result[
                                    data]!["shippingtype"];
                                    print("17");
                                    pro.routenumber = result[
                                    data]!["routenumber"];
                                    print("18");
                                    pro.courriers =
                                    result[data]!["courrier"];
                                    QuerySnapshot qn =
                                    await FirebaseFirestore
                                        .instance
                                        .collection(
                                        "supplychain")
                                        .doc(result[data]![
                                    "id"])
                                        .collection(
                                        "products")
                                        .get();
                                    pro.orders = qn.docs;
                                    QR.to('/CollectionOrder');
                                  },
                                ),
                                result[data]!["orderstatus"] ==
                                    "ملغى" ||
                                    result[data]!["orderstatus"] ==
                                        "تم التحصيل"
                                    ? PopupMenuItem(
                                  value: 5,
                                  child: Text(' '),
                                  onTap: () async {},
                                )
                                    : PopupMenuItem(
                                  value: 7,
                                  child: Text('تاجيل الطلب'),
                                  onTap: () {
                                    setState(() {
                                      id = result[data]!["id"];
                                      decline1 = !decline1;
                                    });
                                  },
                                ),
                                result[data]!["orderstatus"] ==
                                    "ملغى" ||
                                    result[data]!["orderstatus"] ==
                                        "تم التحصيل"
                                    ? PopupMenuItem(
                                  value: 5,
                                  child: Text(' '),
                                  onTap: () async {},
                                )
                                    : PopupMenuItem(
                                  value: 7,
                                  child: Text('رفض استلام'),
                                  onTap: () {
                                    setState(() {
                                      decline1 = !decline1;
                                    });
                                  },
                                ),
                                PopupMenuItem(
                                  value: 6,
                                  child: Text('تفاصيل الطلب'),
                                  onTap: () async {
                                    pro.id = result[data]!["id"];
                                    print("1");
                                    pro.customername =
                                    result[data]!["customername"];
                                    print("2");
                                    pro.address =
                                    result[data]!["address"];
                                    print("3");
                                    pro.notes = result[data]!["notes"];
                                    print("4");
                                    pro.city = result[data]!["city"];
                                    print("5");
                                    pro.downpayment =
                                    result[data]!["downpayment"];
                                    print("6");
                                    pro.date = DateFormat('yyyy-MM-dd')
                                        .format(((result[data]!["date"])
                                    as Timestamp)
                                        .toDate())
                                        .toString();
                                    print("7");
                                    pro.government =
                                    result[data]!["government"];
                                    print("8");
                                    pro.netamount =
                                    result[data]!["netamount"];
                                    print("9");
                                    pro.orderstatus =
                                    result[data]!["orderstatus"];
                                    print("10");
                                    pro.ordersource =
                                    result[data]!["ordersource"];
                                    print("11");
                                    pro.totalinvoice = result[data]![
                                    "totalinvoiceamount"];
                                    print("12");
                                    pro.phoneNumber =
                                    result[data]!["phonenumber"];
                                    print("13");
                                    pro.phoneNumber1 =
                                    result[data]!["phonenumber1"];
                                    print("14");
                                    pro.shippingfees =
                                    result[data]!["shippingfees"];
                                    print("16");
                                    pro.shippingtyp =
                                    result[data]!["shippingtype"];
                                    print("17");
                                    pro.routenumber =
                                    result[data]!["routenumber"];
                                    print("18");
                                    pro.courriers =
                                    result[data]!["courrier"];
                                    print("19");
                                    pro.orderstatusdate =
                                        result[data]!["statusdate"]
                                            .toString();
                                    print("20");
                                    pro.treasury =
                                    result[data]!["treasury"];
                                    print("21");
                                    QuerySnapshot qn =
                                    await FirebaseFirestore.instance
                                        .collection("supplychain")
                                        .doc(result[data]!["id"])
                                        .collection("products")
                                        .get();
                                    pro.orders = qn.docs;
                                    QR.to('/CollectionOrderDetails');
                                  },
                                )
                              ],
                            )),
                            DataCell(Text(
                              result[data]!['shippingtype'],
                              style: TextStyle(
                                  fontSize:
                                  getProportionateScreenWidth(3)),
                            )),
                            DataCell(Text(
                              result[data]!['postpone'].toString(),
                              style: style,
                            )),
                            DataCell(Text(
                              result[data]!['routenumber'].toString(),
                              style: style,
                            )),
                            DataCell(Text(
                              result[data]!['courrier'],
                              style: style,
                            )),
                            DataCell(Text(
                              result[data]!['downpayment'].toString(),
                              style: style,
                            )),
                            DataCell(Text(
                              result[data]!['totalinvoiceamount']
                                  .toString(),
                              style: style,
                            )),
                            DataCell(Text(
                              result[data]!['phonenumber'],
                              style: style,
                            )),
                            DataCell(Text(
                              result[data]!['customername'],
                              style: style,
                            )),
                            DataCell(Text(
                              result[data]!['city'],
                              style: style,
                            )),
                            DataCell(Text(
                              result[data]!['government'],
                              style: style,
                            )),
                            DataCell(
                              Container(
                                  color: result[data]!['orderstatus'] ==
                                      "طلب جديد"
                                      ? Color(0xff82225E)
                                      : result[data]!['orderstatus'] ==
                                      "تم التحصيل"
                                      ? Colors.grey
                                      : result[data]!['orderstatus'] ==
                                      "ملغى" ||
                                      result[data]![
                                      'orderstatus'] ==
                                          "رفض آستلام"
                                      ? Colors.red
                                      : result[data]![
                                  'orderstatus'] ==
                                      "تم شحن"
                                      ? Color(0xffB8E1CD)
                                      : Colors.yellow,
                                  child: Text(
                                    result[data]!['orderstatus'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                        getProportionateScreenWidth(
                                            5)),
                                  )),
                            ),
                            DataCell(
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      result[data]!['ordertype'],
                                      style: style,
                                    ),
                                    Icon(
                                      Icons.notifications,
                                      color: const Color(0xff82225E),
                                      size: getProportionateScreenWidth(
                                          4),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataCell(Text(
                              DateFormat('yyyy-MM-dd')
                                  .format(((result[data]!['date'])
                              as Timestamp)
                                  .toDate())
                                  .toString()
                                  .substring(5, 10),
                              style: style,
                            )),
                            DataCell(
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    result[data]!["id"].toString(),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Image.asset(
                                          ImageAssets.iconDropDown29,
                                          width: 20,
                                          height: 20,
                                        ),
                                        onTap: () {},
                                      ),
                                      Image.asset(
                                        ImageAssets.iconDropDown28,
                                        width: 20,
                                        height: 30,
                                      ),
                                      InkWell(
                                        child: Image.asset(
                                          ImageAssets.iconDropDown27,
                                          width: 20,
                                          height: 30,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            visable = !visable;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]))
                              .toList(),
                        ),
                        visable
                            ? Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: Stack(children: [
                            Positioned(
                              right: width / 6,
                              child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 50,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          visable = false;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.clear,
                                        size: 100,
                                        color: Colors.white,
                                      ))),
                            ),
                            Center(
                              child: Container(
                                  width: 700,
                                  height: 600,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff82225E),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(400.0),
                                        topRight: Radius.circular(400.0),
                                        bottomLeft:
                                        Radius.circular(400.0),
                                        bottomRight:
                                        Radius.circular(400.0),
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 128.0),
                              child: Center(
                                child: Container(
                                  width: 600,
                                  height: 450,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(300.0),
                                        topRight: Radius.circular(300.0),
                                        bottomLeft:
                                        Radius.circular(350.0),
                                        bottomRight:
                                        Radius.circular(350.0),
                                      )),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width:
                                            getProportionateScreenWidth(
                                                30),
                                            child: DefaultInputForm(
                                              hint: '',
                                              label: '',
                                              onTab: () {},
                                              validate: () {},
                                              onSave: () {},
                                              passFun: () {},
                                              obscureText: false,
                                              controller: controller1,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            'رقم الطلب',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      DefaultTable(
                                        columnData: columnData1,
                                        size: getProportionateScreenWidth(
                                            5),
                                        color: ColorManager.primary,
                                        rows: data1
                                            .map(
                                                (data) => DataRow(cells: [
                                              DataCell(Text(
                                                data['6'],
                                                style: style,
                                              )),
                                              DataCell(Text(
                                                data['5'],
                                                style: style,
                                              )),
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
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 200.0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              ImageAssets.iconDropDown29,
                                              width: 100,
                                              height: 100,
                                            ),
                                            Image.asset(
                                              ImageAssets.iconDropDown28,
                                              width: 100,
                                              height: 100,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        )
                            : Container(),
                        decline
                            ? Container(
                          width: getProportionateScreenWidth(70),
                          height: getProportionateScreenHeight(193),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: ColorManager.primary, width: 2),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.more_horiz),
                                  Text(
                                    'يرجي توضيح سبب الالغاء',
                                    style: style,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          decline = false;
                                        });
                                      },
                                      child: const Icon(Icons.close))
                                ],
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 2,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                              )
                            ],
                          ),
                        )
                            : Container(),
                        decline1
                            ? Container(
                          width: getProportionateScreenWidth(75),
                          height: getProportionateScreenHeight(193),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(15),
                            border:
                            Border.all(color: Colors.black, width: 2),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.more_horiz),
                                  Text(
                                    'يرجي توضيح سبب رفض الاستلام',
                                    style: style,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          decline1 = false;
                                        });
                                      },
                                      child: const Icon(Icons.close))
                                ],
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 2,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                              )
                            ],
                          ),
                        )
                            : Container(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                                color: ordersNumber < dataId.length
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
                                    if (ordersNumber < dataId.length) {
                                      ordersNumber = ordersNumber + 10;
                                    }
                                  });
                                },
                              )),
                        ),
                        ordersNumber > 30
                            ? Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 40),
                              decoration: BoxDecoration(
                                color: ordersNumber < dataId.length
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
            ),
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
                  child: Image.asset(ImageAssets.iconDropDown2)),
            ),
          ),
        ],
      ),
    );
  }
}
