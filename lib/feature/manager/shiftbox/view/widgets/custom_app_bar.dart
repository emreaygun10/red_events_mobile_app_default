part of '../shiftbox_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
