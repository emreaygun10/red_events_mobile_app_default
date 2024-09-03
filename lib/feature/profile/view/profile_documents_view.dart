import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_container_chip.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_missing_document_item.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_header.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_documents_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/mixin/profile_documents_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_documents_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
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
                buildChipList(profileDocumentsBloc),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            buildListViewTitle(),
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
            child: state.chipIndex
                ? ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const ProjectPadding.scaffold()
                            .copyWith(top: 12, bottom: 12)
                            .r,
                        child: Container(
                          height: 72.h,
                          padding: const ProjectPadding.allMedium(),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorName.neutral200),
                            borderRadius: ProjectBorderRadius.allCircleMedium(),
                          ),
                          child: Row(
                            children: [
                              Assets.icons.icPdfTemp.toGetSvg(),
                              Padding(
                                padding:
                                    const ProjectPadding.symmetricMediumH(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      'Diploma',
                                      style: textTheme.titleLarge,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          AutoSizeText(
                                            '120 KB',
                                            style:
                                                textTheme.titleMedium!.copyWith(
                                              color: ColorName.neutral600,
                                            ),
                                          ),
                                          Padding(
                                            padding: const ProjectPadding
                                                .symmetricXSmallH(),
                                            child: Assets
                                                .icons.icSelectBoxCircleFill
                                                .toGetSvg(),
                                          ),
                                          AutoSizeText(
                                            'Complated',
                                            style:
                                                textTheme.titleMedium!.copyWith(
                                              color: ColorName.neutral600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : ListView(
                    children: [
                      CustomMissingDocumentItem(
                        title: 'Sağlık Raporu',
                        desc: 'Maks 10 Mb',
                        textTheme: textTheme,
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Padding buildListViewTitle() {
    return Padding(
      padding: const ProjectPadding.scaffold().r,
      child: ColoredBox(
        color: ColorName.neutral0,
        child: Row(
          children: [
            BlocBuilder<ProfileDocumentsBloc, ProfileDocumentsState>(
              builder: (context, state) {
                return AutoSizeText(
                  state.chipIndex
                      ? LocaleKeys.add_personnel_document_loaded_documents.tr()
                      : LocaleKeys.add_personnel_document_missing_documents
                          .tr(),
                  style: textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: ColorName.neutral0,
      leadingWidth: 80.w,
      leading: Padding(
        padding: const ProjectPadding.scaffold(),
        child: GestureDetector(
          onTap: () => context.router.pop(),
          child: Container(
            height: 24.h,
            width: 24.w,
            padding: const ProjectPadding.allSmall(),
            decoration: const BoxDecoration(
              color: ColorName.neutral200,
              shape: BoxShape.circle,
            ),
            child: Assets.icons.icArroeLeftS.toGetSvg(),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const ProjectPadding.scaffold(),
          child: Container(
            height: 32.h,
            width: 32.h,
            padding: const EdgeInsets.all(4).r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorName.blueBase,
            ),
            child: const Icon(
              Icons.add,
              color: ColorName.neutral0,
            ),
          ),
        ),
      ],
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

  Padding buildChipList(ProfileDocumentsBloc profileDocumentsBloc) {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(top: 12, bottom: 12).r,
      child: BlocBuilder<ProfileDocumentsBloc, ProfileDocumentsState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomContainerChip(
                chipIndex: state.chipIndex,
                text: LocaleKeys.add_personnel_document_loaded_documents,
                onTap: profileDocumentsBloc.changeChipIndex,
              ),
              CustomContainerChip(
                chipIndex: !state.chipIndex,
                text: LocaleKeys.add_personnel_document_missing_documents,
                onTap: profileDocumentsBloc.changeChipIndex,
              ),
            ],
          );
        },
      ),
    );
  }
}
