import 'package:erb_system/controller/treasury/treasury_controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/resources/value_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTreasury extends StatefulWidget {
  EditTreasury({Key? key, this.title, this.id, this.balance}) : super(key: key);
  String? title = '';
  String? id = '';
  String? balance;

  @override
  State<EditTreasury> createState() => _EditTreasuryState();
}

class _EditTreasuryState extends State<EditTreasury> {
  TextEditingController controller4 = TextEditingController();
  double? avarage;
  double? newBalance;
  TextEditingController controller1 = TextEditingController();
  late TextEditingController controller3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller3 = TextEditingController(text: '${widget.balance}');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    var pro = Provider.of<TreasuryController>(context);
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
              DefaultContainer(title: ' تعديل الخزينه ${widget.title}'),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'الفرق',
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
                  Column(
                    children: [
                      Text(
                        'الرصيد الجديد',
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
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(4)),
                          onChanged: (v) {
                            setState(() {
                              if (v.isNotEmpty) {
                                controller1 = TextEditingController(
                                    text:
                                        "${-double.parse(controller3.text) + num.parse(v)}");
                              } else {
                                controller1 = TextEditingController(text: "0");
                              }
                            });
                          },
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(fontSize: 14),
                            label: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                )),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s15),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s15),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.2)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSize.s15),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'الرصيد الحالي',
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
                          'يرجي توضيح سبب التعديل',
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
                title: 'تعديل',
                onTap: () {
                  pro.editTreasury(widget.id!, double.parse(controller1.text),
                      controller4.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
