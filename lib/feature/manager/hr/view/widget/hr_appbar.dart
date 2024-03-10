part of '../hr_view.dart';

class HrAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const HrAppBarWidget({
    required this.hrBloc,
    super.key,
  });

  final HrBloc hrBloc;
  @override
  State<HrAppBarWidget> createState() => _HrAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HrAppBarWidgetState extends State<HrAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
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
            GestureDetector(
              onTap: () => context.router.push(const PersonnelSearchRoute()),
              child: Assets.icons.icSearch.toGetSvg(),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          buildAppbarIcons(
            GestureDetector(
              // ignore: unnecessary_await_in_return
              onTap: () async {
                final arg = await buildShowModelBottomSheet(context);
                if (arg != null) {
                  widget.hrBloc.bottomSheetActions(arg);
                }
              },
              child: Assets.icons.icMore.toGetSvg(),
            ),
          ),
        ],
      ),
    );
  }

  /// Hr Bottom Sheet
  Future<int?> buildShowModelBottomSheet(BuildContext context) {
    var groupValue = 0;
    return showModalBottomSheet<int>(
      isDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          padding: const ProjectPadding.allNormal(),
          decoration: BoxDecoration(
            color: ColorName.neutral0,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20).r,
              topRight: const Radius.circular(20).r,
            ),
          ),
          height: 400.h,
          width: context.sized.width,
          child: Column(
            children: [
              AppBar(
                leadingWidth: 30.w,
                leading: GestureDetector(
                  onTap: () => context.router.pop(),
                  child: Assets.icons.icCloseCircle
                      .toGetSvgWithColor(color: ColorName.neutral200),
                ),
                centerTitle: true,
                title: AutoSizeText(
                  'İşlemler',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const Divider(
                color: ColorName.neutral200,
              ),
              Expanded(
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          value: index,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value ?? 0;
                            });
                          },
                          title: AutoSizeText(
                            HrBottomSheetEnum.values[index].value.tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: ColorName.neutral200,
                        );
                      },
                      itemCount: HrBottomSheetEnum.values.length,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 56.h,
                width: context.sized.width,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.pushAndPopUntil(
                      predicate: (route) => false,
                      HrRoute(
                        isEditMode: true,
                        groupValue: groupValue,
                        personnelList: [
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                          PersonnelModel(
                            nameSurname: 'Başak Yılmaz Güven',
                            tcNo: '12312312311',
                            birthdate: '22/10/2000',
                            mail: '',
                            phoneNumber: '',
                            workType: 'FT',
                            department: 'Food & Beverage',
                            part: 'Lobi Bar',
                            mission: 'Garson',
                            startDate: '22/10/2023',
                            salary: '15.000',
                          ),
                        ],
                      ),
                    );
                  },
                  child: AutoSizeText(
                    LocaleKeys.general_button_continue.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorName.neutral0),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
}
