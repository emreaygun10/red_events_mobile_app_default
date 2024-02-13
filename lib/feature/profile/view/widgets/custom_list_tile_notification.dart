part of '../profile_notification_view.dart';

class CustomListTileNotification extends StatefulWidget {
  const CustomListTileNotification({
    required this.textTheme,
    required this.dataModel,
    required this.isVisible,
    required this.profileNotificationBloc,
    super.key,
  });

  final TextTheme textTheme;
  final DataModel dataModel;
  final bool isVisible;
  final ProfileNotificationBloc profileNotificationBloc;

  @override
  State<CustomListTileNotification> createState() =>
      _CustomListTileNotificationState();
}

class _CustomListTileNotificationState
    extends BaseState<CustomListTileNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: context.sized.width,
      padding: const ProjectPadding.allSmall(),
      decoration: BoxDecoration(
        color: widget.dataModel.isCheck
            ? ColorName.blueLight
            : widget.isVisible
                ? ColorName.neutral0
                : widget.dataModel.isRead
                    ? ColorName.neutral0
                    : ColorName.orangeLight,
        borderRadius: ProjectBorderRadius.allCircleMedium(),
      ),
      child: BlocBuilder<ProfileNotificationBloc, ProfileNotificationState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Visibility(
                    visible: widget.isVisible,
                    child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                          width: 2,
                          color: ColorName.neutral300,
                        ),
                      ),
                      activeColor: ColorName.blueBase,
                      value: widget.dataModel.isCheck,
                      onChanged: (value) {
                        widget.profileNotificationBloc.changeModelInList(
                          model: widget.dataModel,
                          value: value ?? false,
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.dataModel.isRead
                            ? ColorName.neutral300
                            : ColorName.orangeLight,
                      ),
                      shape: BoxShape.circle,
                      color: widget.dataModel.isRead
                          ? ColorName.neutral100
                          : ColorName.orangeBase,
                    ),
                    child: Assets.icons.icCloseCircle.toGetSvgWithColor(
                      color: widget.dataModel.isRead
                          ? ColorName.neutral300
                          : ColorName.neutral0,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  Padding(
                    padding: const ProjectPadding.symmetricMediumH(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            widget.dataModel.title.tr(),
                            style: widget.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            widget.dataModel.subTitle.tr(),
                            style: widget.textTheme.titleSmall!.copyWith(
                              color: ColorName.neutral400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: !widget.dataModel.isRead,
                child: Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: ColorName.orangeBase,
                    border: Border.all(
                      color: ColorName.neutral0,
                      width: 5,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
