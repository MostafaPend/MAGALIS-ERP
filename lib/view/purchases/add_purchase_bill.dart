import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erb_system/controller/category/category_controller.dart';
import 'package:erb_system/controller/purchase_controller/pruchase_controller.dart';
import 'package:erb_system/controller/suppliers/add_suppliers.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/resources/value_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

class AddPurchaseBill extends StatefulWidget {
  const AddPurchaseBill({Key? key}) : super(key: key);

  @override
  State<AddPurchaseBill> createState() => _AddPurchaseBillState();
}

class _AddPurchaseBillState extends State<AddPurchaseBill> {
  String? chose;
  String? chose1;
  String? chose2;
  DateTime orderDate = DateTime.now();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController quantity = TextEditingController();

  int? selectedIndex;
  List data = [];
  List finalData = [];

  String? catName;
  String? catPrice;
  String? catMeasurement;
  String? image;
  double totalTotal = 0;
  int totalQuantity = 0;
  String? bank;
  String? supName;
  TextEditingController qunatityControlor = TextEditingController();
  TextEditingController controllerprice = TextEditingController();
  String ? xXxX;
  double rBalance = 0;
  Image? _image;
  Uint8List? paths;

  List<String> columnData = [
    "",
    "صوره الصنف",
    "الاجمالي",
    "السعر",
    "الوحده",
    "الكميه المطلوبه",
    "اسم الصنف",
  ];
  void getPhoto() async {
    FilePickerResult result;

    result = (await FilePicker.platform.pickFiles(
        type: FileType.image))!;
    if(result!=null)
    {
      setState(() {
        paths = result.files.single.bytes;
        _image = Image.memory(result.files.single.bytes!,fit: BoxFit.fill,);
        print(_image.toString());

      });

    }
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

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    var pro = Provider.of<PurchaseController>(context);
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
                          DefaultContainer(title: 'اضافه فاتوره مشتريات'),
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
                                    'التاريخ',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(40),
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
                                          color: ColorManager.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Container(
                                width: getProportionateScreenWidth(50),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const ['تم الطلب', 'تم الاستلام'],
                                  selectTalab: chose,
                                  onchanged: () => (val) {
                                    setState(() {
                                      chose = val;
                                    });
                                  },
                                  label: 'حاله الشراء',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'اسم المورد',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Consumer<AddSuppliersController>(
                                    builder: (context, valu, child) {
                                      return FutureBuilder(
                                          future: valu.getSupplier(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              List sup = snapshot.data as List;

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
                                                      supName = v;
                                                    });
                                                  },
                                                ),
                                              );
                                            } else {
                                              return const CircularProgressIndicator();
                                            }
                                          });
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 90,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: getProportionateScreenWidth(35),
                                    height: getProportionateScreenHeight(132),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    )),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'اضافة صورة',
                                          style: style,
                                        ),
                                        InkWell(
                                          onTap: () {getPhoto();},
                                          child: _image == null?Image.asset(
                                            ImageAssets.iconDropDown20,
                                            width:
                                            getProportionateScreenWidth(35),
                                            height:
                                            getProportionateScreenHeight(
                                                85),
                                          ):_image,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  DefaultTable(
                                      columnData: columnData,
                                      size: getProportionateScreenWidth(15),
                                      color: ColorManager.primary,
                                      rows: [
                                        ...finalData
                                            .map((data) => DataRow(cells: [
                                          DataCell(IconButton(
                                            icon: Icon(Icons.close),
                                            onPressed: () {
                                              setState(() {

                                                finalData.removeWhere((item) =>
                                                item['index'] ==
                                                    data['index']);
                                                double x = (data['quantity'] *
                                                    data["price"]);

                                                  totalTotal= totalTotal-x;


                                              });
                                            },
                                          )),
                                          DataCell(Image.network(
                                                    data['image'],
                                                    width: 50,
                                                    height: 50,
                                                  )),
                                                  DataCell(Text(
                                                    (data['price']*data['quantity']).toString(),
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
                                                    data['name'],
                                                    style: style,
                                                  )),
                                                ]))
                                            .toList(),
                                      ]),
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
                                          Consumer<CategoryController>(
                                            builder: (context, valu, child) {
                                              return FutureBuilder(
                                                  future: valu.getMaterials(),
                                                  builder: (context, snapshot) {
                                                    if (snapshot.hasData) {
                                                      List sup =
                                                      snapshot.data as List;

                                                      return SizedBox(
                                                        width:
                                                        getProportionateScreenWidth(
                                                            50),
                                                        height: 60,
                                                        child:
                                                        DropdownSearch<String>(
                                                          popupProps:
                                                          PopupProps.menu(
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
                                                                  (index) => sup[index]
                                                              ['name']),
                                                          dropdownDecoratorProps:
                                                          const DropDownDecoratorProps(
                                                            dropdownSearchDecoration:
                                                            InputDecoration(
                                                              hintText: "اسم الصنف",
                                                            ),
                                                          ),
                                                          onChanged: (v) async {


                                                            setState(() {
                                                              print(v);
                                                              xXxX =v;
                                                            });
                                                          },
                                                        ),
                                                      );
                                                    } else {
                                                      return const CircularProgressIndicator();
                                                    }
                                                  });
                                            },
                                          )
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
                                      SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () async{
                                          await FirebaseFirestore
                                              .instance
                                              .collection(
                                              'Materials')
                                              .doc(xXxX)
                                              .get()
                                              .then((value) {
                                            catPrice =
                                                value['price']
                                                    .toString();
                                            catName = xXxX;
                                            catMeasurement = value[
                                            'measurement'];
                                            image = value['image'];
                                            quantity.text = '0';
                                            total.text = '0';
                                            setState(() {
                                              print("1");
                                              finalData.add({
                                                "name": xXxX,
                                                'quantity': int.parse(qunatityControlor.text),
                                                "measurement": value[
                                                'measurement'],
                                                'price':
                                                controllerprice.text==""?value['price']:int.parse(controllerprice.text),
                                                'image':
                                                value['image'],
                                              });
                                              print("12");
                                              totalTotal= totalTotal+(value['price']*int.parse(qunatityControlor.text));
                                            });
                                          });
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
                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: SizedBox(
                                    width: getProportionateScreenWidth(59),
                                    height: getProportionateScreenHeight(50),
                                    child: dropDown(
                                      const [
                                        'خزينه المصنع',
                                        'البنك الاهلي',
                                        'فوافون كاش',
                                        'بنك مصر',
                                      ],
                                      selectTalab: chose1,
                                      onchanged: () => (val) {
                                        if (val == 'خزينه المصنع') {
                                          setState(() {
                                            bank = 'companytreasury';
                                          });
                                        } else if (val == 'البنك الاهلي') {
                                          setState(() {
                                            bank = 'bankalahly';
                                          });
                                        } else if (val == 'بنك مصر') {
                                          setState(() {
                                            bank = 'bankmasr';
                                          });
                                        }
                                        setState(() {
                                          chose1 = val;
                                        });
                                      },
                                      label: 'الخزينه',
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
                                    )),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'الشحن',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(60),
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
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'المبلغ المتبقي',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    height: 60,
                                    child: Text(rBalance.toString()),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'المبلغ المدفوع',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    height: 60,
                                    child: TextFormField(
                                      controller: controller1,
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(4)),
                                      onChanged: (v) {
                                        setState(() {
                                          if (v.isNotEmpty) {
                                            rBalance = totalTotal - num.parse(v);
                                          } else {

                                          }
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintStyle:
                                            const TextStyle(fontSize: 14),
                                        label: Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              '',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s15),
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s15),
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.2)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              AppSize.s15),
                                          borderSide: const BorderSide(
                                              color: Colors.black, width: 1.2),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Botton(
                            color: ColorManager.white,
                            title: 'اضافه',
                            onTap: () {
                              showLoaderDialog(context);

                              try{
                                pro.addBill(
                                    bank!,
                                    double.parse(controller1.text) +
                                        double.parse(controller2.text),
                                    supName!,
                                    rBalance,
                                    totalTotal)
                                    .then((value) {
                                  pro.addPurchasing(
                                      date: orderDate.toString(),
                                      state: chose!,
                                      trasury: bank!,
                                      supName: supName!,
                                      podownpayment:
                                      double.parse(controller1.text),
                                      poshippingfees:
                                      double.parse(controller2.text),
                                      remainbalance:
                                      rBalance,
                                      total: totalTotal,
                                      purData: finalData,
                                      totalQuantity: totalQuantity,
                                      measurement: catMeasurement!,
                                      context: context);
                                });
                              }catch(e){
                                print(e.toString());
                                Navigator.pop(context);
                              }
                            },
                            bgColor: ColorManager.black,
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
    ));
  }
}
