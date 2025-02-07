import 'package:dental/common/widgets/custom_avatar.dart';
import 'package:dental/common/widgets/custom_input.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/user/controller/profile_ctrl.dart';
import 'package:dental/features/user/views/home/widgets/menu_layout.dart';
import 'package:dental/features/user/views/home/widgets/carousel_page.dart';
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
    final profile = ref.watch(profileProvider);

    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight + 20,
          backgroundColor: primaryLight,
          leadingWidth: 90,
          leading: Center(child: CustomAvatar(image: profile?.photo)),
          title: Text("Hi, ${profile?.fullName}").clr(oWhite),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(SuperIcons.cl_bell_line, color: oWhite),
            ),
            10.width,
          ],
        ),
        backgroundColor: Colors.transparent,
        body: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Container(
            color: oWhite,
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
                      autoLabel: false,
                    ),
                  ),
                  20.height,
                  // Carousel image
                  const CarouselPage(),
                  20.height,
                  // App Menu
                  const MenuLayout(),
                  // Bottom
                  60.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
