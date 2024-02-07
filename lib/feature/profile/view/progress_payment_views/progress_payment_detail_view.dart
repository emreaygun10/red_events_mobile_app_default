import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_list_tile.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProgressPaymentDetailView extends StatefulWidget {
  const ProgressPaymentDetailView({
    required this.appBarTitle,
    super.key,
  });

  /// TODO: İtiraz sebeplerine göre buraya enum ile state verilerini kontrol edip basabiliriz
  final String appBarTitle;
  @override
  State<ProgressPaymentDetailView> createState() =>
      _ProgressPaymentDetailViewState();
}

class _ProgressPaymentDetailViewState
    extends BaseState<ProgressPaymentDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.neutral100,
      appBar: buildAppBar(
        widget.appBarTitle,
      ),
      body: Padding(
        padding: const ProjectPadding.scaffold().copyWith(top: 12, bottom: 12),
        child: Container(
          padding: const ProjectPadding.allNormal().copyWith(
            right: 16,
            left: 16,
          ),
          width: context.sized.width,
          decoration: BoxDecoration(
            color: ColorName.neutral0,
            border: Border.all(
              color: ColorName.neutral100,
              width: 2,
            ),
            borderRadius: ProjectBorderRadius.allCircleMedium(),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AutoSizeText(
                  LocaleKeys.profile_progress_payment_sum_summary.tr(),
                  style: textTheme.titleSmall!
                      .copyWith(color: ColorName.neutral500),
                ),
                AutoSizeText(
                  '900,00 TL',
                  style: textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  padding: const ProjectPadding.allSmall(),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorName.neutral200,
                      width: 3,
                    ),
                    borderRadius: ProjectBorderRadius.allCircleMedium(),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            LocaleKeys.profile_progress_payment_daily_detail
                                .tr(),
                            style: textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          AutoSizeText(
                            '26 Gün 4 saat',
                            style: textTheme.titleSmall!
                                .copyWith(color: ColorName.neutral500),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 3,
                        color: ColorName.neutral200,
                      ),
                      Container(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 50,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomListTile(
                              textTheme: textTheme,
                              date: '1 Kasım',
                              hours: '07:00 - 17:00',
                              chipColor: ColorName.greenLight,
                              chipText: 'Maaş',
                              company: 'Manzara Restaurant',
                              currency: '500,00 TL',
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Padding(
                              padding: ProjectPadding.symmetricSmallH(),
                              child: Divider(
                                height: 3,
                                color: ColorName.neutral200,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(String title) {
    return AppBar(
      backgroundColor: ColorName.neutral100,
      surfaceTintColor: Colors.transparent,
      title: AutoSizeText(
        title.tr(),
      ),
      centerTitle: true,
    );
  }
}
