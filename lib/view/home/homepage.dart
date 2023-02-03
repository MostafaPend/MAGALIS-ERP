import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manger.dart';
import 'drop_down_par.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Row(
        children: [
          Consumer<Controller>(
            builder: (context, value, child) {
              return Expanded(
                  flex: 5,
                  child: Stack(
                    children: [value.current, DefaultAppBar()],
                  ));
            },
          ),
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
