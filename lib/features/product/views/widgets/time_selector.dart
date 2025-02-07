import 'package:dental/common/services/dialog_service.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/schedule_ctrl.dart';
import 'package:dental/utils/datetime_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';

enum TimeFormat { hour24, ampm, custom }

class TimeSelector extends StatefulWidget {
  const TimeSelector({
    super.key,
    this.practiceHour,
    this.selected,
    this.timeFormat = TimeFormat.custom,
    this.onTap,
  });

  final List<int>? practiceHour;
  final int? selected;
  final TimeFormat timeFormat;
  final Function(int index)? onTap;

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  int? selectedIdx;

  @override
  void initState() {
    super.initState();
    selectedIdx = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: widget.timeFormat == TimeFormat.custom ? 1.5 : 2,
      ),
      itemCount: TimeIndex.values.length,
      itemBuilder: (context, index) {
        final item = TimeIndex.values[index];

        final formatTime = widget.timeFormat == TimeFormat.custom
            ? 'hh:mm'
            : widget.timeFormat == TimeFormat.hour24
                ? 'HH:mm'
                : 'hh:mm a';
        // final time = item.time;
        final text = DateTime.now().copyWith(hour: item.time, minute: 0).custom(formatTime);
        final desc = item.desc;
        final isPractice = widget.practiceHour?.contains(index) ?? false;
        final isSelected = selectedIdx == index;
        final isFullBooked = [].contains(index);

        final textColor = isPractice
            ? isFullBooked
                ? oGrey
                : isSelected
                    ? oGold
                    : oWhite
            : oGrey;
        final borderColor = isSelected ? oGold : oGrey;
        final backColor = isPractice ? primaryLight : null;
        return GestureDetector(
          onTap: () {
            if (widget.onTap == null) return;

            if (isPractice == false) {
              DialogService(content: Text('This time is not available !')).showInfo();
              return;
            }
            if (isFullBooked == true) {
              DialogService(content: Text('This time is Full Booked !')).showInfo();
              return;
            }
            setState(() {
              selectedIdx = selectedIdx == index ? null : index;
              if (widget.onTap != null && selectedIdx != null) widget.onTap!(index);
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: backColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text).clr(textColor).bold(),
                if (widget.timeFormat == TimeFormat.custom) ...[
                  Text(desc).clr(textColor).bold(),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
