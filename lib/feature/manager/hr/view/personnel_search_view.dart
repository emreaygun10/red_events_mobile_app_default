import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/mixin/personnel_search_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/widget/custom_personnel_card_widget.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/widget/empty_list_widget.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/personnel_search_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/state/personnel_search_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_auth_text_form_field.dart';
import 'package:widgets/widgets.dart';

part 'widget/search_app_bar.dart';

@RoutePage()
class PersonnelSearchView extends StatefulWidget {
  const PersonnelSearchView({super.key});

  @override
  State<PersonnelSearchView> createState() => _PersonnelSearchViewState();
}

class _PersonnelSearchViewState extends BaseState<PersonnelSearchView>
    with PersonnelSearchMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => personnelSearchBloc,
      child: Scaffold(
        appBar: const SearchPageAppBar(),
        body: Padding(
          padding: const ProjectPadding.scaffold(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20).r,
                child: BlocListener<PersonnelSearchBloc, PersonnelSearchState>(
                  listener: (context, state) {
                    if (state.text.ext.isNotNullOrNoEmpty) {
                      personnelSearchBloc.changeTextNull(value: false);
                    } else {
                      personnelSearchBloc.changeTextNull(value: true);
                    }
                  },
                  child: CustomTextFormField(
                    labelText: '',
                    leadingAsset: Assets.icons.icSearch.toGetSvg(),
                    textEditingController: searchTextController,
                    hintText: LocaleKeys.manager_hr_search_search_hint,
                    onChanged: listFilter,
                  ),
                ),
              ),
              BlocBuilder<PersonnelSearchBloc, PersonnelSearchState>(
                builder: (context, state) {
                  return state.personnelList != null
                      ? state.personnelList!.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 8).r,
                              child: AutoSizeText(
                                state.isTextNull
                                    ? LocaleKeys.manager_hr_search_last_searh
                                        .tr()
                                    : LocaleKeys.manager_hr_search_searchs.tr(
                                        args: [
                                          if (state.personnelList == null)
                                            '0'
                                          else
                                            state.personnelList!.length
                                                .toString(),
                                        ],
                                      ),
                              ),
                            )
                          : const SizedBox()
                      : const SizedBox();
                },
              ),
              BlocBuilder<PersonnelSearchBloc, PersonnelSearchState>(
                builder: (context, state) {
                  return state.personnelList != null
                      ? state.personnelList!.isNotEmpty
                          ? Expanded(
                              child: ListView.separated(
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                itemCount: state.personnelList?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return CustomPersonnelCardWidget(
                                    isEditMode: false,
                                    personnelModel: state.personnelList![index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 5.h,
                                  );
                                },
                              ),
                            )
                          : const EmptyListWidget()
                      : const EmptyListWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
