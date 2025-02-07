import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/common/widgets/custom_dialog.dart';
import 'package:dental/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';

enum PressedType { ok, yes, no, close }

class DialogService {
  const DialogService({
    this.leading,
    this.title,
    this.content,
    this.actions,
    this.dismissable = true,
    this.onPressed,
  });
  final Widget? leading;
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final bool dismissable;
  final Function(PressedType type)? onPressed;

  Future<void> show() async => await showAdaptiveDialog(
      context: rootNavigatorKey.currentContext!,
      barrierDismissible: dismissable,
      builder: (context) {
        return PopScope(
          canPop: dismissable,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
          },
          child: CustomDialog(
            leading: leading,
            title: title,
            content: content,
            actions: actions,
          ),
        );
      });

  Future<void> showInfo() async => await showAdaptiveDialog(
      context: rootNavigatorKey.currentContext!,
      barrierDismissible: dismissable,
      builder: (context) {
        return PopScope(
          canPop: dismissable,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
          },
          child: CustomDialog(
            leading: leading ?? Icon(SuperIcons.mg_information_line, size: 30),
            title: title ?? Text('Informasi'),
            content: content,
            actions: [
              CustomButton(
                child: Text('OK'),
                onPressed: () {
                  if (onPressed != null) onPressed!(PressedType.ok);
                  context.pop();
                },
              ),
            ],
          ),
        );
      });

  Future<void> showError() async => await showAdaptiveDialog(
      context: rootNavigatorKey.currentContext!,
      barrierDismissible: dismissable,
      builder: (context) {
        return PopScope(
          canPop: dismissable,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
          },
          child: CustomDialog(
            leading: leading ?? Icon(SuperIcons.is_close_circle_outline, size: 30),
            title: title ?? Text('Terjadi Kesalahan'),
            content: content,
            actions: [
              CustomButton(
                child: Text('Close'),
                onPressed: () {
                  if (onPressed != null) onPressed!(PressedType.close);
                  context.pop();
                },
              ),
            ],
          ),
        );
      });

  Future<void> showWarning() async => await showAdaptiveDialog(
      context: rootNavigatorKey.currentContext!,
      barrierDismissible: dismissable,
      builder: (context) {
        return PopScope(
          canPop: dismissable,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
          },
          child: CustomDialog(
            leading: leading ?? Icon(SuperIcons.cl_error_standard_line, size: 30),
            title: title ?? Text('Peringatan'),
            content: content,
            actions: [
              CustomButton(
                child: Text('Close'),
                onPressed: () {
                  if (onPressed != null) onPressed!(PressedType.close);
                  context.pop();
                },
              ),
            ],
          ),
        );
      });

  Future<void> showConfirm() async => await showAdaptiveDialog(
      context: rootNavigatorKey.currentContext!,
      barrierDismissible: dismissable,
      builder: (context) {
        return PopScope(
          canPop: dismissable,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
          },
          child: CustomDialog(
            leading: leading,
            title: title,
            content: content,
            actions: [
              CustomButton(
                child: Text('No'),
                onPressed: () {
                  if (onPressed != null) onPressed!(PressedType.no);
                  context.pop();
                },
              ),
              CustomButton(
                child: Text('Yes'),
                onPressed: () {
                  if (onPressed != null) onPressed!(PressedType.yes);
                  context.pop();
                },
              ),
            ],
          ),
        );
      });
}
