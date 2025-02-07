import 'package:dental/common/widgets/custom_avatar.dart';
import 'package:dental/common/widgets/custom_rating_star.dart';
import 'package:dental/features/product/model/doctor.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class ListNurseLayout extends StatelessWidget {
  const ListNurseLayout({
    super.key,
    required this.item,
    this.onSelected,
  });

  final Doctor item;
  final Function()? onSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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
    );
  }
}
