import 'package:erb_system/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DefaultAppBar extends StatelessWidget {
  DefaultAppBar({
    Key? key,
  }) : super(key: key);

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    String formattedDate = DateFormat('dd/MM/yy').format(now);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: getProportionateScreenWidth(15),
              color: const Color(0xff82225E),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 16),
          child: Text(
            formattedDate,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(6)),
          ),
        ),
      ],
    );
  }
}
