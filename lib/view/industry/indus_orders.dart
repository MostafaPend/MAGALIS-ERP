import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/manufacturing/manufacturing_controller.dart';

class IndustryOrder extends StatefulWidget {
  const IndustryOrder({Key? key}) : super(key: key);

  @override
  State<IndustryOrder> createState() => _IndustryOrderState();
}

class _IndustryOrderState extends State<IndustryOrder> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();

  DateTime orderDate = DateTime.now();

  List dataTable = [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.red,
            )),
        const Text('اضافه صنف')
      ],
    )
  ];



  List<String> columnData = [
    "تم بواسطه",
    "اجمالي التكلفه",
    "الكميه",
    "اسم المنتج",
    "حاله التصنيع",
    "تاريخ الانتهاء",
    "تاريخ الطلب",
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

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    var pro = Provider.of<ManufacturingController>(context);
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
                          DefaultContainer(title: 'اوامر التصنيع'),
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                ' البحث',
                                style:
                                    getSemiBoldStyle(color: ColorManager.black),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: getProportionateScreenWidth(40),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const ['تم الانتهاء', 'في التصنيع'],
                                  selectTalab: chose,
                                  onchanged: () => (val) {
                                    setState(() {
                                      chose = val;
                                    });
                                  },
                                  label: 'حاله التصنيع',
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
                                      onPressed: () => _selectDate(context),
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
                            height: 90,
                          ),
                          Consumer<ManufacturingController>(
                            builder: (context, valu, child) {
                              return FutureBuilder(
                                  future: valu.getManfuctureOrders(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List sup =
                                      snapshot.data as List;

                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 71),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: List.generate(
                                                  sup.length,
                                                      (index) => Column(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                          getProportionateScreenWidth(
                                                              40),
                                                          child: dropDown(
                                                            const [
                                                              'تعديل الامر',
                                                              'الغاء الامر',
                                                              'تفاصيل الامر',
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
                                                            bgColor:
                                                            ColorManager.primary,
                                                            dpColor:
                                                            ColorManager.primary,
                                                          )),
                                                      const SizedBox(
                                                        height: 10,
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          ),
                                          DefaultTable(
                                            columnData: columnData,
                                            size: getProportionateScreenWidth(4),
                                            color: ColorManager.second,
                                            rows: sup
                                                .map((data) => DataRow(cells: [
                                              DataCell(Text(
                                                data['doneby'],
                                                style: style,
                                              )),
                                              DataCell(Text(
                                                data['totalcost'].toString(),
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
                                              DataCell(Text(
                                                data['manufacturingstatus'],
                                                style: style,
                                              )),
                                              DataCell(Text(
                                                data['enddate'],
                                                style: style,
                                              )),
                                              DataCell(Text(
                                                data['date'],
                                                style: style,
                                              )),

                                            ]))
                                                .toList(),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  });
                            },
                          ),

                          const SizedBox(
                            height: 50,
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
