import 'package:erb_system/resources/value_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manger.dart';
class DefaultInputForm extends StatelessWidget {
  DefaultInputForm(
      {Key? key,
        required this.hint,
        required this.label,
        required this.onTab,
        required this.validate,
        required this.onSave,
        required this.passFun,
        required this.obscureText,
        required this.controller,
        this.onChanged,
        this.suffix,
        this.perFix,
        this.color,
        this.readOnly = false})
      : super(key: key);
  String hint;
  String label;
  TextEditingController controller;
  Function() onTab;
  Function() validate;
  Function() onSave;
  Function() passFun;
  Function(String)? onChanged;
  bool readOnly;
  bool obscureText;
  Widget? suffix;
  Color? color = ColorManager.primary;
  Widget? perFix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      style: TextStyle(fontSize: getProportionateScreenWidth(4)),
      obscureText: obscureText,
      validator: validate(),
      onSaved: onSave(),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14),
        label: Container(
            alignment: Alignment.center,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            )),
        prefixIcon: perFix,
        suffixIcon: suffix,
        filled: true,
        fillColor: color,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s15),
            borderSide: const BorderSide(color: Colors.black, width: 1.2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s15),
            borderSide: const BorderSide(color: Colors.black, width: 1.2)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s15),
          borderSide: const BorderSide(color: Colors.black, width: 1.2),
        ),
      ),
    );
  }
}