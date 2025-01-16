import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  const GroupList({
    super.key,
    this.header,
    this.showDividerTop = true,
    this.showDividerBottom = false,
    this.children,
    this.onTap,
    this.trailing,
  });

  final bool showDividerTop;
  final bool showDividerBottom;
  final Widget? header;
  final IconData? trailing;
  final List<Widget>? children;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showDividerTop) divider(),
        if (header != null) header!,
        if (showDividerBottom) divider(),
        if (children != null) ...children!,
      ],
    );
  }
}
