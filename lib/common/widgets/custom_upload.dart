import 'package:dental/common/widgets/dashed_border.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

enum UploadType { file, image }

class CustomUpload extends StatelessWidget {
  const CustomUpload({
    super.key,
    this.hintText,
    this.desc = 'Tap here for upload your file !',
    this.type = UploadType.file,
    this.onTap,
  });

  final String? hintText;
  final String desc;
  final UploadType type;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hintText != null) Text(hintText!).tsBodyL(),
        10.height,
        Container(
          height: 60,
          decoration: BoxDecoration(
            border: DashedBorder.all(dashLength: 10, color: oGrey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Icon(SuperIcons.bs_upload, color: oGrey),
            title: Text(desc).tsLabelL().clr(oGrey),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
