import 'dart:convert';
import 'dart:typed_data';

import 'package:dental/common/widgets/custom_icon.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.src,
    this.fit = BoxFit.cover,
    this.color,
    this.borderRadius = 0,
    this.errorWidget,
    this.errorTitle = "Foto belum tersedia !",
    this.onTap,
  });

  final dynamic src;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  final String errorTitle;
  final Widget? errorWidget;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    if (src == null) {
      return ImageFailed(title: errorTitle);
    }

    Widget image = Container();
    if (src is String) {
      var type = src.substring(0, 4).toLowerCase();
      if (type == 'http') {
        image = imageNetwork();
      } else {
        type = src.substring(0, 6).toLowerCase();
        if (type == 'assets') {
          image = imageAsset();
        } else {
          image = imageEncoder();
        }
      }
    } else {
      image = imageFile();
    }

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: image,
      ),
    );
  }

  Widget imageNetwork() => Image.network(
        src,
        color: color,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
            ? child
            : Padding(
                padding: const EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              ),
        errorBuilder: (context, error, stackTrace) =>
            errorWidget != null ? errorWidget! : ImageFailed(title: errorTitle),
      );

  Widget imageFile() => Image.file(src, color: color, fit: fit);

  Widget imageAsset() => Image.asset(
        src,
        color: color,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => ImageFailed(title: errorTitle),
      );

  Widget imageEncoder() {
    Uint8List bytes = base64.decode(src);
    return Image.memory(bytes, fit: fit);
  }
}

class ImageFailed extends StatelessWidget {
  const ImageFailed({
    super.key,
    this.title = "Image does not exist",
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomIcon(SuperIcons.is_warning_2_outline, size: 50),
        Text(title).clr(oGrey70).center(),
      ],
    );
  }
}
