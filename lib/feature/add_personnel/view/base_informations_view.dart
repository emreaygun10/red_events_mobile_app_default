import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/add_personnel_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/mixin/add_personnel_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/state/add_personnel_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_personnel_top_stack.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class BaseInformationView extends StatefulWidget {
  const BaseInformationView({super.key});

  @override
  State<BaseInformationView> createState() => _BaseInformationViewState();
}

class _BaseInformationViewState extends BaseState<BaseInformationView>
    with AddPersonnelMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: BlocProvider(
        create: (context) => addPersonnelViewModel,
        child: ListView(
          padding: EdgeInsets.zero,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const CustomPersonnelTopStack(
              linearProgressEnum: LinearProgressEnum.levelOne,
            ),
            GestureDetector(
              onTap: () async {
                await showDialog2();
              },
              child: Center(
                child: SizedBox(
                  height: 80.h,
                  child: BlocBuilder<AddPersonnelViewModel, AddPersonnelState>(
                    builder: (context, state) {
                      return Stack(
                        alignment: state.isImageSelected
                            ? Alignment.center
                            : Alignment.bottomRight,
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: const BoxDecoration(
                              color: ColorName.neutral200,
                              shape: BoxShape.circle,
                            ),
                            child: state.isImageSelected
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      state.imageFile!,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )
                                : Assets.icons.icPickPerson
                                    .svg(package: ModuleEnum.gen.value),
                          ),
                          if (!state.isImageSelected)
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: ColorName.blueLight,
                                shape: BoxShape.circle,
                              ),
                              child: Assets.icons.icCamera
                                  .svg(package: ModuleEnum.gen.value),
                            )
                          else
                            const SizedBox(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Assets.icons.icLogoDark
          .svg(package: ModuleEnum.gen.value, height: 40, width: 40),
      backgroundColor: Colors.transparent,
      leadingWidth: 70.w,
      leading: InkWell(
        onTap: () => context.router.pop(),
        child: Padding(
          padding: const ProjectPadding.scaffold(),
          child: Container(
            padding: const EdgeInsets.all(6),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: ColorName.blueLight,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Assets.icons.icArrowLeftLine.svg(
                package: ModuleEnum.gen.value,
                color: ColorName.blueBase,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showDialog2() {
    return Platform.isAndroid
        ? showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return Container();
            },
          )
        : showCupertinoModalPopup(
            context: context,
            builder: (context) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  child: const Text('Photo Gallery'),
                  onPressed: () async {
                    // close the options modal
                    Navigator.of(context).pop();
                    // get image from gallery
                    await getPhoto(ImageSource.gallery);
                  },
                ),
                CupertinoActionSheetAction(
                  child: const Text('Camera'),
                  onPressed: () async {
                    // close the options modal
                    Navigator.of(context).pop();
                    // get image from camera
                    await getPhoto(ImageSource.camera);
                  },
                ),
              ],
            ),
          );
  }
}
