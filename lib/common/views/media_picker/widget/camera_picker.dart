import 'dart:io';

import 'package:dental/common/controllers/camera_ctrl.dart';
import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/common/widgets/button/custom_iconbutton.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraPicker extends ConsumerWidget {
  const CameraPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(refreshCameraProvider);

    if (ref.read(cameraCtrlProvider).controller == null) {
      return Center(
        child: CustomButton(
          onPressed: () async => await ref.read(cameraCtrlProvider).getPermission(),
          child: const Text('Refresh'),
        ),
      );
    }

    if (ref.read(cameraCtrlProvider).controller?.value.isInitialized == false) {
      return const Center(child: CircularProgressIndicator());
    }

    if (ref.read(cameraCtrlProvider).cameras.isEmpty) {
      return Center(child: const Text('No Camera Available !').tsHeadlineS());
    }

    return Stack(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRect(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: ref.read(cameraCtrlProvider).controller?.value.previewSize?.height,
                        height: ref.read(cameraCtrlProvider).controller?.value.previewSize?.width,
                        child: CameraPreview(ref.read(cameraCtrlProvider).controller!),
                      ),
                    ),
                  ),
                ),
                flashButton(),
                captureButton(),
                switchButton(),
                if (ref.watch(cameraFileProvider) != null) preview(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  preview() {
    return Consumer(
      builder: (context, ref, child) {
        return Stack(
          children: [
            Center(
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: ref.read(cameraCtrlProvider).controller?.value.previewSize?.height,
                          height: ref.read(cameraCtrlProvider).controller?.value.previewSize?.width,
                          child: Image.file(
                            File(ref.read(cameraFileProvider)!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomIconButton(
                              padding: const EdgeInsets.all(4),
                              icon: const Icon(Icons.save, color: oWhite, size: 35),
                              onPressed: () async => await ref.read(cameraCtrlProvider).save(),
                            ),
                            CustomIconButton(
                              padding: const EdgeInsets.all(4),
                              icon: const Icon(Icons.close, color: oWhite, size: 35),
                              onPressed: () {
                                ref.read(cameraFileProvider.notifier).state = null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  flashButton() {
    return Consumer(
      builder: (context, ref, child) {
        if (ref.read(cameraLensProvider.notifier).state == CameraLensDirection.front) {
          return Container();
        }
        return Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            child: CustomIconButton(
              padding: const EdgeInsets.all(4),
              tooltip: 'Mode Flash'.hardcoded,
              icon: Icon(
                ref.watch(flashIconProvider),
                size: 35,
                color: oWhite,
              ),
              onPressed: () async => ref.read(cameraCtrlProvider).flashMode(),
            ),
          ),
        );
      },
    );
  }

  captureButton() {
    return Consumer(
      builder: (context, ref, child) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomIconButton(
              tooltip: 'Ambil Gambar'.hardcoded,
              icon: const Icon(Icons.camera, size: 50, color: oWhite),
              onPressed: () async => await ref.read(cameraCtrlProvider).capture(),
            ),
          ),
        );
      },
    );
  }

  switchButton() {
    return Consumer(
      builder: (context, ref, child) {
        return Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: CustomIconButton(
              padding: const EdgeInsets.all(4),
              tooltip: 'Ganti Kamera'.hardcoded,
              icon: const Icon(
                Icons.cameraswitch,
                size: 35,
                color: oWhite,
              ),
              onPressed: () async => ref.read(cameraCtrlProvider).switchCamera(),
            ),
          ),
        );
      },
    );
  }
}

class CardClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, size.height / 5, size.width, size.height / 2 + 60),
          const Radius.circular(0),
        ),
      );
    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}
