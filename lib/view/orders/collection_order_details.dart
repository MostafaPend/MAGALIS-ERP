import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/controller/Orders/orders_controller.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../size_config.dart';
import '../home/components/default_table.dart';
import '../home/components/drop_down.dart';

class CollectionOrderDetails extends StatefulWidget {
  @override
  State<CollectionOrderDetails> createState() => _CollectionOrderDetailsState();
}

class _CollectionOrderDetailsState extends State<CollectionOrderDetails> {
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
  // DateTime _dateTime = DateTime.now();
  String? selectTalab;
  String? stateTalab;
  String? shippingMethods;
  String? numLine;
  String? payment;
  String? city;
  String? companyCharge;
  String? calcComCharge;

  String? governorate;
  String? numLine1;
  String? typeOrder;
  String? order;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  DateTime chargeDate = DateTime.now();


  List<String> columnData = [
    "صورةالمنتج",
    "اجمالي سعر البيع",
    "سعر ",
    "الوحده",
    "الكميةالمطلوبة",
    "اسم المنتج",
  ];
  List dataTable = [
    Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.red,
            )),
        const Text('اضافه منتج')
      ],
    )
  ];


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    var pro = Provider.of<AddOrderController>(context);

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
                            height: 20,
                          ),
                          DefaultContainer(title: 'تفاصيل طلب '),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width <=
                                          500
                                          ? getProportionateScreenWidth(65)
                                          : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(90),
                                      padding: const EdgeInsets.only(top: 35),
                                      child: dropDown(
                                        const [

                                        ],
                                        selectTalab:  pro.ordersource!,
                                        onchanged: () => (val) {
                                          setState(() {
                                          });
                                        },
                                        label: pro.ordersource!,
                                        foColor: Colors.white,
                                        bgColor: ColorManager.primary,
                                        dpColor: ColorManager.primary,
                                      ),
                                    ),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width <=
                                          500
                                          ? getProportionateScreenWidth(65)
                                          : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(90),
                                      padding: const EdgeInsets.only(top: 35),
                                      child: dropDown(
                                        const [

                                        ],
                                        selectTalab: pro.shippingtyp.toString(),
                                        onchanged: () => (val) {
                                          setState(() {
                                          });
                                        },
                                        label: pro.shippingtyp.toString(),
                                        foColor: Colors.white,
                                        bgColor: ColorManager.primary,
                                        dpColor: ColorManager.primary,
                                      ),
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
                                        onPressed: () => {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                        child: Text(
                                          pro.date!,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                              getProportionateScreenWidth(
                                                  5)),
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
                                        onPressed: () => {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                        child: Text(
                                          pro.orderstatusdate!,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                              getProportionateScreenWidth(
                                                  5)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width <=
                                          500
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
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon: const Icon(
                                                Icons.arrow_drop_down_outlined,
                                                color: Color(0xff82225E)),
                                            items: [
                                              pro.city!,
                                            ]
                                                .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                    color:
                                                    Colors.black),
                                              ),
                                            ))
                                                .toList(),
                                            value: city,
                                            onChanged: (val) {
                                              setState(() {
                                                city = val;
                                              });
                                            },
                                            hint:  Text(
                                              pro.city!,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            dropdownColor: Colors.white,
                                            style: const TextStyle(
                                                color: Color(0xff82225E)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width <=
                                          500
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
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon: const Icon(
                                                Icons.arrow_drop_down_outlined,
                                                color: Color(0xff82225E)),
                                            items: [
                                              pro.government,
                                            ]
                                                .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                pro.government!,
                                                style: const TextStyle(
                                                    color:
                                                    Colors.black),
                                              ),
                                            ))
                                                .toList(),
                                            value: pro.government,
                                            onChanged: (val) {
                                              setState(() {
                                              });
                                            },
                                            hint:  Text(
                                              pro.government!,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            dropdownColor: Colors.white,
                                            style: const TextStyle(
                                                color: Color(0xff82225E)),
                                          ),
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
                                              child: Center(child: Text(
                                                pro.customername!,
                                                style: style,
                                              ),),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'رقم الموبيل 1',
                                          style: style,
                                        ),

                                        SizedBox(
                                          width:
                                          getProportionateScreenWidth(40),
                                          height: 60,
                                          child: Center(child: Text(
                                            pro.phoneNumber.toString(),
                                            style: style,
                                          ),),
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
                                          child: Center(child: Text(
                                            pro.phoneNumber1!,
                                            style: style,
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width <= 500
                                      ? getProportionateScreenWidth(65)
                                      : getProportionateScreenWidth(43),
                                  height: getProportionateScreenHeight(90),
                                  padding: const EdgeInsets.only(top: 35),
                                  child: dropDown(
                                    const [

                                    ],
                                    selectTalab: pro.orderstatus.toString(),
                                    onchanged: () => (val) {
                                      setState(() {
                                      });
                                    },
                                    label: pro.orderstatus.toString(),
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
                              Column(
                                children: [
                                  Container(
                                    width: getProportionateScreenWidth(70),
                                    height: getProportionateScreenHeight(183),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.more_horiz),
                                            Text(
                                              'ملحوظات',
                                              style: style,
                                            ),
                                            Icon(Icons.close)
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                          thickness: 2,
                                        ),
                                        Center(child: SizedBox(
                                          width:
                                          getProportionateScreenWidth(40),
                                          height: 60,
                                          child: Center(child: Text(
                                            pro.notes!.toString(),
                                            style: style,
                                          ),),
                                        ),)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: getProportionateScreenWidth(70),
                                    height: getProportionateScreenHeight(183),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.more_horiz),
                                            Text(
                                              'تتبع',
                                              style: style,
                                            ),
                                            Icon(Icons.remove_red_eye_rounded)
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                          thickness: 2,
                                        ),
                                        StreamBuilder(
                                          stream: FirebaseFirestore.instance.collection('supplychain').doc(pro.id!).collection("Tracking").snapshots(),
                                          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                                            var items = snapshot.data!.docs;

                                            if(!snapshot.hasData){
                                              return const Center(child: CircularProgressIndicator(color: Colors.red,),);
                                            }


                                            return Container(
                                              width: getProportionateScreenWidth(60),
                                              height: getProportionateScreenHeight(133),
                                              child: ListView.builder(
                                                  itemCount: items.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return ListTile(
                                                        leading:  Text(items[index]["by"]),
                                                        trailing:  Text(
                                                          items[index]["type"],
                                                          style:const TextStyle(color: Colors.green, fontSize: 15),
                                                        ),
                                                        title: Text(items[index]["date"].toString().substring(5,10),style: TextStyle(fontSize: 11),));
                                                  }),
                                            );
                                          },
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  DefaultTable(
                                    columnData: columnData,
                                    size: getProportionateScreenWidth(6),
                                    color: ColorManager.primary,
                                    rows: pro.orders!
                                        .map((data) => DataRow(cells: [
                                      DataCell(Image.asset(
                                        ImageAssets.iconDropDown23,
                                        width: 50,
                                        height: 50,
                                      )),
                                      DataCell(Text(
                                        data['totalprice'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['price'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['unit'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['quantity'].toString(),
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['productname'],
                                        style: style,
                                      )),
                                    ]))
                                        .toList(),
                                  ),
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
                              Container(
                                width: MediaQuery.of(context).size.width <= 500
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [

                                  ],
                                  selectTalab: pro.treasury!,
                                  onchanged: () => (val) {
                                    setState(() {
                                    });
                                  },
                                  label: pro.treasury!,
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              Column(
                                children: [
                                  Text('صافي القيمة', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width:
                                    getProportionateScreenWidth(40),
                                    height: 60,
                                    child: Center(child: Text(
                                      pro.netamount.toString(),
                                      style: style,
                                    ),),
                                  ),

                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width <= 500
                                        ? getProportionateScreenWidth(65)
                                        : getProportionateScreenWidth(43),
                                    height: getProportionateScreenHeight(90),
                                    padding: const EdgeInsets.only(top: 35),
                                    child: dropDown(
                                       [

                                      ],
                                      selectTalab: numLine,
                                      onchanged: () => (val) {
                                        setState(() {
                                          numLine = val;
                                        });
                                      },
                                      label: pro.routenumber!,
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
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
                                    width:
                                    getProportionateScreenWidth(40),
                                    height: 60,
                                    child: Center(child: Text(
                                      pro.downpayment.toString(),
                                      style: style,
                                    ),),
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
                                    width:
                                    getProportionateScreenWidth(40),
                                    height: 60,
                                    child: Center(child: Text(
                                      pro.totalinvoice.toString(),
                                      style: style,
                                    ),),
                                  ),

                                  Text(
                                    'تاريخ الشحن',
                                    style: style,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () => (){},
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                      child: Text(
                                       pro.orderstatusdate!,
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
                                  Text('مصاريف الشحن', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width:
                                    getProportionateScreenWidth(40),
                                    height: 60,
                                    child: Center(child: Text(
                                      pro.shippingfees.toString(),
                                      style: style,
                                    ),),
                                  ),

                                  Text('خط التوزيع', style: style),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width:
                                    getProportionateScreenWidth(40),
                                    height: 60,
                                    child: Center(child: Text(
                                      pro.routenumber!,
                                      style: style,
                                    ),),
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
                                  Text(
                                    'العنوان',
                                    style: style,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width:
                                    getProportionateScreenWidth(40),
                                    height: 60,
                                    child: Center(child: Text(
                                      pro.address!,
                                      style: style,
                                    ),),
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
                                    InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          ImageAssets.iconDropDown20,
                                          width:
                                          getProportionateScreenWidth(35),
                                          height:
                                          getProportionateScreenHeight(80),
                                        ))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
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
      ),
    );
  }
}
