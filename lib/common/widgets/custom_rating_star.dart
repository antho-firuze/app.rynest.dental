import 'package:dental/core/app_color.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class CustomRatingStar extends StatelessWidget {
  const CustomRatingStar({
    super.key,
    this.rating = 1,
    this.type = 1,
  });

  final double rating;
  final int type;

  @override
  Widget build(BuildContext context) {
    if (type == 1) return type1();
    return type2();
  }

  Widget type1() {
    return SizedBox(
      height: 15,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Icon(
            SuperIcons.mg_star_fill,
            size: 12,
            color: (index <= (rating - 1)) ? oGold : oGrey70,
          );
        },
        separatorBuilder: (context, index) => 5.width,
        itemCount: 5,
      ),
    );
  }

  Widget type2() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: oBlue70,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(SuperIcons.bs_star_fill, size: 10),
          3.width,
          Text("$rating").bold(),
        ],
      ),
    );
  }
}
