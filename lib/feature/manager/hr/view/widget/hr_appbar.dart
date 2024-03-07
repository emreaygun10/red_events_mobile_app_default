part of '../hr_view.dart';

class HrAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HrAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leadingWidth: 43.w,
        leading: Padding(
          padding: const EdgeInsets.all(8).r,
          child: buildAppbarIcons(
            Assets.icons.icCalendar.toGetSvgWithColor(
              color: ColorName.neutral400,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
        title: Column(
          children: [
            AutoSizeText(LocaleKeys.manager_hr_title.tr()),
            AutoSizeText(LocaleKeys.manager_hr_sub_title.tr(args: ['932'])),
          ],
        ),
        actions: [
          buildAppbarIcons(
            Assets.icons.icSearch.toGetSvg(),
          ),
          SizedBox(
            width: 8.w,
          ),
          buildAppbarIcons(
            Assets.icons.icMore.toGetSvg(),
          ),
        ],
      ),
    );
  }

  Container buildAppbarIcons(Widget icon) {
    return Container(
      height: 24.h,
      width: 24.w,
      padding: const ProjectPadding.allXSmall(),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorName.neutral200,
      ),
      child: icon,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
