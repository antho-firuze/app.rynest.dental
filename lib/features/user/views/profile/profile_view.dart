import 'package:dental/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: const Text('Profile'), titleSpacing: 30),
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
