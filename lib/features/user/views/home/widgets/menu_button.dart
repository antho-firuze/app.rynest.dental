import 'package:dental/common/widgets/custom_ink_well.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/user/controller/menu_ctrl.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuButton extends ConsumerWidget {
  const MenuButton({
    super.key,
    required this.item,
    required this.iconPath,
    this.count = 0,
    this.onTap,
    this.color,
  });

  final String iconPath;
  final AppMenu item;
  final int count;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const size = 70.0;
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: size + 50,
            child: Card(
              child: CustomInkWell(
                radius: 13,
                onTap: onTap,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(iconPath, color: color, height: size - 25, width: size - 25),
                    ),
                    2.height,
                    Text(item.name, softWrap: true).center().family("Roboto").size(14).bold(),
                  ],
                ),
              ),
            ),
          ),
          if (count > 0)
            Positioned(
              right: 3,
              top: 0,
              child: Container(
                width: 25,
                height: 25,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: oRed, shape: BoxShape.circle),
                child: Center(child: Text('$count').clr(oWhite)),
              ),
            ),
        ],
      ),
    );
  }
}
