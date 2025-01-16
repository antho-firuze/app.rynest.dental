import 'package:dental/common/exceptions/data_failed.dart';
import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmptyMessage extends ConsumerWidget {
  const EmptyMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.whenLandscape(0)!),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image
              DataFailed(
                message: 'Tidak ada pesan saat ini !'.hardcoded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
