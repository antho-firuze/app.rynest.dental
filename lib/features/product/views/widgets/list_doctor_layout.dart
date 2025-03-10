import 'package:dental/common/widgets/custom_avatar.dart';
import 'package:dental/common/widgets/custom_rating_star.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/model/doctor.dart';
import 'package:dental/features/product/views/widgets/time_selector.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class ListDoctorLayout extends StatelessWidget {
  const ListDoctorLayout({
    super.key,
    required this.item,
    this.onSelected,
  });

  final Doctor item;
  final Function()? onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CustomAvatar(image: item.photo),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${item.name}').bold(),
                  CustomRatingStar(rating: item.rating!, type: RatingType.type2),
                ],
              ),
              subtitle: Text('${item.countExperience} years exp').tsButton(),
              onTap: onSelected,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Jadwal Praktek :').tsLabelL().bold(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Card(
                color: oWhite,
                child: DefaultTabController(
                  key: Key('key_${item.id}'),
                  length: WeekDayInd.values.length,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        labelColor: primaryLight,
                        labelStyle: ts.bold(),
                        unselectedLabelColor: oGrey,
                        indicatorColor: Colors.transparent,
                        tabs: [
                          ...List.generate(
                              WeekDayInd.values.length, (index) => Tab(text: WeekDayInd.values[index].code))
                        ],
                      ),
                      SizedBox(
                        height: 115,
                        child: TabBarView(
                          children: [
                            ...List.generate(
                              WeekDayInd.values.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(10),
                                child: TimeSelector(
                                  timeFormat: TimeFormat.hour24,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: CustomButton(
            //     onPressed: onSelected,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         const Text('Lihat Detail'),
            //         10.width,
            //         Icon(SuperIcons.mg_right_line, color: onSelected == null ? oGrey : oWhite),
            //       ],
            //     ),
            //   ),
            // ),
            5.height,
          ],
        ),
      ),
    );
  }
}

enum WeekDayInd {
  sen(1, 'Sen'),
  sel(2, 'Sel'),
  rab(3, 'Rab'),
  kam(4, 'Kam'),
  jum(5, 'Jum'),
  sab(6, 'Sab'),
  min(7, 'Min'),
  ;

  const WeekDayInd(
    this.id,
    this.code,
  );

  final int id;
  final String code;
}
