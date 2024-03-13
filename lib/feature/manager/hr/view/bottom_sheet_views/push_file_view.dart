import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/mixin/custom_file_list_tile_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/mixin/push_file_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/widget/custom_solid_bottom_sheet_with_link.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/custom_file_list_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/models/file_model.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/push_file_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/state/custom_file_list_tile_state.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/state/push_file_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

part '../widget/custom_file_list_tile.dart';

@RoutePage()
class PushFileView extends StatefulWidget {
  const PushFileView({super.key});

  @override
  State<PushFileView> createState() => _PushFileViewState();
}

final class _PushFileViewState extends BaseState<PushFileView>
    with PushFileMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => pushFileBloc,
      child: Scaffold(
        appBar: buildAppBar(context),
        bottomSheet: CustomSolidBottomSheetWithLink(
          baseTitle: LocaleKeys.manager_bottom_sheet_push_notification_success,
          subTitle: 'dkfjghdfhjkfhddkhjfghdfaldsaldlfdghdfjghadjhajd',
          icon: Assets.icons.icExcel.toGetSvg(),
          solidController: solidController,
          textEditingController: textEditingController,
          route: HrRoute(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const ProjectPadding.scaffold()
                  .copyWith(top: 30, bottom: 30)
                  .r,
              child: AutoSizeText(
                LocaleKeys.manager_bottom_sheet_push_file_list_title.tr(),
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Padding(
              padding: ProjectPadding.scaffold(),
              child: Divider(
                color: ColorName.neutral200,
                height: 2,
              ),
            ),
            buildListView(),
            buildButton(context),
          ],
        ),
      ),
    );
  }

  Container buildButton(BuildContext context) {
    return Container(
      padding: const ProjectPadding.scaffold().copyWith(top: 16, bottom: 30),
      height: 89.h,
      width: context.sized.width,
      color: ColorName.neutral0,
      child: SizedBox(
        height: 59,
        width: context.sized.width,
        child: BlocBuilder<PushFileBloc, PushFileState>(
          builder: (context, state) {
            return ElevatedButton(
              child: AutoSizeText(
                LocaleKeys.manager_bottom_sheet_push_file_button.tr(
                  args: [
                    if (state.selectedFiles.ext.isNotNullOrEmpty)
                      state.selectedFiles!.length.toString()
                    else
                      '0',
                  ],
                ),
                style:
                    textTheme.titleLarge!.copyWith(color: ColorName.neutral0),
              ),
              onPressed: () {
                textEditingController.text = 'shiftbox.com/appshare453472342';
                solidController.show();
              },
            );
          },
        ),
      ),
    );
  }

  Expanded buildListView() {
    return Expanded(
      child: BlocBuilder<PushFileBloc, PushFileState>(
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const ProjectPadding.scaffold(),
                child: CustomFileListTile(
                  fileModel: state.filesList![index],
                  pushFileBloc: pushFileBloc,
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 12.h,
            ),
            itemCount: state.filesList!.length,
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 90,
      titleSpacing: 0,
      surfaceTintColor: Colors.transparent,
      leading: Padding(
        padding: const ProjectPadding.symmetricSmallV(),
        child: GestureDetector(
          onTap: () => context.router.pop(),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorName.neutral200,
            ),
            child: Assets.icons.icArroeLeftS.toGetSvg(),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        LocaleKeys.manager_bottom_sheet_push_file_push_file_title.tr(),
        style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
