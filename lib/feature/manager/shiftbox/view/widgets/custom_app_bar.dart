part of '../shiftbox_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = <Widget>[
      Assets.icons.icSettings.toGetSvgWithColor(
        height: 25.h,
        color: ColorName.neutral900,
      ),
      Assets.icons.icShieldUser.toGetSvgWithColor(
        height: 25.h,
        color: ColorName.neutral900,
      ),
      Assets.icons.icDownloadCloud.toGetSvgWithColor(
        height: 25.h,
        color: ColorName.neutral900,
      ),
      Assets.icons.icMailSend.toGetSvgWithColor(
        height: 25.h,
        color: ColorName.neutral900,
      ),
      Assets.icons.icAddUser.toGetSvgWithColor(
        height: 25.h,
        color: ColorName.neutral900,
      ),
    ];
    return AppBar(
      toolbarHeight: preferredSize.height,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leadingWidth: 60,
      leading: const Padding(
        padding: EdgeInsets.only(left: 12),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
          ),
        ),
      ),
      title: ListTile(
        title: const AutoSizeText('Günaydın, Burak'),
        subtitle: AutoSizeText(
          'How can we help you?',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: ColorName.neutral400),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20).r,
          child: Row(
            children: [
              BuildAppBarActions(
                icon: Icons.more_horiz,
                onTap: () async {
                  await showModalBottomSheet<void>(
                    showDragHandle: true,
                    context: context,
                    builder: (context) => SizedBox(
                      width: context.sized.width,
                      child: Column(
                        children: [
                          AutoSizeText(
                            'İşlemler',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) => ListTile(
                                onTap: () => context.router.push(
                                  OperationPersonnelListRoute(
                                    operationType: OperationsEnum.values[index],
                                  ),
                                ),
                                leading: list[index],
                                title: AutoSizeText(
                                  OperationsEnum.values[index].text,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: OperationsEnum.values.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector BuildAppBarActions({
    required IconData icon,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3).r,
        height: 24.h,
        width: 24.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorName.neutral0,
        ),
        child: Icon(
          icon,
          size: 19.r,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
