import 'package:dental/features/user/controller/menu_ctrl.dart';
import 'package:dental/features/user/views/home/widgets/menu_button.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MenuView extends ConsumerWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appMenus = ref.read(menuCtrlProvider).getAllAppMenus();
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Semua Menu')),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            16.height,
            StaggeredGrid.count(
              crossAxisCount: 4.whenLandscape(8)!.toInt(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(
                appMenus.length,
                (index) {
                  final item = appMenus[index];
                  return MenuButton(
                    item: item,
                    iconPath: ref.read(menuCtrlProvider).getIconPath(item.code),
                    onTap: () async => await ref.read(menuCtrlProvider).goto(item.code),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
