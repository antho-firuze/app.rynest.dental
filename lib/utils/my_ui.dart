import 'package:dental/common/widgets/connectivity_wrapper.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/utils/system_ui_overlay.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyUI extends StatelessWidget {
  const MyUI({
    super.key,
    this.decoration,
    required this.child,
    this.isDark = false,
    this.enabledSafeArea = true,
    this.customUiOverlayStyle,
    this.isTransparent = false,
    this.showScreenInfo = false,
    this.showConnectivityInfo = true,
    this.customStatusBarBackground,
    this.customAppBarBackground,
    this.customBackground,
    this.connectivityInfoBottomPadding = 0,
  });

  final Decoration? decoration;
  final Widget child;
  final bool isDark;
  final bool enabledSafeArea;
  final SystemUiOverlayStyle? customUiOverlayStyle;
  final bool isTransparent;
  final bool showScreenInfo;
  final bool showConnectivityInfo;
  final Widget? customStatusBarBackground;
  final Widget? customAppBarBackground;
  final Widget? customBackground;
  final double connectivityInfoBottomPadding;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: customUiOverlayStyle ?? (isDark ? SystemUIOverlay.darkColorOverlay : SystemUIOverlay.lightColorOverlay),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(.8)),
        child: ConnectivityWrapper(
          bottomPadding: connectivityInfoBottomPadding,
          enabled: showConnectivityInfo,
          child: Stack(
            children: [
              // BACKGROUND
              if (customBackground != null) customBackground! else Container(color: primaryLight),
              // STATUS BAR
              if (customStatusBarBackground != null)
                SizedBox(
                  width: context.screenWidth,
                  height: MediaQuery.of(context).viewPadding.top,
                  child: customStatusBarBackground!,
                )
              else
                Container(height: MediaQuery.of(context).viewPadding.top, color: primaryLight),
              // APP BAR
              if (customAppBarBackground != null)
                SizedBox(
                  width: context.screenWidth,
                  height: MediaQuery.of(context).viewPadding.top + kToolbarHeight,
                  child: customAppBarBackground!,
                ),
              SafeArea(
                top: enabledSafeArea,
                bottom: false,
                child: child,
              ),
              // Container(
              //   decoration: decoration ?? BoxDecoration(color: isTransparent ? Colors.transparent : primaryLight),
              //   child: SafeArea(
              //     top: enabledSafeArea,
              //     bottom: false,
              //     child: child,
              //   ),
              // ),
              if (showScreenInfo)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      10.width,
                      Text("width | ${context.screenWidth.round()}"),
                      10.width,
                      Text("height | ${context.screenHeight.round()}"),
                      10.width,
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
