import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:widgets/widgets.dart';

class CustomRequestCard extends StatelessWidget {
  const CustomRequestCard({
    required this.icon,
    required this.request,
    required this.date,
    required this.description,
    required this.explanation,
    this.isReportRequest = false,
    super.key,
  });
  final Widget icon;
  final String request;
  final String date;
  final String description;
  final String explanation;
  final bool isReportRequest;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () => context.router.push(
          ProfileRequestDetailRoute(
            permissionColor: ColorName.redLight,
            iconColor: ColorName.redBase,
          ),
        ),
        child: Container(
          // height: 125.h,
          width: 335.w,
          padding: const ProjectPadding.allNormal(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20).r,
            color: ColorName.neutral0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  buildCircleImage(),
                  Padding(
                    padding: const ProjectPadding.symmetricMediumH(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTitleRow(),
                        buildDescription(),
                      ],
                    ),
                  ),
                ],
              ),
              if (!isReportRequest) buildDivider() else const SizedBox(),
              if (!isReportRequest) buildExplanation() else const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildDescription() {
    return SizedBox(
      width: 230.w,
      child: AutoSizeText(
        description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Row buildExplanation() {
    return Row(
      children: [
        Assets.icons.icStickyNoteLine.toGetSvg(),
        AutoSizeText(
          explanation,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Padding buildDivider() {
    return const Padding(
      padding: ProjectPadding.symmetricMediumV(),
      child: Divider(
        height: 4,
        color: ColorName.neutral300,
      ),
    );
  }

  SizedBox buildTitleRow() {
    return SizedBox(
      width: 230.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(request),
          AutoSizeText(date),
        ],
      ),
    );
  }

  Container buildCircleImage() {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: ColorName.orangeBase,
        ),
        shape: BoxShape.circle,
        color: ColorName.orangeLight,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8).r,
        child: icon,
      ),
    );
  }
}
