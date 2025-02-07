import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';

enum ListType { leftRight, topBottom }

class FieldList extends StatelessWidget {
  const FieldList({
    super.key,
    required this.caption,
    required this.value,
    this.space,
    this.listType = ListType.leftRight,
  });

  final Widget caption;
  final Widget value;
  final double? space;
  final ListType listType;

  @override
  Widget build(BuildContext context) {
    if (listType == ListType.leftRight) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: caption),
          SizedBox(width: space ?? context.screenWidthRatio(.5, .6), child: value),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          caption,
          (space ?? 5).height,
          value,
        ],
      );
    }
  }
}
