import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/bottom_sheet_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/mixin/bottom_sheet_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/bottom_sheet_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

final class CustomShowModalBottomSheet extends StatefulWidget {
  const CustomShowModalBottomSheet({
    super.key,
  });

  @override
  State<CustomShowModalBottomSheet> createState() =>
      _CustomShowModalBottomSheetState();
}

class _CustomShowModalBottomSheetState
    extends BaseState<CustomShowModalBottomSheet> with BottomSheetMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bottomSheetBloc,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20).r,
        child: BlocBuilder<BottomSheetBloc, BottomSheetState>(
          builder: (context, state) {
            return buildColumnSelectRequest(state);
          },
        ),
      ),
    );
  }

  Column buildColumnSelectRequest(BottomSheetState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          LocaleKeys.profile_requests_request_type_title.tr(),
          style: textTheme.bodyLarge,
        ),
        divider(),
        ListTile(
          title: AutoSizeText(
            LocaleKeys.profile_requests_request_type_request_to_permission.tr(),
          ),
          leading: Radio(
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return state.groupIndex == 1
                  ? ColorName.blueBase
                  : ColorName.neutral300;
            }),
            value: 1,
            groupValue: state.groupIndex,
            onChanged: (value) {
              bottomSheetBloc.changeGroupIndex(value);
            },
          ),
        ),
        divider(),
        ListTile(
          title: AutoSizeText(
            LocaleKeys.profile_requests_request_type_request_to_advance_payment
                .tr(),
          ),
          leading: Radio(
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return state.groupIndex == 2
                  ? ColorName.blueBase
                  : ColorName.neutral300;
            }),
            value: 2,
            groupValue: state.groupIndex,
            onChanged: (value) {
              bottomSheetBloc.changeGroupIndex(value);
            },
          ),
        ),
        divider(),
        ListTile(
          title: AutoSizeText(
            LocaleKeys.profile_requests_request_type_report_notification.tr(),
          ),
          leading: Radio(
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return state.groupIndex == 3
                  ? ColorName.blueBase
                  : ColorName.neutral300;
            }),
            value: 3,
            groupValue: state.groupIndex,
            onChanged: (value) {
              bottomSheetBloc.changeGroupIndex(value);
            },
          ),
        ),
        divider(),
        ListTile(
          title: AutoSizeText(
            LocaleKeys.profile_requests_request_type_request_to_leave.tr(),
          ),
          leading: Radio(
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return state.groupIndex == 4
                  ? ColorName.blueBase
                  : ColorName.neutral300;
            }),
            value: 4,
            groupValue: state.groupIndex,
            onChanged: (value) {
              bottomSheetBloc.changeGroupIndex(value);
            },
          ),
        ),
        divider(),
        ListTile(
          title: AutoSizeText(
            LocaleKeys.profile_requests_request_type_others.tr(),
          ),
          leading: Radio(
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return state.groupIndex == 5
                  ? ColorName.blueBase
                  : ColorName.neutral300;
            }),
            value: 5,
            groupValue: state.groupIndex,
            onChanged: (value) {
              bottomSheetBloc.changeGroupIndex(value);
            },
          ),
        ),
        continuosButton(state),
      ],
    );
  }

  Divider divider() {
    return const Divider(
      color: ColorName.neutral200,
      height: 2,
    );
  }

  SizedBox continuosButton(BottomSheetState state) {
    return SizedBox(
      height: 40.h,
      width: context.sized.width,
      child: ElevatedButton(
        onPressed: () {
          //context.router.push(const HomeRoute());
          switch (state.groupIndex) {
            case 1:
              context.router.push(const ProfileRequestPermissionRoute());

            default:
          }
        },
        child: AutoSizeText(
          'Devam',
          style: textTheme.labelSmall,
        ),
      ),
    );
  }
}
