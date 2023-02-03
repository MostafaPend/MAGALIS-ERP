import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:flutter/material.dart';

class SettlementCompanyAccount extends StatefulWidget {
  SettlementCompanyAccount({Key? key}) : super(key: key);

  @override
  State<SettlementCompanyAccount> createState() =>
      _SettlementCompanyAccountState();
}

class _SettlementCompanyAccountState extends State<SettlementCompanyAccount> {
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  String? chose1;

  String? chose2;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    return Center(
      child: Container(
        width: getProportionateScreenWidth(230),
        height: getProportionateScreenWidth(150),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorManager.primary, width: 2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              DefaultContainer(title: 'تسويه حساب الشركه'),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'مبلغ التسويه',
                        style: getSemiBoldStyle(
                            color: ColorManager.black,
                            fontSize: getProportionateScreenWidth(5)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
                        height: 60,
                        child: DefaultInputForm(
                          controller: controller3,
                          hint: '',
                          label: '',
                          onTab: () {},
                          validate: () {},
                          onSave: () {},
                          passFun: () {},
                          color: Colors.white,
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'المبلغ المستحق',
                        style: getSemiBoldStyle(
                            color: ColorManager.black,
                            fontSize: getProportionateScreenWidth(5)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
                        height: 60,
                        child: DefaultInputForm(
                          controller: controller3,
                          hint: '',
                          label: '',
                          onTab: () {},
                          validate: () {},
                          onSave: () {},
                          passFun: () {},
                          color: Colors.grey,
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width <= 708
                        ? getProportionateScreenWidth(65)
                        : getProportionateScreenWidth(43),
                    height: getProportionateScreenHeight(90),
                    padding: const EdgeInsets.only(top: 35),
                    child: dropDown(
                      const [
                        "تحصيل",
                        "رد المبلغ",
                      ],
                      selectTalab: chose2,
                      onchanged: () => (val) {
                        setState(() {
                          chose2 = val;
                        });
                      },
                      label: 'حاله التسويه',
                      foColor: Colors.white,
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'المبلغ المتبقي',
                        style: getSemiBoldStyle(
                            color: ColorManager.black,
                            fontSize: getProportionateScreenWidth(5)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
                        height: 60,
                        child: DefaultInputForm(
                          controller: controller3,
                          hint: '',
                          label: '',
                          onTab: () {},
                          validate: () {},
                          onSave: () {},
                          passFun: () {},
                          color: Colors.grey,
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width <= 708
                        ? getProportionateScreenWidth(65)
                        : getProportionateScreenWidth(43),
                    height: getProportionateScreenHeight(90),
                    padding: const EdgeInsets.only(top: 35),
                    child: dropDown(
                      const [
                        "البنك الاهلي",
                        "بنك مصر",
                      ],
                      selectTalab: chose1,
                      onchanged: () => (val) {
                        setState(() {
                          chose1 = val;
                        });
                      },
                      label: 'الخزينه',
                      foColor: Colors.white,
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Container(
                width: getProportionateScreenWidth(90),
                height: getProportionateScreenHeight(250),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorManager.primary, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.more_horiz,
                          color: ColorManager.primary,
                        ),
                        Text(
                          'يرجي توضيح سبب التسويه',
                          style: style,
                        ),
                        Icon(
                          Icons.close,
                          color: ColorManager.primary,
                        )
                      ],
                    ),
                    Divider(
                      color: ColorManager.primary,
                      thickness: 2,
                    ),
                    TextFormField(
                      controller: controller4,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Botton(
                bgColor: Colors.black,
                color: Colors.white,
                title: 'تسويه',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
