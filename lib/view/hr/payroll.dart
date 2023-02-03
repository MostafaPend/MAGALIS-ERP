import 'package:dropdown_search/dropdown_search.dart';
import 'package:erb_system/controller/hr_controller/hr_controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/resources/value_manager.dart';
import 'package:erb_system/utils/city.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../size_config.dart';
import '../auth/component/text_fom_feild.dart';
import '../home/components/botton.dart';
import '../home/components/drop_down.dart';

class Payroll extends StatefulWidget {
  @override
  State<Payroll> createState() => _PayrollState();
}

class _PayrollState extends State<Payroll> {
  DateTime now = DateTime.now();
  String? categoryValue;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  // DateTime _dateTime = DateTime.now();
  String? selectTalab;
  String? stateTalab;
  String? shippingMethods;
  String? numLine;
  String? payment;
  String? city;
  String? typeCustomer;
  String? month = '';
  String? governorate;
  String? numLine1;
  String? typeOrder;
  String? order;
  String? name = '';
  String? selectedName;
  String? selectedMonth;
  DateTime orderDate = DateTime.now();
  Map<String, dynamic> employeeData = {
    'residual': '',
    'salaryOrLoan': '',
    'totalSalary': '',
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(context: context, initialDate: orderDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate) {
      setState(() {
        orderDate = pickedDate;
      });
    }
  }

  Future<void> data() async {
    employeeData = await info(name ?? '');
    controller3.text = (employeeData['residual'].toString());
    controller4.text = (employeeData['salaryOrLoan'].toString());
    controller5.text = (employeeData['totalSalary'].toString());
    // if (employeeData == {}) {
    //   controller1.text = '';
    //   controller2.text = '';
    //   controller3.text = '';
    // }
    // print('employee data ' + employeeData['residual'].toString());
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AddHRController>(context);
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    // var format = DateFormat.yMd('ar');

    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  SizedBox(
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
                          DefaultContainer(title: 'صرف المرتبات'),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      ' التاريخ',
                                      style: getSemiBoldStyle(color: ColorManager.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(40),
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed: () => _selectDate(context),
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
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
                                FutureBuilder(
                                    future: Future.wait([employeeMonths(month ?? ''), data()]),
                                    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                                      final employeesList = snapshot.data?[0] ?? [''];
                                      return SizedBox(
                                        width: MediaQuery.of(context).size.width <= 880
                                            ? getProportionateScreenWidth(75)
                                            : getProportionateScreenWidth(43),
                                        height: getProportionateScreenHeight(50),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.2,
                                              ),
                                              borderRadius: BorderRadius.circular(AppSize.s15)),
                                          child: Center(
                                            child: DropdownSearch<String>(
                                              clearButtonProps: const ClearButtonProps(isVisible: true),
                                              popupProps: const PopupProps.menu(
                                                showSearchBox: true,
                                                showSelectedItems: true,
                                                // searchFieldProps: TextFieldProps(cursorColor: ColorManager.primary),
                                                // disabledItemFn: (String s) =>
                                                //     s.startsWith('I'),
                                              ),
                                              items: employeesList,
                                              selectedItem: selectedName,
                                              dropdownDecoratorProps: const DropDownDecoratorProps(
                                                dropdownSearchDecoration: InputDecoration(hintText: 'الاسم', border: InputBorder.none),
                                              ),
                                              onChanged: (v) {
                                                setState(() {
                                                  selectedName = v;
                                                  name = v;
                                                  data();
                                                  employeeData;
                                                  // employeeData = snapshot.data?[1];
                                                  // print(employeeData);
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                // SizedBox(
                                //   width: MediaQuery.of(context).size.width <= 880 ? getProportionateScreenWidth(75) : getProportionateScreenWidth(43),
                                //   height: getProportionateScreenHeight(50),
                                //   child: Container(
                                //     padding: const EdgeInsets.symmetric(horizontal: 20),
                                //     decoration: BoxDecoration(
                                //         border: Border.all(width: 3, color: const Color(0xff82225E)), borderRadius: BorderRadius.circular(10)),
                                //     child: Center(
                                //       child: DropdownSearch<String>(
                                //         clearButtonProps: const ClearButtonProps(isVisible: true),
                                //         popupProps: PopupProps.menu(
                                //           showSearchBox: true,
                                //           showSelectedItems: true,
                                //           searchFieldProps: TextFieldProps(cursorColor: ColorManager.primary),
                                //           // disabledItemFn: (String s) =>
                                //           //     s.startsWith('I'),
                                //         ),
                                //         items: employeeMonths(month ?? ''),
                                //         dropdownDecoratorProps: const DropDownDecoratorProps(
                                //           dropdownSearchDecoration: InputDecoration(hintText: 'الاسم', border: InputBorder.none),
                                //         ),
                                //         onChanged: (v) {
                                //           setState(() {
                                //             // cityMain = v!;
                                //           });
                                //         },
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  width: MediaQuery.of(context).size.width <= 880 ? getProportionateScreenWidth(75) : getProportionateScreenWidth(43),
                                  height: getProportionateScreenHeight(50),
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.2,
                                      ),
                                      borderRadius: BorderRadius.circular(AppSize.s15)),
                                  child: Center(
                                    child: DropdownSearch<String>(
                                      clearButtonProps: const ClearButtonProps(isVisible: true),
                                      popupProps: const PopupProps.menu(
                                        showSearchBox: true,
                                        showSelectedItems: true,
                                        // disabledItemFn: (String s) =>
                                        //     s.startsWith('I'),
                                      ),
                                      selectedItem: selectedMonth,
                                      items: months,
                                      dropdownDecoratorProps: const DropDownDecoratorProps(
                                        dropdownSearchDecoration: InputDecoration(hintText: 'راتب الشهر', border: InputBorder.none),
                                      ),
                                      onChanged: (v) {
                                        setState(() {
                                          selectedMonth = v;
                                          selectedName = null;
                                          name = null;
                                          month = v!;
                                        });
                                      },
                                    ),
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
                                  Text(
                                    'المتبقي',
                                    style: style,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(40),
                                    height: 60,
                                    child: DefaultInputForm(
                                      hint: employeeData['residual'].toString() == 'null' ? '' : employeeData['residual'].toString(),
                                      label: '',
                                      readOnly: true,
                                      onTab: () {},
                                      validate: () {},
                                      onSave: () {},
                                      passFun: () {},
                                      color: Colors.white70,
                                      obscureText: false,
                                      controller: controller3,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'السلف',
                                    style: style,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(40),
                                    height: 60,
                                    child: DefaultInputForm(
                                      hint: employeeData['salaryOrLoan'].toString(),
                                      readOnly: true,
                                      label: '',
                                      onTab: () {},
                                      validate: () {},
                                      onSave: () {},
                                      passFun: () {},
                                      color: Colors.white70,
                                      obscureText: false,
                                      controller: controller4,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'اجمالي الراتب',
                                    style: style,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(40),
                                    height: 60,
                                    child: DefaultInputForm(
                                      hint: employeeData['totalSalary'].toString(),
                                      readOnly: true,
                                      label: '',
                                      onTab: () {},
                                      validate: () {},
                                      onSave: () {},
                                      passFun: () {},
                                      color: Colors.white70,
                                      obscureText: false,
                                      controller: controller5,
                                    ),
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
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width <= 500 ? getProportionateScreenWidth(65) : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "خزينة المصنع",
                                    "البنك الاهلي",
                                    "بنك مصر",
                                  ],
                                  selectTalab: selectTalab,
                                  onchanged: () => (val) {
                                    setState(() {
                                      selectTalab = val;
                                    });
                                  },
                                  label: 'الخزينة',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'مبلغ الصرف للراتب',
                                    style: style,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(40),
                                    height: 60,
                                    child: DefaultInputForm(
                                      hint: '',
                                      label: '',
                                      onTab: () {},
                                      validate: () {},
                                      onSave: () {},
                                      passFun: () {},
                                      color: Colors.white70,
                                      obscureText: false,
                                      controller: controller6,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Botton(
                            bgColor: Colors.black,
                            color: Colors.white,
                            title: 'صرف',
                            onTap: () async {
                              // if (((int.parse(selectedMonth??'') + 1) == orderDate.month) ||
                              //     ((int.parse(selectedMonth??'')) == 12) && orderDate.month == 1) {
                              if (int.parse(controller6.text)<int.parse(controller3.text)) {
                                await pro.salaries(
                                  name: selectedName ?? '',
                                  monthSalary: int.parse(selectedMonth??'').toDouble(),
                                  totalSalary: int.parse(controller5.text).toDouble(),
                                  fromTreasury: selectTalab ?? '',
                                  residual: int.parse(controller3.text).toDouble(),
                                  salaryOrLoan: int.parse(controller4.text).toDouble(),
                                  salaryDisbursementAmount: int.parse(controller6.text).toDouble(),
                                );
                                controller1.clear();
                                controller2.clear();
                                controller3.clear();
                                controller4.clear();
                                controller5.clear();
                                controller6.clear();
                              }else{
                                const snackBar = SnackBar(
                                  content: Text('المبلغ اكبر من المتبقي'),
//
                                );

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }

//                               } else {
//                                 const snackBar = SnackBar(
//                                   content: Text('هنالك خطأ في خانة (راتب شهر)'),
// //
//                                 );

//                                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                               }
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
}