import 'package:dental/core/app_asset.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:flutter/material.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  static const routeName = '/appointment';

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: const Text('Appointment'), titleSpacing: 30),
          body: RefreshIndicator(
            onRefresh: () async {},
            child: ListView(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
