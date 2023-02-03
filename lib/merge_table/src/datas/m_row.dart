

import 'package:flutter/material.dart';

abstract class BaseMRow {
  final List<Widget> inlineRow;
  BaseMRow(this.inlineRow);
}

class MRow extends BaseMRow {
  MRow(Widget rowValue) : super([rowValue]);
}

class MMergedRows extends BaseMRow {
  MMergedRows(List<Widget> mergedRowValues) : super(mergedRowValues);
}
