import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class AddCompany extends StatelessWidget {
  AddCompany({Key? key}) : super(key: key);
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                DefaultContainer(
                  title: 'اضافة شركة شحن او مندوب',
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(40),
                      child: Column(
                        children: [
                          Text(
                            'النوع',
                            style: style,
                          ),
                          DefaultInputForm(
                            controller: controller1,
                            hint: '',
                            label: '',
                            onTab: () {},
                            validate: () {},
                            onSave: () {},
                            passFun: () {},
                            obscureText: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(40),
                      child: Column(
                        children: [
                          Text(
                            'الاسم',
                            style: style,
                          ),
                          DefaultInputForm(
                            controller: controller2,
                            hint: '',
                            label: '',
                            onTab: () {},
                            validate: () {},
                            onSave: () {},
                            passFun: () {},
                            obscureText: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                Botton(
                  bgColor: Colors.black,
                  color: Colors.white,
                  title: 'اضافة',
                  onTap: () async{

                    if(controller2.text==""){}else{
                      await FirebaseFirestore.instance.collection("courriers").doc(controller2.text).set(
                          {
                            "balance":0,
                            "cancellationpercentage":0,
                            "couriertype":controller1.text,
                            "name":controller2.text,
                            "ordertobecollected":0,
                          });

                      QR.to("/home");

                    }
                  },
                )
              ],
            ),
          ),
          const DefaultRow()
        ],
      ),
    );
  }
}
