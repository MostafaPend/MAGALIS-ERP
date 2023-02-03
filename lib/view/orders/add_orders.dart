import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erb_system/controller/Orders/orders_controller.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/resources/value_manager.dart';
import 'package:erb_system/utils/city.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../controller/controller.dart';
import '../../size_config.dart';
import '../auth/component/text_fom_feild.dart';
import '../home/components/botton.dart';
import '../home/components/default_table.dart';
import '../home/components/drop_down.dart';

class AddOrder extends StatefulWidget {
  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  DateTime now = DateTime.now();
  String? categoryValue;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();
  TextEditingController controllernote = TextEditingController();
  TextEditingController qunatityControlor = TextEditingController();
  TextEditingController controllerdisc = TextEditingController();
  TextEditingController controllerprice = TextEditingController();
  // DateTime _dateTime = DateTime.now();
  String? selectTalab;
  String? shippingMethods;
  String? payment;
  String? city;
  String? typeCustomer;
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  var totalpriceinvoice = 0;

  String? pname;
  int? pprice;
  String? pmeasure;
  int index = 0;
  String? governorate;
  String? typeOrder;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  DateTime chargeDate = DateTime.now();

  TextEditingController _shopSearch = TextEditingController();
  String search = '';
  int discountPrice = 0;
  int downp = 0;
  List table = [];
  List<String> ss = [];
  List<String> nn = [];

  List<String> columnData = [
    "",
    "الرقم",
    "صورةالمنتج",
    "اجمالي سعر البيع",
    "سعر البيع",
    "الوحده",
    "الكميةالمطلوبة",
    "اسم المنتج",
  ];
  showLoaderDialog(BuildContext c){
    showDialog(
      barrierDismissible: false,
      context:c,
      builder:(c){
        return AlertDialog(
          backgroundColor: Colors.black,
          content: new Row(
            children: [
              Spacer(),
              Spacer(),
              CircularProgressIndicator(color: Colors.red,),
              Spacer(),
              Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." ,style: TextStyle(color: Colors.white),)),
              Spacer(),
              Spacer(),

            ],),
        );
      },
    );
  }

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

  changeIndex(int changeIndex) {
    index = changeIndex + 1;
    print(index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller7.addListener(() {
      setState(() {});
    });
    controllerdisc.addListener(() {
      setState(() {
        discountPrice = int.parse(controllerdisc.text);
      });
    });
    controller5.addListener(() {
      setState(() {
        downp = int.parse(controller5.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    // var format = DateFormat.yMd('ar');
    var pro = Provider.of<AddOrderController>(context);
    var pros = Provider.of<Controller>(context);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          DefaultContainer(
                            title: 'اضافة الطلب',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    StreamBuilder(
                                      stream: FirebaseFirestore.instance.collection('ordersources').snapshots(),
                                      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                                        var items = snapshot.data!.docs;
                                        ss.clear();
                                        for(int i = 0;i<items.length;i++){
                                          ss.add(items[i]["source"]);
                                        }
                                        if(!snapshot.hasData||ss.isEmpty){
                                          return const Center(child: CircularProgressIndicator(color: Colors.red,),);
                                        }


                                        return Container(
                                          width: MediaQuery.of(context).size.width <= 760
                                              ? getProportionateScreenWidth(65)
                                              : getProportionateScreenWidth(43),
                                          height: getProportionateScreenHeight(90),
                                          padding: const EdgeInsets.only(top: 35),
                                          child: dropDown(ss,
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
                                    /*Container(
                                      width:
                                          MediaQuery.of(context).size.width <=
                                                  1461
                                              ? getProportionateScreenWidth(65)
                                              : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(90),
                                      padding: const EdgeInsets.only(top: 35),
                                      child: dropDown(
                                        const [
                                          "طلب جديد",
                                          "طلب مؤكد",
                                          "تم الشحن",
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
                                    ),*/
                                    StreamBuilder(
                                      stream: FirebaseFirestore.instance.collection('shippingtypes').snapshots(),
                                      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                                        var items = snapshot.data!.docs;
                                        nn.clear();
                                        for(int i = 0;i<items.length;i++){
                                          nn.add(items[i]["type"]);
                                        }
                                        if(!snapshot.hasData||nn.isEmpty){
                                          return const Center(child: CircularProgressIndicator(color: Colors.red,),);
                                        }


                                        return Container(
                                          width: MediaQuery.of(context).size.width <= 1458
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
                                        onPressed: () => _selectDate(context),
                                        style: ButtonStyle(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                        child: Text(
                                          "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                              getProportionateScreenWidth(
                                                  5)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width <=
                                          660
                                          ? getProportionateScreenWidth(52)
                                          : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(90),
                                      padding: const EdgeInsets.only(top: 35),
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
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width <=
                                          917
                                          ? getProportionateScreenWidth(75)
                                          : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(50),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3,
                                              color: const Color(0xff82225E)),
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      child: Center(
                                        child:      DropdownSearch<String>(
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
                                              governorate= v;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width <=
                                          917
                                          ? getProportionateScreenWidth(75)
                                          : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(50),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3,
                                              color: const Color(0xff82225E)),
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      child: Center(
                                        child:  DropdownSearch<String>(
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
                                              governorate ?? '') ??
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
                                              city = v;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),

                                  ],
                                ),
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'اسم العميل',
                                          style: style,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width:
                                          getProportionateScreenWidth(40),
                                          height: 60,
                                          child: DefaultInputForm(
                                            controller: controller1,
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
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'رقم الموبيل 1',
                                          style: style,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width:
                                          getProportionateScreenWidth(40),
                                          height: 60,
                                          child: DefaultInputForm(
                                            controller: controller2,
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'رقم الموبيل 2',
                                          style: style,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width:
                                          getProportionateScreenWidth(40),
                                          height: 60,
                                          child: DefaultInputForm(
                                            controller: controller3,
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
                                  ],
                                ),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width <= 720
                                      ? getProportionateScreenWidth(65)
                                      : getProportionateScreenWidth(43),
                                  height: getProportionateScreenHeight(90),
                                  padding: const EdgeInsets.only(top: 35),
                                  child: dropDown(
                                    const [
                                      "جديد",
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
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: getProportionateScreenWidth(70),
                                height: getProportionateScreenHeight(193),
                                decoration: BoxDecoration(
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
                                        const Icon(Icons.more_horiz),
                                        Text(
                                          'ملحوظات',
                                          style: style,
                                        ),
                                        const Icon(Icons.close)
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                      thickness: 2,
                                    ),
                                    TextFormField(
                                      controller: controllernote,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  DefaultTable(
                                    columnData: columnData,
                                    size: getProportionateScreenWidth(5),
                                    color: ColorManager.primary,
                                    rows: table
                                        .map((data) => DataRow(cells: [
                                      DataCell(IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          setState(() {

                                            table.removeWhere((item) =>
                                            item['index'] ==
                                                data['index']);
                                            var x = (data['quantity'] *
                                                data["price"]);
                                            print(totalpriceinvoice-x);
                                            if(data["image"]=="old"){
                                              totalpriceinvoice= totalpriceinvoice+x as int;

                                            }else{
                                              totalpriceinvoice= totalpriceinvoice-x as int;

                                            }
                                          });
                                        },
                                      )),
                                      DataCell(Text(
                                        data['index'].toString(),
                                        style: style,
                                      )),
                                      DataCell(InkWell(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        child: Image.asset(
                                          'assets/images/23.png',
                                          width: 50,
                                          height: 50,
                                        ),
                                      )),
                                      DataCell(Text(
                                        (data['quantity'] *
                                            data["price"])
                                            .toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['price'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['measurement'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['quantity'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['name'].toString().substring(0,5),
                                        style: style,
                                      )),
                                    ]))
                                        .toList(),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'اسم الصنف',
                                            style: getSemiBoldStyle(
                                                color: ColorManager.black),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Consumer<AddOrderController>(
                                            builder: (context, valu, child) {
                                              return FutureBuilder(
                                                  future: valu
                                                      .getMaterialsWarehouse(),
                                                  builder: (context, snapshot) {
                                                    if (snapshot.hasData) {
                                                      List sup =
                                                      snapshot.data as List;

                                                      return SizedBox(
                                                        width:
                                                        getProportionateScreenWidth(
                                                            50),
                                                        height: 60,
                                                        child: DropdownSearch<
                                                            String>(
                                                          clearButtonProps:
                                                          const ClearButtonProps(
                                                              isVisible:
                                                              true),
                                                          popupProps:
                                                          PopupProps.menu(
                                                            showSelectedItems:
                                                            true,
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
                                                              sup[index]
                                                              ['name']),
                                                          dropdownDecoratorProps:
                                                          DropDownDecoratorProps(
                                                            dropdownSearchDecoration:
                                                            InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      AppSize
                                                                          .s15),
                                                                  borderSide: const BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width:
                                                                      1.2)),
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      AppSize
                                                                          .s15),
                                                                  borderSide: const BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width:
                                                                      1.2)),
                                                              focusedBorder:
                                                              OutlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    AppSize.s15),
                                                                borderSide: const BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1.2),
                                                              ),
                                                              hintText:
                                                              "اسم الصنف",
                                                            ),
                                                          ),
                                                          onChanged: (v) async {
                                                            if (v != null)
                                                              await FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                  'Materials')
                                                                  .doc(v)
                                                                  .get()
                                                                  .then(
                                                                      (value) {
                                                                    pname = value[
                                                                    'name']
                                                                        .toString();
                                                                    pmeasure = value[
                                                                    'measurement'];
                                                                    pprice = value[
                                                                    'price'];
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
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Quantity',
                                            style: style,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width:
                                            getProportionateScreenWidth(30),
                                            height: 60,
                                            child: DefaultInputForm(
                                              controller: qunatityControlor,
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'price',
                                            style: style,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width:
                                            getProportionateScreenWidth(30),
                                            height: 60,
                                            child: DefaultInputForm(
                                              controller: controllerprice,
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      typeOrder=="طلب مرتجع"?SizedBox():InkWell(
                                        onTap: () {
                                          if (pprice == null) {
                                          } else {
                                            if (controllerprice.text == "") {
                                              setState(() {
                                                changeIndex(index);
                                                totalpriceinvoice =
                                                    totalpriceinvoice +
                                                        (pprice! *
                                                            int.parse(
                                                                qunatityControlor
                                                                    .text));

                                                table.add({
                                                  "index": index,
                                                  "name": pname,
                                                  "measurement": pmeasure,
                                                  'price': pprice,
                                                  'image': "",
                                                  "quantity": int.parse(
                                                      qunatityControlor.text),
                                                });
                                                print(table);
                                              });
                                            } else {
                                              setState(() {
                                                changeIndex(index);
                                                totalpriceinvoice =
                                                    totalpriceinvoice +
                                                        (pprice! *
                                                            int.parse(
                                                                qunatityControlor
                                                                    .text));
                                                table.add({
                                                  "index": index,
                                                  "name": pname,
                                                  "measurement": pmeasure,
                                                  'price': int.parse(
                                                      controllerprice.text),
                                                  'image': "",
                                                  "quantity": int.parse(
                                                      qunatityControlor.text),
                                                });
                                                print(table);
                                              });
                                            }
                                          }
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
                                                'اضافه صنف ',
                                                style: TextStyle(
                                                  fontSize:
                                                  getProportionateScreenWidth(
                                                      5),
                                                  fontWeight: FontWeight.w500,
                                                  // color: ColorManager.primary
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      typeOrder=="طلب استبدال"?SizedBox(width:8):SizedBox(),
                                      typeOrder=="طلب استبدال"||typeOrder=="طلب مرتجع"?InkWell(
                                        onTap: () {
                                          if (pprice == null) {
                                          } else {
                                            if (controllerprice.text == "") {
                                              setState(() {
                                                changeIndex(index);
                                                totalpriceinvoice =
                                                    totalpriceinvoice -
                                                        (pprice! *
                                                            int.parse(
                                                                qunatityControlor
                                                                    .text));

                                                table.add({
                                                  "index": index,
                                                  "name": pname,
                                                  "measurement": pmeasure,
                                                  'price': pprice,
                                                  'image': "old",
                                                  "quantity": int.parse(
                                                      qunatityControlor.text),
                                                });
                                                print(table);
                                              });
                                            } else {
                                              setState(() {
                                                changeIndex(index);
                                                totalpriceinvoice =
                                                    totalpriceinvoice -
                                                        (pprice! *
                                                            int.parse(
                                                                qunatityControlor
                                                                    .text));
                                                table.add({
                                                  "index": index,
                                                  "name": pname,
                                                  "measurement": pmeasure,
                                                  'price': -int.parse(
                                                      controllerprice.text),
                                                  'image': "old",
                                                  "quantity": int.parse(
                                                      qunatityControlor.text),
                                                });
                                                print(table);
                                              });
                                            }
                                          }
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
                                                Icons.delete,
                                                color: ColorManager.primary,
                                              ),
                                              Text(
                                                'اضافه مرتجع ',
                                                style: TextStyle(
                                                  fontSize:
                                                  getProportionateScreenWidth(
                                                      5),
                                                  fontWeight: FontWeight.w500,
                                                  // color: ColorManager.primary
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ):SizedBox(),
                                    ],
                                  )

                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller5.text.isNotEmpty? Container(
                                width: MediaQuery.of(context).size.width <= 708
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "companytreasury",
                                    "bankalahly",
                                    "bankmasr",
                                    "paymob"
                                  ],
                                  selectTalab: payment,
                                  onchanged: () => (val) {
                                    setState(() {
                                      payment = val;
                                    });
                                  },
                                  label: 'الخزينه',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ):SizedBox(),
                              Column(
                                children: [
                                  Text('صافي القيمة', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: Center(
                                      child: controller5.text == ""
                                          ? controller7.text == ""
                                          ? Text((totalpriceinvoice-discountPrice)
                                          .toString())
                                          : controllerdisc.text == ""
                                          ? Text(
                                          (totalpriceinvoice + int.parse(controller7.text))
                                              .toString())
                                          : Text(
                                          (totalpriceinvoice + int.parse(controller7.text) -discountPrice)
                                              .toString())
                                          : controller7.text == ""
                                          ? Text(
                                          (totalpriceinvoice - int.parse(controller5.text))
                                              .toString())
                                          : controllerdisc.text == ""
                                          ? Text((totalpriceinvoice -
                                          int.parse(controller5
                                              .text) +
                                          int.parse(
                                              controller7.text))
                                          .toString())
                                          : Text((totalpriceinvoice -
                                          int.parse(controller5.text) +
                                          int.parse(controller7.text) -
                                          int.parse(controllerdisc.text))
                                          .toString()),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'مبلغ تحت الحساب',
                                    style: style,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller5,
                                      hint: '',
                                      label: '',
                                      onChanged: (v){
                                        setState(() {

                                        });},
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
                              Column(
                                children: [
                                  Text('اجمالى الفاتورة', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: Center(
                                      child: controller7.text == ""
                                          ? Text((totalpriceinvoice).toString())
                                          : controllerdisc.text == ""
                                          ? Text((totalpriceinvoice +
                                          int.parse(
                                              controller7.text))
                                          .toString())
                                          : Text((totalpriceinvoice +
                                          int.parse(
                                              controller7.text) -
                                          int.parse(
                                              controllerdisc.text))
                                          .toString()),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('مصاريف الشحن', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller7,
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
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text('الخصم', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controllerdisc,
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
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'العنوان',
                                    style: style,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width <= 917
                                        ? getProportionateScreenWidth(75)
                                        : getProportionateScreenWidth(63),
                                    height: 100,
                                    child: TextFormField(
                                      controller: controller8,
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                  ColorManager.primary))),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: getProportionateScreenWidth(35),
                                height: getProportionateScreenHeight(132),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'ارفاق ايصال الدفع',
                                      style: style,
                                    ),
                                    GestureDetector(
                                      onTap: _pickImage,
                                      child: Image.asset(
                                        ImageAssets.iconDropDown20,
                                        width: getProportionateScreenWidth(35),
                                        height:
                                        getProportionateScreenHeight(85),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 44,
                          ),
                          Botton(
                            bgColor: Colors.black,
                            color: Colors.white,
                            title: 'اضافة',
                            onTap: () {
                              showLoaderDialog(context);

                            if (city == null ||
                                  controller1.text == "" ||
                                  controller2.text == "" ||
                                  typeCustomer == null ||
                                  governorate == null ||
                                  controller7.text == "" ||
                                  controller8.text == "" ||
                                  controller3.text == "" ||
                                  selectTalab == null ||
                                  typeOrder == null ||
                                  shippingMethods == null) {
                              Navigator.pop(context);
                                final snackBar = SnackBar(
                                  content: Text('Please Enter all data '),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                if(payment==null){
                                  pro.addOrder(
                                      city: city.toString(),
                                      customername: controller1.text,
                                      customertype: typeCustomer.toString(),
                                      date: orderDate,
                                      downpayment: downp,
                                      government: governorate.toString(),
                                      netamount: totalpriceinvoice  +
                                          int.parse(controller7.text) -
                                          discountPrice,
                                      notes: controllernote.text,
                                      totalinvoiceamount: totalpriceinvoice,
                                      ordersource: selectTalab.toString(),
                                      ordertype: typeOrder.toString(),
                                      treasury: "",
                                      phonenumber: controller2.text,
                                      phonenumber1: controller3.text,
                                      shippingfees: int.parse(controller7.text),
                                      discount: discountPrice,
                                      shippingtype: shippingMethods.toString(),
                                      items: table,
                                      doneby: "ADMIN",
                                      address: controller8.text,
                                      context: context);

                                }else{
                                  pro.addOrder(
                                      city: city.toString(),
                                      customername: controller1.text,
                                      customertype: typeCustomer.toString(),
                                      date: orderDate,
                                      downpayment: downp,
                                      government: governorate.toString(),
                                      netamount: totalpriceinvoice -
                                          int.parse(controller5.text) +
                                          int.parse(controller7.text) -
                                          discountPrice,
                                      notes: controllernote.text,
                                      totalinvoiceamount: totalpriceinvoice,
                                      ordersource: selectTalab.toString(),
                                      ordertype: typeOrder.toString(),
                                      treasury: payment.toString(),
                                      phonenumber: controller2.text,
                                      phonenumber1: controller3.text,
                                      shippingfees: int.parse(controller7.text),
                                      discount: discountPrice,
                                      shippingtype: shippingMethods.toString(),
                                      items: table,
                                      doneby: pros.name,
                                      address: controller8.text,
                                      context: context);

                                }
                              }
                              pro.notifyListeners();

                            },
                          )
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
          print(_pickedImage);
        });
      } else {
        print('No iamge has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
          print(_pickedImage);
        });
      } else {
        print('No iamge has been picked');
      }
    } else {
      print('Something Went Wrong');
    }
  }
}