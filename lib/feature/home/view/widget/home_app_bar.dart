part of '../home_view.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
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
        title: const AutoSizeText('Good Morning, Pınar'),
        subtitle: AutoSizeText(
          'How can we help you?',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: ColorName.neutral400),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print('Notificaitonss');
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Assets.icons.icNotification4Line.toGetSvg(),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
