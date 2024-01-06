part of '../../feature/add_personnel/view/add_personnel_view.dart';

/// Custom List Object For Add Personnel
class CustomListContainer extends StatelessWidget {
  /// Custom List construct
  const CustomListContainer({
    required this.preFix,
    required this.text,
    super.key,
    this.postFix,
  });

  /// Prefix Widget
  final Widget preFix;

  /// List title string
  final String text;

  /// Post Widget
  final Widget? postFix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: Container(
        padding: const EdgeInsets.only(
          left: 14,
          right: 16,
          top: 14,
          bottom: 14,
        ).r,
        height: 64.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: ColorName.neutral100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 9).r,
                  child: Container(
                    width: 36,
                    height: 36,
                    padding: const EdgeInsets.all(6),
                    decoration: ShapeDecoration(
                      color: ColorName.neutral200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(96),
                      ),
                    ),
                    child: Center(
                      child: preFix,
                    ),
                  ),
                ),
                AutoSizeText(
                  text.tr(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            if (postFix != null)
              Container(
                width: 36,
                height: 36,
                padding: const EdgeInsets.all(6),
                decoration: ShapeDecoration(
                  color: ColorName.neutral700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(96),
                  ),
                ),
                child: Center(
                  child: postFix,
                ),
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
