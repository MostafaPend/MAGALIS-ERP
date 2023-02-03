import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class SupPay extends StatefulWidget {
  String ? name;
  String ? balance;
  SupPay({Key? key, required this.name, required this.balance}) : super(key: key);

  @override
  State<SupPay> createState() => _SupPayState();
}

class _SupPayState extends State<SupPay> {
  DateTime now = DateTime.now();
  String? chose;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));

    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  DefaultContainer(title: 'سداد المورد اسلام'),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: getProportionateScreenWidth(60),
                        height: 80,
                        padding: const EdgeInsets.only(top: 35),
                        child: dropDown(
                          const [
                            'companytreasury',
                            'bankalahly',
                            "bankmasr",
                          ],
                          selectTalab: chose,
                          onchanged: () => (val) {
                            setState(() {
                              chose = val;
                            });
                          },
                          label: 'الخزينه',
                          foColor: Colors.white,
                          bgColor: ColorManager.primary,
                          dpColor: ColorManager.primary,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            'المبلغ المدفوع',
                            style: getSemiBoldStyle(color: ColorManager.black),
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
                              color: ColorManager.primary,
                              obscureText: false,
                            ),
                          ),
                          Text(
                            'رصيد بعد',
                            style: getSemiBoldStyle(color: ColorManager.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(child: Text(widget.balance!),)
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'الرصيد قبل',
                            style: getSemiBoldStyle(color: ColorManager.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(child: Text(widget.balance!),)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Botton(
                    color: ColorManager.white,
                    title: 'دفع',
                    onTap: () async{
                      if(chose==null||controller1.text==""){

                      }
                      else{
                        await FirebaseFirestore.instance.collection("suppliers").doc(widget.name).update(
                            {
                              "balance":FieldValue.increment(-int.parse(controller1.text))
                            });

                        await FirebaseFirestore.instance.collection("suppliers").doc(widget.name).update(
                            {
                              "balance":FieldValue.increment(-int.parse(controller1.text))
                            });

                        await FirebaseFirestore.instance.collection("treasuryactions").doc(chose).get().then((valuexxx) =>
                        {
                          FirebaseFirestore.instance
                              .collection('treasuryactions')
                              .doc(chose)
                              .collection("Reports")
                              .add(
                            {
                              'afterQuantity': valuexxx["balance"]-int.parse(controller1.text),
                              'beforeQuantity': valuexxx["balance"],
                              'date': DateTime.now().toIso8601String(),
                              'totalcost': int.parse(controller1.text),
                              'type': "Purchase",
                              "actionTaker":"ADMIN",
                              "id":widget.name,
                            },
                          )
                        });
                        await FirebaseFirestore.instance.collection("treasuryactions").doc(chose).update(
                            {
                              "balance":FieldValue.increment(-int.parse(controller1.text))
                            });
                      }

                      QR.to("/home");
                    },
                    bgColor: ColorManager.black,
                  ),
                ],
              ),
            ),
            const DefaultRow(),
          ],
        ),
      ),
    ));
  }
}
