import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_missing_document_item.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_header.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_documents_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/mixin/profile_documents_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_documents_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/documents_chip_enum.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfileDocumentsView extends StatefulWidget {
  const ProfileDocumentsView({super.key});

  @override
  State<ProfileDocumentsView> createState() => _DocumentsViewState();
}

class _DocumentsViewState extends BaseState<ProfileDocumentsView>
    with ProfileDocumentsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocProvider(
        create: (context) => profileDocumentsBloc,
        child: Column(
          children: [
            CustomProfileHeader(
              columnList: [
                const SizedBox(
                  height: 16,
                ),
                buildTitleText(),
                buildChipList(),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            buildListView(),
          ],
        ),
      ),
    );
  }

  Expanded buildListView() {
    return Expanded(
      child: BlocBuilder<ProfileDocumentsBloc, ProfileDocumentsState>(
        builder: (context, state) {
          return ColoredBox(
            color: ColorName.neutral0,
            child: state.chipIndex == 1
                ? ListView(
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      buildListViewTitle(state),
                      SizedBox(height: 16.h),
                      CustomMissingDocumentItem(
                        title: 'Sağlık Raporu',
                        desc: 'Maks 10 Mb',
                        textTheme: textTheme,
                      ),
                    ],
                  )
                : const SizedBox(),
          );
        },
      ),
    );
  }

  Padding buildListViewTitle(ProfileDocumentsState state) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: AutoSizeText(
        state.chipIndex == 0
            ? LocaleKeys.add_personnel_document_loaded_documents.tr()
            : LocaleKeys.add_personnel_document_missing_documents.tr(),
        style: textTheme.headlineMedium,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: ColorName.neutral0,
      leading: GestureDetector(
        onTap: () async {
          await context.router.pop();
        },
        child: Padding(
          padding: const ProjectPadding.allSmall(),
          child: SizedBox(
            height: 24.h,
            width: 24.w,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorName.neutral200,
                shape: BoxShape.circle,
              ),
              child: Assets.icons.icArroeLeftS
                  .toGetSvgWithColor(color: ColorName.neutral900),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTitleText() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: AutoSizeText(
        LocaleKeys.add_personnel_document_title.tr(),
        style: textTheme.headlineMedium!.copyWith(
          color: ColorName.neutral900,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding buildChipList() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 47.h,
        child: BlocBuilder<ProfileDocumentsBloc, ProfileDocumentsState>(
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: DocumentsChipEnum.values.length,
              itemBuilder: (BuildContext context, int index) {
                return buildChip(index, state);
              },
            );
          },
        ),
      ),
    );
  }

  Padding buildChip(int index, ProfileDocumentsState state) {
    return Padding(
      padding: const ProjectPadding.symmetricXSmallH(),
      child: GestureDetector(
        onTap: () {
          profileDocumentsBloc.changeChipIndex(index);
        },
        child: Chip(
          padding: const ProjectPadding.customChipPaddingLarge(),
          shape: const StadiumBorder(),
          side: BorderSide.none,
          backgroundColor: state.chipIndex == index
              ? ColorName.blueBase
              : ColorName.neutral200,
          label: Row(
            children: [
              AutoSizeText(
                DocumentsChipEnum.values[index].value.tr(),
              ),
              if (selectText(index) != null)
                Padding(
                  padding: const EdgeInsets.only(left: 5).r,
                  child: Badge.count(
                    count: selectText(index) ?? 0,
                    backgroundColor: selectChipBackgroundColor(index),
                    alignment: Alignment.center,
                    smallSize: 18,
                    largeSize: 20,
                    textColor: ColorName.neutral0,
                    textStyle: const TextStyle(fontSize: 11),
                  ),
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
