import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/model/medical_record.dart';
import 'package:dental/utils/datetime_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class MedicalListLayout extends StatelessWidget {
  const MedicalListLayout({
    super.key,
    required this.item,
    this.dark = false,
    this.onTap,
  });

  final MedicalRecord item;
  final bool dark;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: dark ? primaryLight : null,
      child: ListTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.screenWidthRatio(1 / 3, 1 / 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${item.treatment}').bold().clr(dark ? oWhite : null),
                  Text('${item.date?.custom('d MMM yyyy')}').clr(dark ? oWhite : null),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Dokter').bold().clr(dark ? oWhite : null),
                  Text('${item.doctor}').clr(dark ? oWhite : null),
                ],
              ),
            ),
          ],
        ),
        trailing: const Text('detail').tsBodyL().clr(dark ? oWhite : null),
        onTap: onTap,
      ),
    );
  }
}
