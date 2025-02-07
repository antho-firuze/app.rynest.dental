import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/common/widgets/custom_avatar.dart';
import 'package:dental/common/widgets/custom_rating_star.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/model/doctor.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class SelectDoctorLayout extends StatelessWidget {
  const SelectDoctorLayout({
    super.key,
    required this.item,
    this.onSelected,
  });

  final Doctor item;
  final Function()? onSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CustomAvatar(image: item.photo),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${item.name}').bold(),
                CustomRatingStar(rating: item.rating!, type: RatingType.type2),
              ],
            ),
            subtitle: Text('${item.countExperience} years exp').tsButton(),
            onTap: onSelected,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              onPressed: onSelected,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Buat Janji Temu'),
                  10.width,
                  Icon(SuperIcons.mg_right_line, color: onSelected == null ? oGrey : oWhite),
                ],
              ),
            ),
          ),
          10.height,
        ],
      ),
    );
  }
}

enum WeekDayInd {
  sen(1, 'Sen'),
  sel(2, 'Sel'),
  rab(3, 'Rab'),
  kam(4, 'Kam'),
  jum(5, 'Jum'),
  sab(6, 'Sab'),
  min(7, 'Min'),
  ;

  const WeekDayInd(
    this.id,
    this.code,
  );

  final int id;
  final String code;
}
