import 'package:dental/core/app_color.dart';
import 'package:dental/features/tele-dentistry/model/chat.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class ChatLayout extends StatelessWidget {
  const ChatLayout({
    super.key,
    required this.item,
  });

  final Chat item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: EdgeInsets.only(left: item.itsMe ? 0 : 40, right: item.itsMe ? 40 : 0),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: item.itsMe ? primaryLight : oWhite,
            border: item.itsMe ? null : Border.all(color: primaryLight),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('${item.message}').clr(item.itsMe ? oWhite : primaryLight),
        ),
      ),
    );
  }
}
