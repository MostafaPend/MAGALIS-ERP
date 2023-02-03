import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/value_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class DefaultDropDown extends StatefulWidget {
  DefaultDropDown(
      {Key? key,
        required this.item,
        required this.title,
        required this.imageUrl,
        required this.trailing,
        required this.leading,
        required this.index})
      : super(key: key);

  List<String> item;
  String title;
  String imageUrl;
  Widget leading;
  Widget trailing;
  int index;

  @override
  State<DefaultDropDown> createState() => _DefaultDropDownState();
}

class _DefaultDropDownState extends State<DefaultDropDown> {
  int? selectedItem;
  int? selectedTap;

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Controller>(context);
    SizeConfig.init(context);
    return ExpansionTile(
        initiallyExpanded: selectedTap == widget.index ? true : false,
        trailing: widget.trailing,
        title: Center(
          child: MediaQuery.of(context).size.width < 1000
              ? const Text(' ')
              : Text(
            widget.title,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(5),
                color: Colors.white),
          ),
        ),
        leading: MediaQuery.of(context).size.width < 800
            ? Container(
          width: 2,
        )
            : widget.leading,
        children: [
          for (int i = 0; i < widget.item.length; i++)
            Container(
              width: 250,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                  color:
                  selectedItem == i ? Colors.white : ColorManager.primary,
                  borderRadius: BorderRadius.circular(AppSize.s15)),
              child: ListTile(
                onTap: () {
                  setState(() {
                    selectedItem = i;
                    selectedTap = widget.index;
                  });

                  QR.navigator.replaceLast(pro.screen[widget.index][i]);
                },
                title: Text(
                  widget.item[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(5),
                    color:
                    selectedItem == i ? ColorManager.primary : Colors.white,
                  ),
                ),
              ),
            ),
        ]);
  }
}