import 'package:dental/core/app_asset.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  static const routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('History'), titleSpacing: 30),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(AppAsset.imPattern),
              repeat: ImageRepeat.repeat,
              opacity: .2,
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
