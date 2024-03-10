import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/mixin/custom_personnel_card_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/widget/custom_circle_avatar.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/hr_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/personnel_card_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/state/personnel_card_state.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

class CustomPersonnelCardWidget extends StatefulWidget {
  const CustomPersonnelCardWidget({
    required this.isEditMode,
    required this.personnelModel,
    this.hrBloc,
    super.key,
  });

  final bool isEditMode;

  final PersonnelModel personnelModel;

  final HrBloc? hrBloc;

  @override
  State<CustomPersonnelCardWidget> createState() =>
      _CustomPersonnelCardWidgetState();
}

class _CustomPersonnelCardWidgetState
    extends BaseState<CustomPersonnelCardWidget> with CustomPersonnelCardMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => personnelCardBloc,
      child: BlocBuilder<PersonnelCardBloc, PersonnelCardState>(
        builder: (context, state) {
          return Container(
            padding: const ProjectPadding.allMedium(),
            height: 76.h,
            width: context.sized.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: state.personnelModel!.isCheck
                    ? ColorName.blueBase
                    : ColorName.neutral200,
              ),
              borderRadius: ProjectBorderRadius.allCircleMedium(),
              color: state.personnelModel!.isCheck
                  ? ColorName.blueLighter
                  : ColorName.neutral0,
              boxShadow: const [
                BoxShadow(
                  color: ColorName.neutral300,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                  blurStyle: BlurStyle.solid,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (widget.isEditMode)
                      Checkbox(
                        value: state.personnelModel!.isCheck,
                        onChanged: onChanged,
                      )
                    else
                      const SizedBox(),
                    const CustomCircleAvatar(
                      url:
                          'https://gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50)',
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            AutoSizeText(
                              widget.personnelModel.nameSurname,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: ColorName.neutral700,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Padding(
                              padding: const ProjectPadding.symmetricXSmallH(),
                              child: Container(
                                width: 24.w,
                                height: 16.h,
                                decoration: BoxDecoration(
                                  color: ColorName.neutral200,
                                  borderRadius:
                                      ProjectBorderRadius.allCircleNormal(),
                                ),
                                child: const Center(child: AutoSizeText('FT')),
                              ),
                            ),
                          ],
                        ),
                        Text.rich(
                          TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: ColorName.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                            children: [
                              TextSpan(text: widget.personnelModel.department),
                              const TextSpan(text: '-'),
                              TextSpan(text: widget.personnelModel.part),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Assets.icons.icStarFill.toGetSvg(),
                        AutoSizeText(
                          '(4.5)',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorName.neutral700,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ],
                    ),
                    Assets.icons.icWhatsApp.toGetSvg(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
