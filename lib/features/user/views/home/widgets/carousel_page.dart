import 'package:dental/common/exceptions/image_failed.dart';
import 'package:dental/common/exceptions/loading_failed.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/user/controller/carousel_ctrl.dart';
import 'package:dental/utils/orientation_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselPage extends ConsumerWidget {
  const CarouselPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchCarouselProvider).when(
          skipLoadingOnRefresh: false,
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) {
            debugPrint(error.toString());
            return LoadingFailed(onTap: () => ref.refresh(fetchCarouselProvider));
          },
          data: (data) {
            if (data == null || data.isEmpty) return ImageFailed(onTap: () => ref.refresh(fetchCarouselProvider));

            return SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CarouselSlider(
                      carouselController: homeCarouselController,
                      options: CarouselOptions(
                        height: 230,
                        autoPlay: true,
                      ),
                      items: List.generate(data.length, (index) {
                        final item = data[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Colors.transparent,
                              child: Image.asset(
                                item.image,
                                fit: context.isLandscape() ? BoxFit.fitWidth : BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FutureBuilder(
                      future: homeCarouselController.onReady,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done ||
                            homeCarouselController.state!.pageController != null) {
                          return SmoothPageIndicator(
                            controller: homeCarouselController.state!.pageController!,
                            count: homeCarouselController.state!.itemCount!,
                            onDotClicked: (index) => homeCarouselController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            ),
                            effect: const SlideEffect(
                              activeDotColor: oWhite,
                              dotColor: oGrey70,
                              dotWidth: 8,
                              dotHeight: 8,
                              type: SlideType.slideUnder,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }
}
