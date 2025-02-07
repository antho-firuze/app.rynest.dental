import 'package:dental/common/widgets/custom_avatar.dart';
import 'package:dental/common/widgets/custom_icon.dart';
import 'package:dental/common/widgets/custom_rating_star.dart';
import 'package:dental/common/widgets/forms/field_list.dart';
import 'package:dental/common/widgets/skelton.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/doctor_ctrl.dart';
import 'package:dental/features/product/controller/schedule_ctrl.dart';
import 'package:dental/features/product/model/doctor.dart';
import 'package:dental/features/product/views/doctor/doctor_reviews_view.dart';
import 'package:dental/utils/datetime_utils.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class NurseDetailView extends ConsumerWidget {
  const NurseDetailView(this.item, {super.key});

  final Doctor item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: Text('Detail Staff & Perawat'), centerTitle: true),
          body: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {},
                child: ListView(
                  children: [
                    // BODY
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Card(
                        child: ListTile(
                          leading: CustomAvatar(image: item.photo, shape: BoxShape.rectangle, size: 60),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${item.name}').bold(),
                              CustomRatingStar(rating: item.rating!, type: RatingType.type2),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${item.countExperience} years exp').tsButton(),
                              5.height,
                              divider(),
                              15.height,
                              Row(
                                children: [
                                  Text('Ketersediaan Hari ini : ').tsLabelL().bold(),
                                  10.width,
                                  Text('Tersedia').tsLabelL().bold().clr(oGreen),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    20.height,
                    // 4 ISLAND POINT
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CustomIcon(
                                SuperIcons.mg_group_fill,
                                size: 50,
                                iconRatio: .5,
                                backgroundColor: oBlue70,
                                onPressed: () {},
                              ),
                              5.height,
                              Text('+1000\nPasien').tsCaption().center(),
                            ],
                          ),
                          Column(
                            children: [
                              CustomIcon(
                                SuperIcons.is_award_bold,
                                size: 50,
                                iconRatio: .5,
                                backgroundColor: oBlue70,
                                onPressed: () {},
                              ),
                              5.height,
                              Text('10 Tahun\nPengalaman').tsCaption().center(),
                            ],
                          ),
                          Column(
                            children: [
                              CustomIcon(
                                SuperIcons.mg_comment_fill,
                                size: 50,
                                iconRatio: .5,
                                backgroundColor: oBlue70,
                                onPressed: () {},
                              ),
                              5.height,
                              Text('1000+\nReview').tsCaption().center(),
                            ],
                          ),
                          Column(
                            children: [
                              CustomIcon(
                                SuperIcons.bs_star_fill,
                                size: 50,
                                iconRatio: .5,
                                backgroundColor: oBlue70,
                                onPressed: () {},
                              ),
                              5.height,
                              Text('5\nRating').tsCaption().center(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    // PROFILE & SCHEDULE
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          FieldList(
                            listType: ListType.topBottom,
                            caption: Text('Profil Singkat').bold(),
                            value: Text('${item.shortProfile}').justify(),
                          ),
                          FieldList(
                            listType: ListType.topBottom,
                            caption: Text('Jadwal').bold(),
                            value: Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (item.schedules != null) ...[
                                  ...List.generate(
                                    item.schedules!.length,
                                    (index) {
                                      final schedule = item.schedules![index];
                                      final day = DateTime.now().weekdayName(schedule.weekday);
                                      final times = schedule.time?.map((idx) {
                                        final timeIdx = TimeIndex.values[idx];
                                        // final descIdx = timeIdx.desc;
                                        return '${DateTime.now().timeFormat(hour: timeIdx.time, format: 'hh:mm')} ${timeIdx.desc} s/d selesai';
                                      }).join("\n");
                                      return FieldList(
                                        space: context.screenWidthRatio(.75, .85),
                                        caption: Text(day),
                                        value: Text('$times').family('Roboto'),
                                      );
                                    },
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    // REVIEWS
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ref.watch(fetchDoctorReviewProvider).when(
                            data: (data) {
                              if (data == null || data.isEmpty) {
                                return Text('Tidak ada review');
                              }

                              final minItems = data.length > 3 ? 3 : data.length;
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: FieldList(
                                      caption: Text('Reviews').bold(),
                                      value: data.length < 3
                                          ? Container()
                                          : Text('Lihat Semua').tsCaption().right().link(
                                                onTap: () => context.goto(page: DoctorReviewsView(item)),
                                              ),
                                    ),
                                  ),
                                  10.height,
                                  ListView.separated(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemBuilder: (context, index) {
                                      final review = data[index];
                                      return Card(
                                        color: oWhite,
                                        child: ListTile(
                                          isThreeLine: true,
                                          leading: CustomAvatar(image: review.avatar),
                                          title: Text('${review.name}').bold(),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRatingStar(rating: review.rating!),
                                                  10.width,
                                                  Text('${review.rating}'),
                                                ],
                                              ),
                                              5.height,
                                              Text('"${review.comment}"').italic,
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) => 10.height,
                                    itemCount: minItems,
                                  ),
                                ],
                              );
                            },
                            error: (error, stackTrace) => Container(),
                            loading: () => Column(
                              spacing: 10,
                              children: List.generate(3, (index) => Skelton(radius: 8, height: 60)),
                            ),
                          ),
                    ),
                    20.height,
                    60.height,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
