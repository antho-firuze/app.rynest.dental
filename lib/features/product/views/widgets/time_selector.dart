import 'package:dental/core/app_color.dart';
import 'package:dental/features/auth/views/code_verify_view.dart';
import 'package:dental/features/product/controller/product_ctrl.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeSelector extends ConsumerWidget {
  const TimeSelector({
    super.key,
    required this.practiceHour,
    required this.selected,
    this.onTap,
  });

  final List<int> practiceHour;
  final List<int> selected;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickers = ref.read(productCtrlProvider).timePicker;

    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemCount: pickers.length,
      itemBuilder: (context, index) {
        final time = pickers[index]['time'];
        final text = pickers[index]['text'];
        final desc = pickers[index]['desc'];
        final avail = practiceHour.contains(time);
        final selec = selected.contains(time);
        return GestureDetector(
          // onTap: () {
          //   selected.add(time);
          //   ref.read(selectedScheduleProvider.notifier).state = selected;
          // },
          child: Container(
            decoration: BoxDecoration(
              color: avail
                  ? selec
                      ? primaryLight
                      : null
                  : oGrey,
              border: Border.all(color: oGrey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$text").clr(selec ? oWhite : null).bold(),
                Text("$desc").clr(selec ? oWhite : null).bold(),
              ],
            ),
          ),
        );
      },
    );
    // return GestureDetector(
    //   onTap: () => onTap!(time),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: available ? null : oGrey,
    //       border: Border.all(color: oGrey),
    //       borderRadius: BorderRadius.circular(8),
    //     ),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text("${times[index]['text']}"),
    //         Text("${times[index]['desc']}"),
    //       ],
    //     ),
    //   ),
    // );
  }
}
