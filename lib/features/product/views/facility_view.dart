import 'package:dental/common/widgets/custom_image.dart';
import 'package:dental/common/widgets/skelton.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/facility_ctrl.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class FacilityView extends ConsumerWidget {
  const FacilityView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      connectivityInfoBottomPadding: kToolbarHeight,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: Text('Fasilitas Klinik'), centerTitle: true),
          body: RefreshIndicator(
            onRefresh: () async => ref.refresh(fetchFacilityProvider),
            child: Scrollbar(
              child: ListView(
                children: [
                  ref.watch(fetchFacilityProvider).when(
                        skipLoadingOnRefresh: false,
                        data: (data) {
                          if (data == null || data.isEmpty) {
                            return Center(child: Text('Data belum tersedia !'));
                          }

                          return ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                final item = data[index];
                                return Card(
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      spacing: 10,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${item.title}').tsTitleL().bold(),
                                        CustomImage(
                                          src: item.image,
                                          borderRadius: 16,
                                        ),
                                        HtmlWidget('${item.content}'),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: data.length);
                        },
                        error: (error, stackTrace) => Container(),
                        loading: () => Card(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              spacing: 20,
                              children: List.generate(3, (index) => Skelton(height: (index + 1) * 20)),
                            ),
                          ),
                        ),
                      ),
                  10.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
