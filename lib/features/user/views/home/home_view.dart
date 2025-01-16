import 'package:dental/common/widgets/custom_avatar.dart';
import 'package:dental/common/widgets/custom_input.dart';
import 'package:dental/core/app_asset.dart';
import 'package:dental/features/user/views/home/widgets/menu_list.dart';
import 'package:dental/features/user/views/home/widgets/carousel_page.dart';
import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:super_icons/super_icons.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 90,
          leading: const CustomAvatar(
            width: 40,
            height: 40,
          ),
          title: Text("Hi, Alexis Anderson".hardcoded),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(SuperIcons.cl_bell_line),
            ),
            10.width,
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(AppAsset.imPattern),
                  repeat: ImageRepeat.repeat,
                  opacity: .2,
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: RefreshIndicator(
                onRefresh: () async {},
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    25.height,
                    // Search
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomInput(
                        prefixIcon: Icon(SuperIcons.lc_search),
                        hintText: "Search",
                      ),
                    ),
                    20.height,
                    // Carousel image
                    const CarouselPage(),
                    20.height,
                    // App Menu
                    const MenuList(),
                    // Bottom
                    60.height,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
