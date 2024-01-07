import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/document_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/state/document_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_personnel_top_stack.dart';
import 'package:widgets/widgets.dart';

class DocumentsView extends StatefulWidget {
  const DocumentsView({required this.context, super.key});

  final BuildContext context;

  @override
  State<DocumentsView> createState() => _DocumentsViewState();
}

class _DocumentsViewState extends BaseState<DocumentsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DocumentCubit(),
      child: ListView(
        padding: EdgeInsets.zero,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          BlocBuilder<DocumentCubit, DocumentState>(
            builder: (context, state) {
              return CustomPersonnelTopStack(
                linearProgressEnum: state.linearProgressEnum,
                text: LocaleKeys.add_personnel_document_title,
              );
            },
          ),
          Padding(
            padding: const ProjectPadding.scaffold(),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    LocaleKeys.add_personnel_document_desc.tr(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(
                    height: 72.h,
                    child: DottedBorder(
                      color: ColorName.neutral400,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(20),
                      dashPattern: const [12, 12, 12, 12],
                      child: Padding(
                        padding: const ProjectPadding.allMedium(),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10).r,
                                height: 40.h,
                                width: 40.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorName.neutral300,
                                ),
                                child: Assets.icons.icFile
                                    .svg(package: ModuleEnum.gen.value),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 209.w,
                                    child: const AutoSizeText('Sabıka Kaydı'),
                                  ),
                                  const AutoSizeText('Maks 10 mb'),
                                ],
                              ),
                              Assets.icons.icPlus
                                  .svg(package: ModuleEnum.gen.value),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
