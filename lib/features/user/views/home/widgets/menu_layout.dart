import 'package:dental/features/auth/controller/auth_ctrl.dart';
import 'package:dental/features/user/controller/menu_ctrl.dart';
import 'package:dental/features/user/views/home/widgets/menu_button.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuLayout extends ConsumerWidget {
  const MenuLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authUserProvider);
    final appMenus = ref.read(menuCtrlProvider).getHomeAppMenus();

    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3.whenLandscape(6)!.toInt(),
        crossAxisSpacing: 0,
        mainAxisSpacing: 10,
        mainAxisExtent: 120,
      ),
      itemCount: appMenus.length,
      itemBuilder: (context, index) {
        final item = appMenus[index];
        return MenuButton(
          item: item,
          iconPath: "assets/icons/menu/${item.image}",
          onTap: () async => await ref.read(menuCtrlProvider).goto(item.code),
        );
      },
    );
  }
}
