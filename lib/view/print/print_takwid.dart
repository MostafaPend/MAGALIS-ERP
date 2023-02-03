import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:flutter/material.dart';

class PrintTakwid extends StatelessWidget {
  const PrintTakwid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              children: [
                DefaultContainer(title: 'طباعه التكويد'),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SizedBox(
                    child: GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 1.3,
                      crossAxisCount: 6,
                      crossAxisSpacing: getProportionateScreenHeight(50),
                      mainAxisSpacing: getProportionateScreenWidth(10),
                      padding: const EdgeInsets.all(10.0),
                      children: List.generate(
                          10,
                          (index) => InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: ColorManager.primary,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '011-1-5',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    500
                                                ? getProportionateScreenWidth(8)
                                                : getProportionateScreenWidth(
                                                    5),
                                            color: Colors.white),
                                      ),
                                      Image.asset(ImageAssets.iconDropDown5,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width <=
                                                  600
                                              ? getProportionateScreenWidth(40)
                                              : getProportionateScreenWidth(80),
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .width <=
                                                  600
                                              ? getProportionateScreenHeight(40)
                                              : getProportionateScreenHeight(
                                                  80))
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  ),
                ),
                Botton(
                    color: Colors.white,
                    title: 'طباعه',
                    onTap: () {},
                    bgColor: Colors.black)
              ],
            ),
          ),
          DefaultRow(),
        ],
      ),
    );
  }
}
