import 'package:dental/features/auth/controller/auth_ctrl.dart';
import 'package:dental/features/product/views/treatment_view.dart';
import 'package:dental/features/user/model/app_menu.dart';
import 'package:dental/core/app_asset.dart';
import 'package:dental/features/user/service/menu_service.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuCtrl {
  Ref ref;
  MenuCtrl(this.ref);

  List<AppMenu> getHomeAppMenus() {
    List<Map<String, Object>> appMenusJson = ref.read(menuServiceProvider).getAppMenus();
    List<AppMenu> appMenus = appMenusJson.map(AppMenu.fromJson).toList();

    // NOT SIGNIN
    // if (ref.read(authUserProvider) == null) {
    //   final homeMenuList = ["quran", "prayers", "jelajah", "prayerTimes"];
    //   appMenus.removeWhere((element) => !homeMenuList.contains(element.code));
    //   return appMenus;
    // }

    // AFTER SIGNIN
    // appMenus = _filterMenuByRole(appMenus);

    // FILTER WHERE DEFAULT == TRUE
    appMenus.removeWhere((element) => element.isDefault == false);

    return appMenus;
  }

  List<AppMenu> getAllAppMenus() {
    final appMenusJson = ref.read(menuServiceProvider).getAppMenus();
    List<AppMenu> appMenus = appMenusJson.map(AppMenu.fromJson).toList();

    // NOT SIGNIN
    // if (ref.read(authUserProvider) == null) {
    //   final homeMenuList = ["quran", "prayers", "jelajah", "prayerTimes", "exchangeRate", "qibla"];
    //   appMenus.removeWhere((element) => !homeMenuList.contains(element.code));
    //   return appMenus;
    // }

    // AFTER SIGNIN
    // appMenus = _filterMenuByRole(appMenus);

    // FILTER WHERE SHOW == TRUE
    // appMenus.where((element) => element.isShow == true).toList();

    return appMenus;
  }

  List<AppMenu> _filterMenuByRole(List<AppMenu> menus) {
    // Role 1 => Jama'ah
    // if (ref.read(authUserProvider)?.roleId == 1) {
    //   menus.removeWhere((element) => element.code == 'liveLocation');
    //   menus.removeWhere((element) => element.code == 'presenter');
    //   menus.removeWhere((element) => element.code == 'agenda');
    // }
    // Role 2 => Muthowwif
    // if (ref.read(authUserProvider)?.roleId == 2) {
    //   menus.removeWhere((element) => element.code == 'listener');
    // }
    return menus;
  }

  String getIconPath(String code) {
    return switch (code) {
      "treatment" => 'assets/icons/menu/ic-treatment.png',
      "appointment" => 'assets/icons/menu/ic-appointment.png',
      "records" => 'assets/icons/menu/ic-records.png',
      "doctor" => 'assets/icons/menu/ic-doctor.png',
      "tele_dentistry" => 'assets/icons/menu/ic-tele_dentistry.png',
      "facility" => 'assets/icons/menu/ic-facility.png',
      "nurse" => 'assets/icons/menu/ic-nurse.png',
      "history" => 'assets/icons/menu/ic-history.png',
      "setting" => 'assets/icons/menu/ic-setting.png',
      String() => '',
    };
  }

  Future goto(String code) async {
    return switch (code) {
      "treatment" => await ref.read(pageUtilsProvider).goto(page: const TreatmentView()),
      "appointment" => await ref.read(pageUtilsProvider).goto(page: const TreatmentView()),
      "records" => await ref.read(pageUtilsProvider).goto(page: const TreatmentView()),
      "doctor" => await ref.read(pageUtilsProvider).goto(page: const TreatmentView()),
      "tele_dentistry" => await ref.read(pageUtilsProvider).goto(page: const TreatmentView()),
      "facility" => await ref.read(pageUtilsProvider).goto(page: const TreatmentView()),
      "nurse" => await ref.read(pageUtilsProvider).goto(page: const TreatmentView()),
      "history" => await ref.read(pageUtilsProvider).goto(page: const TreatmentView()),
      "setting" => await ref.read(pageUtilsProvider).goto(page: const TreatmentView()),
      String() => '',
    };
  }
}

final menuCtrlProvider = Provider(MenuCtrl.new);
