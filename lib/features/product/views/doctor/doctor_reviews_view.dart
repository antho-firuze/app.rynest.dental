import 'package:dental/common/widgets/custom_avatar.dart';
import 'package:dental/common/widgets/custom_rating_star.dart';
import 'package:dental/common/widgets/skelton.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/doctor_ctrl.dart';
import 'package:dental/features/product/model/doctor.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctorReviewsView extends ConsumerWidget {
  const DoctorReviewsView(this.item, {super.key});

  final Doctor item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: Text('Review Dokter'), centerTitle: true),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ref.watch(fetchDoctorReviewProvider).when(
                            data: (data) {
                              if (data == null || data.isEmpty) {
                                return Text('Tidak ada review');
                              }

                              return Column(
                                children: [
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
                                    itemCount: data.length,
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
