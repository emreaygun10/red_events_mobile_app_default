import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class CustomDailyPartContainer extends StatelessWidget {
  const CustomDailyPartContainer({
    required this.list,
    required this.hour,
    required this.location,
    super.key,
  });
  final List<String> list;
  final String hour;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12).h,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorName.neutral200),
          borderRadius: ProjectBorderRadius.allCircleNormal(),
        ),
        child: Column(
          children: [
            buildListTile(
              context: context,
              hours: '$hour - ',
              location: location,
            ),
            if (list.isNotEmpty)
              Container(
                constraints: BoxConstraints(
                  minHeight: 100.h,
                  minWidth: double.infinity,
                  maxHeight: 250.h,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return index < list.length
                        ? Slidable(
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (ctx) async {},
                                  backgroundColor: ColorName.redBase,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                ),
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: ColorName.orangeBase,
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                  padding: const ProjectPadding.allSmall().r,
                                ),
                              ],
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ).r,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3).r,
                                    height: 20.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: RadialGradient(
                                        colors: [
                                          ColorName.greenBase,
                                          ColorName.greenDark,
                                        ],
                                      ),
                                    ),
                                    child: Assets.icons.icCheckLine.toGetSvg(),
                                  ),
                                  Text(
                                    list[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(color: ColorName.neutral900),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : buildAddPersonnel(context);
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: ColorName.neutral200,
                  ),
                  itemCount: list.length + 1,
                ),
              )
            else
              buildAddPersonnel(context),
          ],
        ),
      ),
    );
  }

  ListTile buildAddPersonnel(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const Icon(
        Icons.add,
        color: ColorName.blueDark,
      ),
      title: Text(
        'Personnel Ekle',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorName.blueDark,
            ),
      ),
    );
  }

  /// Detail hours and location part of daily
  Container buildListTile({
    required BuildContext context,
    required String hours,
    required String location,
    void Function()? onTap,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorName.neutral100,
      ),
      child: ListTile(
        leading: Assets.icons.icDownArrow.toGetSvg(),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: hours,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              TextSpan(
                text: location,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorName.neutral500,
                    ),
              ),
            ],
          ),
        ),
        trailing: IconButton(
          onPressed: onTap,
          icon: const Icon(Icons.more_horiz),
        ),
      ),
    );
  }
}
