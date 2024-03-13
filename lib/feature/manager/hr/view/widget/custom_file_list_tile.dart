part of '../bottom_sheet_views/push_file_view.dart';

class CustomFileListTile extends StatefulWidget {
  const CustomFileListTile({
    required this.fileModel,
    required this.pushFileBloc,
    super.key,
  });
  final FileModel fileModel;
  final PushFileBloc pushFileBloc;

  @override
  State<CustomFileListTile> createState() => _CustomFileListTileState();
}

class _CustomFileListTileState extends BaseState<CustomFileListTile>
    with CustomFileListTileMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => customFileListTileBloc,
      child: Container(
        padding: const ProjectPadding.allMedium().copyWith(left: 0),
        decoration: BoxDecoration(
          color: ColorName.neutral0,
          border: Border.all(
            color: ColorName.neutral200,
          ),
          borderRadius: ProjectBorderRadius.allCircleNormal(),
        ),
        child: BlocBuilder<CustomFileListTileBloc, CustomFileListTileState>(
          builder: (context, state) {
            return ListTile(
              leading: Checkbox(
                value: state.fileModel.value,
                onChanged: (value) {
                  if (value != null) {
                    customFileListTileBloc.changeValue(value: value);
                    widget.pushFileBloc.changeSelectedList(state.fileModel);
                  }
                },
              ),
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12).r,
                    child: Assets.icons.icPdfTemp.toGetSvg(),
                  ),
                  AutoSizeText(
                    widget.fileModel.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorName.neutral900,
                        ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
