import 'package:dental/common/controllers/network_ctrl.dart';
import 'package:dental/common/widgets/overlay_container.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityWrapper extends ConsumerWidget {
  const ConnectivityWrapper({
    super.key,
    this.enabled = true,
    this.caption = 'Koneksi internet anda terganggu !',
    this.child,
    this.bottomPadding = 0,
  });

  final bool enabled;
  final Widget? child;
  final String caption;
  final double bottomPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShowOverlay = ref.watch(isConnectedProvider) == false;

    if (!enabled) {
      isShowOverlay = false;
    }

    return Scaffold(
      body: Stack(
        children: [
          child ?? const SizedBox(),
          Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OverlayContainer(
                  isShowOverlay: isShowOverlay,
                  backgroundColor: oRed.withOpacity(.8),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.wifi_off, color: oWhite),
                        10.width,
                        Text(caption).clr(oWhite),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
